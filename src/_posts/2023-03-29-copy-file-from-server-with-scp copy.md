---
title: Copy File from Server with SCP (SSH)
date: 2023-03-29
description: |
  We could download files from a remote server to local computer via SSH 
  using a tool named scp. 
permalink: /copy-file-from-server-with-scp-ssh/

---

Yesterday I need to move an [article from WordPress](/why-im-learing-ruby-on-rails-in-2023/). Since I haven't pay the server, my WordPress site *somewhat* broken. I can't logged in into the admin dashboard to get the data I want. 

I can get the article by logged in directly into the MySQL database, and take the post. But, the images are stored somewhere on the server, therefore I still need to access my WordPress installation folder. 

The next question is, how do I download file while connecting to the server via SSH? I don't want to install a new app just to download some files. The answer is `scp`. 

The `scp` (secure copy) is a small *command line* utility to download file from a remote computer to a local computer or vice versa or to transfer between 2 remote computers. 

## Basic Usage

```sh
scp [OPTIONS] [user]@[HOST]:/path/source/file [user]@[HOST]:/path/destination/file
```

Write the user and the host for both remote server including the destination. If you want to download it to a local computer, then on the right hand just write the relative path or absolute path. 

```sh
scp user@10.10.1.1:/path/source/file .
# or
scp user@10.10.1.1:/path/source/file /home/bagusaji/Downloads/
```

THe command above will copy the file with the original name to current directory or to the Downloads directory. If you want to rename it, wirte the filename on the destination. 

```sh
scp user@10.10.1.1:/path/source/file.txt /home/bagusaji/Downloads/new_file.txt
```

## Download a folder

You don't have to download each file one by one, use `-r` option to download the entire files on a directory. 

```sh
scp -r user@10.10.1.1:/path/source/ /home/bagusaji/Downloads/
```

## Uploading

Now, how about uploading from local computer to remote server? It's very easy, just flip the source and destination path. 

```sh
scp /home/bagusaji/Downloads/file.txt user@10.10.1.1/path/source/
```