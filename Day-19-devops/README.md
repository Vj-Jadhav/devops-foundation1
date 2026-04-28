# Day 19 - Configuration Management with Ansible

## Objective

The objective of this task was to learn Configuration Management using Ansible and understand how DevOps engineers manage multiple servers automatically without manual intervention.

Ansible helps in maintaining identical server configurations across environments using an agentless approach through SSH. Instead of manually configuring each server, a YAML Playbook is written to define the desired system state.

This task also introduced the concept of treating servers as “Cattle” instead of “Pets,” where servers are replaceable, standardized, and managed in bulk.

---

## Task Performed

### 1. Installed Ansible

Since Ansible works best on Linux environments, Ubuntu was used through WSL (Windows Subsystem for Linux) instead of native Windows PowerShell.

Commands used:

```bash
wsl --install -d Ubuntu
sudo apt update
sudo apt install ansible -y
ansible --version

2. Created Inventory File

A file named hosts.ini was created to define the target machine.

[webservers]
localhost ansible_connection=local

This allowed Ansible to run the playbook on the local machine for testing.

3. Created Ansible Playbook

A playbook named webserver_setup.yml was created with three main tasks:

Install Nginx
Create a custom landing page
Ensure Nginx service is running and enabled

Playbook:

---
- name: Configure MeetMux Web Servers
  hosts: localhost
  connection: local
  become: yes

  tasks:
    - name: Ensure Nginx is installed
      apt:
        name: nginx
        state: present

    - name: Create custom landing page
      copy:
        dest: /var/www/html/index.html
        content: |
          <h1>Welcome to MeetMux Production</h1>
          <p>Server Configured by Ansible Automation</p>

    - name: Ensure Nginx is running
      service:
        name: nginx
        state: started
        enabled: yes
4. Executed the Playbook

The playbook was executed using:

ansible-playbook -i hosts.ini webserver_setup.yml

After successful execution, Nginx served the custom landing page successfully.

Browser output:

Welcome to MeetMux Production
Server Configured by Ansible Automation
5. Idempotency Test

The same playbook was executed again using the same command.

This time the output showed:

ok=4
changed=0

This confirmed that no unnecessary changes were made because the system was already in the desired state.

What is Idempotency?

Idempotency means running the same Ansible playbook multiple times produces the same final result without making unnecessary changes.

If the configuration already exists, Ansible reports ok instead of changed.

This is better than standard shell scripts because shell scripts execute commands every time, while Ansible only changes what is required, making automation safer, faster, and more reliable.