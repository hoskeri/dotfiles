import readline, rlcompleter
import os
import atexit
import sys

F = os.path.join(os.environ.get('HOME'), ".python_history")

readline.parse_and_bind("tab: complete")
atexit.register(readline.write_history_file, F)

try: readline.read_history_file(F)
except IOError: pass

def gb(b): return float(b) / (1024 ** 3)
def mb(b): return float(b) / (1024 ** 2)
