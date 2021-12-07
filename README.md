# latana

It's a simple web server application in Ruby that use CRAN server to extract all the required information for each package and save in database.

And background is running to make sure we are getting up to date information about that package.

### Key files

    
    app
    ├── controller
    │      └── packages controller                             
    │
    ├── models                    
    │      └── packages
    ├── clients
    │      ├── cran 
    │      │     └── packages               
    │      └── cran
    │             └── package list(with description)
    ├── jobs                    
    │      └── update package list
    ├── task                    
    │      └── update package list


### Workflow - How does it work?

The following diagram show the process/workflow of the application.


 
    │    1. Background job get all packges      │ 
    ├────────────────────────────────────────────>│     
    │                                             ├ 2. and get description
    │                                             │ of each package
    │    3. save package information              │               
    │<────────────────────────────────────────────│
    │                                             │
    │    4. show package information on web page  │
    ├────────────────────────────────────────────>│ 
    │                                             ├ 5. create  URL    
    │    6. show description                      │ 
    │<────────────────────────────────────────────│

**Setup**

* first clone the directory 
                      ```
                      git clone git@github.com:sajjadmurtaza/latana.git'
                      ```
 *  ```cd latana```
 *  ```bundle install ```
 *  ```rake db:migrate ```
 *  ```rails s ```

 on Next tab 

 run ```bundle exec sidekiq -C config/sidekiq.yml```

 For now job will run after each minute(to check that it's working, can change it)


**Rake task**
  ```rake db:update_packages_list```   

  to update manually package list


**Main files**
Sidekiq config
- https://github.com/sajjadmurtaza/latana/blob/main/config/sidekiq.yml

Service:
  - https://github.com/sajjadmurtaza/latana/blob/main/app/clients/cran/packages.rb
  - https://github.com/sajjadmurtaza/latana/blob/main/app/clients/cran/package_list.rb      

Job:
- https://github.com/sajjadmurtaza/latana/blob/main/app/jobs/update_packages_list_job.rb

rake task:
- https://github.com/sajjadmurtaza/latana/blob/main/lib/tasks/update_packages_list.rake
