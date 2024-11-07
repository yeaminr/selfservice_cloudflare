## The Onboarding Workflow

The Onboarding Workflow in Selfservice repo has below objectives:

1. Take basic information about tenant/app 
2. Create a tenant repo with template files
3. Create a yaml file that maps tenant repos vs CF Zones, this can be used as source of truth for authorization while executing any zone related terraform/python code from the DHP runner later.

The expected SOP for this is:

1. Fork the selfservice repo
2. Create a new folder under `/tenants/`. The name of the folder should match 'application_name'.
3. Copy the template file `tenant_onboarding_settings.yml` from `/resource/templates` folder into the newly created tenant folder.
4. Modify the `tenant_onboarding_settings.yml` file to reflect correct parameter values
5. Raise a pull request.
6. The workflow `tenant_onboarding.yml` gets triggered and executes the objectives mentioned above (it runs terraform to create the github tenant repo).
7. Find the newly creatd tenant repo by searching "application-name".
