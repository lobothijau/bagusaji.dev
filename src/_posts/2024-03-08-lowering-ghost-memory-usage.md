---
title: Lowering Ghost Memory Usage
date: 2024-03-08 13:14:00 +0700
description: |
  Ghost instance will ate your RAM. If you deploy using cheap DigitalOcean droplets with only 1GB of RAM, this article will help.
category: Ghost, Blog
---

In this post I would like to show you how we can lower the memory usage of [Ghost's](https://ghost.org/) server instance and give it a little breath from out of memory issue. 

First of all, I host [Ghost](https://ghost.org/) using DigitalOcean $7 droplet which give me only 1GB of RAM. One Ghost instance will take up to 70% of it. My blog was small, not so many visitors, but if


### Reduce RAM Usage with MySQL Config

There's a trick to lower MySQL RAM usage is to to edit it's config. 

```
sudo nano /etc/mysql/my.cnf
```

Add these two lines on the bottom of the file:

```
[mysqld]
performance_schema = off
```

Restart both MySQL and Ghost server. 

```
service mysql restart 
ghost restart
```

I did this, and it really lowering the RAM usage up to 250MB, it's crazy. I'm not sure the effect overall, but since this server is just a blog, so it should be okay right? 

### Create SWAP File

Linux (and Unix?) has a concept of swapfile, it's like RAM but not physical. As the name suggest, it's a file on your hardisk that will work like an extra RAM. When the physical RAM is full, the system will use swap as an extra memory so the system won't crash. Since it's a file, we need to use a fast disk or in another words use SSD!

To check memory usage you can use `free` command on Linux. 

```
free -h
               total        used        free      shared  buff/cache   available
Mem:           969Mi       418Mi        82Mi       3.0Mi       468Mi       400Mi
Swap:          2.0Gi       106Mi       1.9Gi
```

After that, create a file somewhere. Here I will create a new file called `swapfile` in the root folder. The file can be named anything you like. Since my droplet is 1GB, I create the swap as 2GB file. Generally it's suggested that you create a swap file twice your RAM.

```
sudo fallocate -l 2G /swapfile
```

One we created the file, change it's permission so only root an read and write into this file. 

```
sudo chmod 600 /swapfile
```

Next, mark the file as a swapfile. 

```
sudo mkswap /swapfile
```

Lastly, activate the swap and register it to the system. 

```
sudo swapon /swapfile
```

Next we can confirm that the swap is active by executing this command: 

```
sudo swapon --show
```

If the above command doesn't print anything, it means you failed to create a swap file. Please check the step above and make sure you do it in order. After that, we can check memory usage once again using:


```
free -h
```

After watching the RAM usage of my droplet, I saw that the usage lower to 50-60%. Not bad for a cheap server isn't it?