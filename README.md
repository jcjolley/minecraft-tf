# Minecraft Server on GCP
In one CLI-command, spin up a Minecraft Server using premptible instances that terminates when not in use and spins up somewhat quickly.

In a bash terminal, run ./setup.sh to get started.

![image](https://user-images.githubusercontent.com/2086176/172011170-1ab877c7-f7d2-419e-8988-07282b905405.png)


## NOTE
There are still some things hard coded that shouldn't be hard coded


# Architecture 

![image](https://user-images.githubusercontent.com/2086176/172054722-a920470e-2a24-4d19-a9e3-3037513515ee.png)

## Cloud functions: 
### Get Server Status
This function checks if the server is up or not, and if it's up, reports how many players are currently connected.

### Shutdown server
This function calls get server status, and if the server is up, but contains 0 players, terminates the compute instance.
This function is called every 20 minutes by a cloud scheduler

### Startup server
This function starts the compute instance and returns an HTML page that polls get server status and reports the status on the site

## Compute Instance
This is a premptibe compute instance with an SSD attached.
The SSD has a daily backup schedule that keeps the last 3 days state so that if something goes wrong and you play frequently enough, you can restore the server

# Scripts
![image](https://user-images.githubusercontent.com/2086176/172058481-e1d93a31-293b-4b2a-bdc3-aad8e0f524f8.png)

# Terraform
![image](https://user-images.githubusercontent.com/2086176/172058685-470f2e24-67cd-42c0-a290-12e3925d9a12.png)
