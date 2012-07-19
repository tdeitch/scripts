#!/usr/bin/python
import imaplib
import json

from os.path import expanduser
HOME = expanduser("~")
CREDENTIALS_FILE = HOME + "/Dropbox/info/mail-credentials.json"

with open(CREDENTIALS_FILE) as f:
    credentials = json.load(f)

gmail = imaplib.IMAP4_SSL('imap.gmail.com','993')
gmail.login(credentials['Stanford']['username'], credentials['Stanford']['password'])
gmail.select()
gmailcount = len(gmail.search(None,'UnSeen')[1][0].split())

fastmail = imaplib.IMAP4_SSL('mail.messagingengine.com','993')
fastmail.login(credentials['Fastmail']['username'], credentials['Fastmail']['password'])
fastmail.select()
fastmailcount = len(fastmail.search(None,'UnSeen')[1][0].split())

totalcount = gmailcount + fastmailcount
if (totalcount > 0):
    print str(totalcount) + " new message" + ("s" if totalcount > 1 else "") + " "
