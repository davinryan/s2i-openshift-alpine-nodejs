
# Creating a basic S2I builder image  

## Getting started  

### Files and Directories  
| File                              | Required? | Description                                                  |
|-----------------------------------|-----------|--------------------------------------------------------------|
| Dockerfile                        | Yes       | Defines the base builder image                               |
| s2i/root/local/s2i/assemble       | Yes       | Script that builds the application                           |
| s2i/root/local/s2i/usage          | No        | Script that prints the usage of the builder                  |
| s2i/root/local/s2i/run            | Yes       | Script that runs the application                             |

### Dockerfile
Create a *Dockerfile* that installs all of the necessary tools and libraries that are needed to build and run our application.  This file will also handle copying the s2i scripts into the created image.

### S2I scripts

#### assemble
Create an *assemble* script that will build our application, e.g.:
- build nodejs app with production dependencies

#### run
Create a *run* script that will start the application. 

#### usage (optional) 
Create a *usage* script that will print out instructions on how to use the image.

#### Make the scripts executable 
Make sure that all of the scripts are executable by running *chmod +x s2i/root/local/s2i/**

### Create the builder image
The following command will create a builder image named s2i-openshift-alpine-nodejs based on the Dockerfile that was created previously.
```
docker build -t s2i-openshift-alpine-nodejs .
```
The builder image can also be created by using the *make* command since a *Makefile* is included.

Once the image has finished building, the command *s2i usage s2i-openshift-alpine-nodejs* will print out the help info that was defined in the *usage* script.

### Create an openshift images from this s2i builder
s2i build https://github.com/davinryan/openshift-jenkins-nodejs-example.git s2i-openshift-alpine-nodejs openshift-jenkins-nodejs-example