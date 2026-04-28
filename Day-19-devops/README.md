# Day 19 – Configuration Management with Ansible

## Objective

The objective of this task was to learn Configuration Management using Ansible and understand how DevOps engineers automate server setup and management without manual intervention.

Ansible helps maintain identical server configurations using Playbooks written in YAML and follows an agentless approach through SSH.

---

## Commands Used

### Install Ansible

```bash
wsl --install -d Ubuntu
sudo apt update
sudo apt install ansible -y
ansible --version
```

---

### Create Inventory File

### hosts.ini

```ini
[webservers]
localhost ansible_connection=local
```

---

### Create Playbook File

### webserver_setup.yml

```yaml
---
- name: Configure MeetMux Web Servers
  hosts: localhost
  connection: local
  become: yes

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Create Landing Page
      copy:
        dest: /var/www/html/index.html
        content: |
          <h1>Welcome to MeetMux Production</h1>

    - name: Start Nginx
      service:
        name: nginx
        state: started
        enabled: yes
```

---

### Run Playbook

```bash
ansible-playbook -i hosts.ini webserver_setup.yml
```

---

## Idempotency Test

Running the same playbook again showed:

```text
ok=4
changed=0
```

This proves Idempotency, meaning Ansible does not make unnecessary changes if the system is already configured.

---

## Conclusion

This task helped in understanding Ansible Playbooks, inventory management, and automated server configuration.

It also demonstrated how DevOps engineers use Idempotency to ensure safe, reliable, and repeatable infrastructure automation.
