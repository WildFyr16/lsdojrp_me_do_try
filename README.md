<h1 align='center'>Me, Do & Try</a></h1>

#### UPDATE 1.6.1
* Added support for Player Usernames
* Fixed issue with code where server.lua would not load upon resource start
#### UPDATE 1.6
* Fixed the `everyone can see the texts` problem *(for me it worked perfectly, now it won't be a problem I hope)*
#### Working on
* I'm working on a "**I have**" type command that when the player runs the command then he can select his own items that will be displayed in the chat as "***I have 2x xyz***".
It could help sometimes if the player wants to show something for another player as text-rp

## How it looks like?
*You can check it [here](https://forum.cfx.re/t/release-me-do-try-a-more-realistic-fivem-roleplay-addon/4764849)*
## How is this work?

**Its a simple customized Me, Do & Try actions in one script you can use!**

## How to use the commands?

* /Me [action]         - Make an action
* /Do [happening]      - Make a happening
* /Try [action to try] - Make an action which has a chance to success otherwise unsuccess

## How to install

* Git [lsdojrp_me_do_try]([https://github.com/hoaaiww/arp_me_do_try](https://github.com/WildFyr16/lsdojrp_me_do_try))
* Extract ```lsdojrp_me_do_try-main.rar```
* Remove ```-main``` from ```lsdojrp_me_do_try```
* Copy and paste ```lsdojrp_me_do_try``` folder to ```resources```
* Add ```start lsdojrp_me_do_try``` to your ```server.cfg``` file

## Customizable script!

* You can edit the configurations of the script in the ```config.lua```
* You can even log thiese commands to your discord server! You can enable it in ```config.lua```
Sample:
```
Config.Log                  = true
Config.Logwebhook           = "Replace Me With Your Webhook Link"
```

## Dependencies - Non! This is a standalone script. However if you want Player names (NOT USERNAMES) in the chat bubble you will need ESX.

* [ESX](https://github.com/esx-framework/esx-legacy.git)
