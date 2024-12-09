
# gitlab managed terraform-state

```bash
terraform {
  backend "http" {
    address = "https://gitlab.com/api/v4/projects/<PROJECT_ID>/terraform/state/<STATE_NAME>"
    lock_address = "https://gitlab.com/api/v4/projects/<PROJECT_ID>/terraform/state/<STATE_NAME>/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/<PROJECT_ID>/terraform/state/<STATE_NAME>/lock"
    username = "<USERNAME>"
    password = "<ACCESS_TOKEN>"
    lock_method = "POST"
    unlock_method = "DELETE"
    retry_wait_min = 5
  }
}
```