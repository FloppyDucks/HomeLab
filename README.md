# HomeLab
Public Testing Invitation
This is my personal home lab for testing, experimenting, and learning.
You have permission to perform security testing (hacking, scanning, probing, etc.) against this network under these conditions:

  1)Full disclosure — You must tell me exactly what you did, how you did it, and what you found.

  2)No data leaks — Do not share, sell, trade, or expose any personal data (PII) you discover. This includes, but is not limited to, passwords, account credentials, financial info, medical records, etc.

  3)No damage — Do not intentionally disrupt, destroy, or make the systems unusable.

  4)Non-commercial only — No part of this may be used for paid work, bounty hunting, or malicious purposes.

Questions or reports:blackwaters.online@gmail.com

Target IP: 50.103.128.207

![My Network](.github/images/My-Network.png)

# Tor Nodes
I have 8 relays running on 4 nodes (2 relays per node). I originally had all 8 relays on one Pi, however after discussing with the tor community it seems like the connection speed was abysmal compared to spreading out my relays.

![My Network](.github/images/tor-relay.png)

My relays are all enabled on boot, and alert me via email if they are down longer than 24-48 hours using the builtin tor alerting system. I can confirm the relays are running via a custom start and check bash script I wrote...with a little help from my assistant _chatgpt_

# Open Media Vault
being tired of spending money on cloud storage and worried about true privacy/EULA/license agreements, I decided why not build my own NAS. I found out about OMV from some youtube videos, and liking their UI, I decided to try it. I set up a few accounts for my family along with my self and an admin account. So far I am the only one who stores anything on there. And I get a lot of "I ought to store my things on there" That day may come, but for now, Its just my data. However if my family ever does want to use it I set up ACLs and Individual user drives for each user so that no one would need to risk their data getting into the wrong hands. I set up an SMB share that is only access able via the local network, I have considered setting up a VPN so i can access my data from anywhere. HOWEVER, I dont really need it, and its an extra risk I dont want to take. From my perspective there is little reward for such a risk if I misconfigure/ a vulnerabilty gets published and im too slow to patch. 

# Windows Domain 

My day job is IAM (Identity Access Management) I work with Centrify/RadiantOne's VDS-FID (Virtual Directory Service/Federated Identity)/Active Directory/Azure AD-Entra/ Linux-*Nix/ Cyberark/ Sailpoint/ forgeRock/ and a few other tools. My goal is to create a small domain, organization for a small office. Then intigrate FREE license/ open source apps. Im not spending hundreds if not thousands of dollars...(more dollars on license) in the HOPE that this MIGHT land me my dream red team/ Penetration testing job. This is for fun, and to see what I can learn, discover, and most importantly see how many cracks/ holes are in my own organizations company. Organizations often look fortress-like from the outside, but most breaches happen through identity misconfigurations rather than perimeter bypasses. But just a few unlocked gates, a few misconfigured permissions and you can priv. esc. all the way to a domain controller/ domain admin.

_Goal: once my domain has around 10 users and is set up with an IT/ HR/ Sales department. I want to try and segment my organization to have diffrent roles and responsiblilties, then attack my network via a (spear)phishing email to my HR/ or sales team (IT is to risky). Check to see if full-language mode is enabled via powershell (it will its my domain :) ) then try to steal some kerberos tickets and see if I can find some data I shouldnt have access to? or maybe even priv. esc. all the way to the IT team._

_Challenge: make my phish look convincing enough to make it look like its coming within the domain, modern outlook, exchange servers will alert users to external emails which can raise alarms. If we can make users think this is internal we stand a better chance of blowing past their radar_

_Challenge: learn how to set up an exchange server....IDEALLY for free, if not i may have to spend a few and or find an open source alternative_
![My Network](.github/images/DC01.png)

# Ollama/ self hosted LLM


