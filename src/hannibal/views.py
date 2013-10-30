#!/usr/bin/env python
# Licensed to Cloudera, Inc. under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  Cloudera, Inc. licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from desktop.lib.django_util import render
from django.core.exceptions import ObjectDoesNotExist
import datetime
from hannibal.forms import SettingsForm
from hannibal.models import Settings
from django.shortcuts import redirect
    
def get_settings():
    try:
        settings = Settings.objects.get()
    except ObjectDoesNotExist:
        settings = Settings(host_url='http://')
        settings.save()
    return settings
    
def index(request):
  settings = get_settings()
  return render('index.mako', request, dict(settings=settings))
  
def settings(request, cause=None):
    settings = get_settings()
    if request.method == 'POST': # If the form has been submitted...
        form = SettingsForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Process the data in form.cleaned_data
            # ...
            settings.host_url = form.cleaned_data['host_url']
            settings.save()
            return redirect('/hannibal') # Redirect after POST
    else:
        form = SettingsForm({'host_url': settings.host_url})

    return render('settings.mako', request, dict(form=form, cause=cause))
    

def hannibal_not_available(request):
  return settings(request, "not_available")