
Rbbt Jenkins Slave Image
========================

Jenkins Slave Image Generated By Packer

<img src="https://cdn-images-1.medium.com/max/1400/1*wDiZP99A1N-SBbn3Bn6AuA.png" width="600px">

#### Dependencies
* [Packer](https://www.packer.io/) 
* [AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

#### Description
The project consists of a Packer template file (`slave.json`) wich Packer uses as its main entry point in order to build the image.
Packer will start an EC2 instance and it will build the image based on the configuration of the template file. As soon as the build finishes the EC2 instance will terminate.
During the build of the image there'll be running installation/configuration scripts which are located under the scripts folder.
In order to add new scripts to the build you'll need to add the script to the `scripts` folder and reference its location as a shell provisioner in the `slave.json` [Description here](https://www.packer.io/docs/provisioners/shell.html).
Additional files are added in the `files` folder and referenced as a file provisioner in the `slave.json` [Description here](https://www.packer.io/docs/provisioners/file.html).

#### Run
```
make all
```

#### Necessary elements (so far)
* Jenkins user
* SSH key configuration for the Jenkins user 
* Cron jobs (Docker cleanup and Cloudwatch metrics)
* Java 1.8
* Node 
* Docker
* File ulimit
* Time Zone (ireland)
