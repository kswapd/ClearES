## 1. What's this
An script file to delete expired elasticsearch indices.

## 2. How to use
  ```
     ./clear.sh ES_ADDR expiredtime
     
  ```
  eg:
  ```
    ./clear.sh localhost:8080 8
  ```
  This will delete indices created 8 days before.
  
  To use it with crontab, you can keep elasticsearch data in recent n days.
