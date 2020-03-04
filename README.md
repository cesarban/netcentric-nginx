# nginx for netcentric
Hi everyone in netcentric team!
Welcome to This module.

The general propouse of this module is replace the configuration of nginx to permit the next settings:

1. Create a proxy to redirect requests for https://domain.com to 10.10.10.10 and redirect requests for https://domain.com/resource to 20.20.20.20.
2. Create a forward proxy to log HTTP requests going from the internal network to the Internet including: request protocol, remote IP and time take to serve the request.
3. (Optional) Implement a proxy health check.

At the end let me explain you why a follow this way to get the task done in order to you understand what is my puppet level and the way that I solved this issue.

#### Table of Contents

1. [Description](#description)
2. [Files changed](#files-changed)
3. [Installing this module](#installing-this-module)
4. [How I have done this](#how-i-have-done-this)

## Description

The configuration has be changed only modifiying nginx.conf and use the manifest only to replace this file.

### Files changed
/netcentric_nginx/files/nginx.conf
/netcentric_nginx/manifest/init.pp

### Installing this module
puppet module install --module_repository  https://github.com/cesarban/netcentric-nginx.git


### How I have done this

My skills of puppet is pure basic, and I had no time to have a course to do this task. Searching in the web for a quikly way to build a puppet module, I found the PDK tool, that  build a puppet module with all the basic things and you only have to add your files and manifest.
I follow the instructions of build a empty module with the structure.
https://puppet.com/docs/pdk/1.x/pdk_creating_modules.html#create-module


I triyed to include all the configuration inside init.pp
I find  the ocnfiguration for the first part of the task. Let me show you:
```
include nginx
class { "nginx":
manage_repo => true,
package_source => 'nginx-stable'
}
{
nginx::resource::location{'/':
proxy  => 'https://10.10.10.10/' ,
server => 'domain.com',
}
nginx::resource::location{'/resource':
proxy => 'https://20.20.20.20/' ,
server => 'domain.com',
}
```
But I can't find the part of healt check and log format for proxy forward. I spent my time without results... Then I decide to publish this. This configuration has the next prerequistes:
- Linux Redhat, Centos, Ubuntu, ...you can check all OS supported in metadata.json
- This module only change a preexisting nginx where you want to replace the configuration.

That's all.
I hope see you soon.
Cesar Aguirre
aguirre.cesar@gmail.com
