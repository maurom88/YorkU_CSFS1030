# YorkU_CSFS1030

## How to use this repository

### Contents

- [Samples](./samples/) contains code samples for creating and working with databases.

- [Docker](./docker/) contains the files needed to use `docker compose` to create the containers used to launch and work on the database locally.

### Clone the repository:

1. Click `Code` on the top right and copy the `HTTPS` URL.
1. Open a command line interface on your computer and navigate to a location where you want to store the repository (remember that you can use `cd` to move around and `mkdir` to create new directories). Commands may vary depending on the OS that you are using.
1. Use `clone <copied URL>` to clone the repository. Git will automatically create, in your current location, a new directory with the name and contents of the repository.
1. You can now open the newly created directory (called YorkU_CSFS1030) using VS Code or your preferred IDE.

### Launch MySQL

1. Make sure to have access to LinkedIn Learning using your York University account as described here: [Use online skill development and career building tools | YorkU](https://careers.yorku.ca/student_topic/use-online-learning-tools). 
1. Install Docker and Docker Compose. See [official Docker docs](https://docs.docker.com/get-docker/) (Docker Compose is automatically included in the install for both Windows and Mac).
1. Review how to use Docker as explained in [Become a Database Administrator: Set Up a Database Playground](https://www.linkedin.com/learning/database-foundations-intro-to-databases/purpose-of-the-playground?autoSkip=true&autoplay=true&contextUrn=urn%3Ali%3AlyndaLearningPath%3A60d27301498e1230e45e3f0f&resume=false&u=2174970) (requires access to LinkedIn Learning).
1. Make sure Docker is running.
1. Using the command line, navigate into the [docker folder](./docker) and run `docker-compose up -d` (if using Linux, you might need to run this command as a Super User, for example with `sudo`).
1. The previous command will have created two containers, that you can see with `docker ps`. If you don't see the two containers (called `mysql` and `adminer`), then something went wrong and your MySQL server is not running.

### Connect to MySQL

1. Install MySQL Workbench. See [MySQL Workbench download page](https://dev.mysql.com/downloads/workbench/).
1. Launch MySQL Workbench and create a new connection with the following details:
   - Hostname: `127.0.0.1`
   - Port: 3308
   - Username: `root`
   - Password (when prompted): `root`
   Click `Test connection`, then `Close` and click on the newly created connection to connect to the database.