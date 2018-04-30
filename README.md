# Open Loyalty on AWS installation

### Step 1: Create and run an instance on aws
* choose ** Ubuntu Server 16.04 LTS (HVM), SSD Volume Type - ami-916f59f4 **
* add storage (optional)
* after successfully running an instance, you will see something like this

![img](https://s3-ap-southeast-1.amazonaws.com/temp-test.ml/aws-tuto/DeepinScreenshot_select-area_20180430182706.png)

* Remember the ** public IP ** above, we'll be using this to find and replace.

### Step 2: Login to your Instance
* Generate a Key pair from AWS console> Network & Security > Key Pairs
* use the key to Login to Instance
```
chmod 400 /path/my-key-pair.pem
```
* Use the ssh command to connect to the instance. You specify the private key (.pem) file and user_name@public_dns_name. For example, if you used an Amazon Linux AMI, the user name is ec2-user.

```
ssh -i /path/my-key-pair.pem ec2-user@ec2-198-51-100-1.compute-1.amazonaws.com
```

### Step 3: Installation on EC2
After ssh login into the EC2 Instance:
* Install *docker* and *docker-compose* useful link : [Docker](https://www.docker.com/>)
* clone this repo
* Make changes to following files:
	* backend/doc/api/settings.rst
		* replace all the occurrance of > 13.59.163.245 to > *your_ip_from_step_1*

	* docker/dev/web/backend.conf
		* replace > server_name 13.59.163.245; with > server_name *your_ip_from_step_1*

	* docker/dev/web/config.js
		* replace all the occurrance of > 13.59.163.245 to > *your_ip_from_step_1*

	* docker/dev/web/parameters.json
		* replace all the occurrance of > 13.59.163.245 to > *your_ip_from_step_1*

	* docker/prod/web/parameters.json
		* replace all the occurrance of > 13.59.163.245 to > *your_ip_from_step_1*

	* frontend/rancher/entrypoint.sh
		* replace all the occurrance of > 13.59.163.245 to > *your_ip_from_step_1*


	* frontend/src/config.js
replace all the occurrance of > 13.59.163.245 to > *your_ip_from_step_1*

### Step 4: Running the application
* Go to the docker directory:

```
cd docker
```

* Execute bellow command to run application: 

```
docker-compose up
```

* Then use another command to setup database, Elasticsearch and load some demo data:

```
docker-compose exec php phing setup
```

### Step 5: Accessing the application
* Go to EC2 > Security Groups
* Either select an existing Security Group or create one
* Make sure that SSH is allowed for inbound 0.0.0.0/0
* Create a new inbound Custom TCP Rule for port 8000-9000 allowing 0.0.0.0/0. [Reference Stack-overflow link](https://stackoverflow.com/questions/17529794/amazon-ec2-access-application-through-specific-port)
* After starting Open Loyalty it's exposes services under following URLs:
	* http://your_instance_ip:8182 - the administration panel,
	* http://your_instance_ip:8183 - the customer panel,
	* http://your_instance_ip:8184 - the merchant panel,
	* http://your_instance_ip:8181 - RESTful API port
	* http://your_instance_ip/doc - swagger-like API doc






# Open Loyalty

Open Loyalty is technology for loyalty solutions.
It's a loyalty platform in open source, with ready-to-use gamification and loyalty features, easy to set up and customize, ready to work on-line and off-line.

See Open Loyalty product tour - https://youtu.be/cDZZemHxgAk.


## Business applications

There is variety of applications for Open Loyalty. Based on it you can build loyalty solutions like: loyalty modules for eCommerce, full loyalty programs for off-line and on-line, motivational programs for sales department or customer care programs with mobile application.

## Screenshots

![Dashboard](https://cloud.githubusercontent.com/assets/26326842/24359309/428f7dc4-1304-11e7-99c2-36ff23fe5036.png)
![Client Cockpit](https://cloud.githubusercontent.com/assets/26326842/24359396/7f489fd4-1304-11e7-9ae5-f05c88eb8c56.png)
![eCommerce Cockpit](https://cloud.githubusercontent.com/assets/26326842/24359495/d65c1210-1304-11e7-86bf-9e63ab754360.png)
![POS Cockpit](https://cloud.githubusercontent.com/assets/26326842/24359465/b796e260-1304-11e7-9da5-4bfc0a026a16.png)



If you are developer and want to attach source code then:

```
docker-compose -f docker/docker-compose.yml -f docker/docker-compose.dev.yml up
```
