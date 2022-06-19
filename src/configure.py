#!/usr/bin/env python
import os.path
import time

default_personal_info_file = '''
\def \email{EMAIL-PLACEHOLDER}
\def \phoneNumber{PHONE-PLACEHOLDER}
'''

warn_msg = '''
==========================================
==========================================
================= WARNING ================
==== NOT USING THE REAL PERSONAL INFO ====
==========================================
==========================================
'''

def main():
    personal_info_file = 'personal_info.tex'
    if not os.path.isfile(personal_info_file):
        print(warn_msg)
        time.sleep(7)
        with open(personal_info_file, 'w') as f:
            f.write(default_personal_info_file)

if __name__ == '__main__':
    main()
