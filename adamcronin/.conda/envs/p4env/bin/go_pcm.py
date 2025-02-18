#
#  PCMSolver, an API for the Polarizable Continuum Model
#  Copyright (C) 2018 Roberto Di Remigio, Luca Frediani and contributors.
#
#  This file is part of PCMSolver.
#
#  PCMSolver is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  PCMSolver is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public License
#  along with PCMSolver.  If not, see <http://www.gnu.org/licenses/>.
#
#  For information on the complete list of contributors to the
#  PCMSolver API, see: <http://pcmsolver.readthedocs.io/>
#

# Python front-end to run_pcm standalone PCMSolver executable
#
# Written by Roberto Di Remigio <roberto.d.remigio@uit.no>
"""
Parses the PCMSolver input file and launches a standalone calculation with the
run_pcm executable.
"""

import os
import subprocess
import sys

try:
    import pcmsolver as pcm
    from pcmsolver.external import docopt
except ImportError as ops:
    sys.stderr.write("{}\n\n".format(ops))
    sys.stderr.write("""You should update your PYTHONPATH to use go_pcm.py
    export PYTHONPATH=<prefix>/lib//python3.9/site-packages:$PYTHONPATH
where <prefix> is either the build or the install prefix.\n""")
    sys.exit(-1)

options = """
Usage:
    ./go_pcm.py --inp=<input_file> [--exe=<path_to_exe>]
    ./go_pcm.py (-h | --help)

Options:
  --inp=<input_file>   PCMSolver input file.
  --exe=<path_to_exe>  Path to run_pcm executable.
  -h --help            Show this screen.
"""


def main():
    try:
        arguments = docopt.docopt(options, argv=None)
    except docopt.DocoptExit:
        sys.stderr.write('ERROR: bad input to {}\n'.format(sys.argv[0]))
        sys.stderr.write(options)
        sys.exit(-1)
    input_file = arguments['--inp']
    # Do the parsing and return validated input
    parsed = pcm.parse_pcm_input(input_file)
    # The parsed, machine-readable file is now saved.
    parsedFile = os.path.join(os.path.dirname(input_file), '@' + os.path.basename(input_file))
    # Any leftover parsedFile will be overwritten
    with open(parsedFile, 'w') as tmp:
        tmp.write(parsed)
    # Execute standalone
    path_to_exe = arguments['--exe']
    if path_to_exe:
        run_pcm(path_to_exe, parsedFile)


def run_pcm(path_to_exe, parsedFile):
    executable = os.path.join(path_to_exe, 'run_pcm')
    p = subprocess.Popen(
        [executable, parsedFile], shell=False, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout_coded, stderr_coded = p.communicate()
    stdout = stdout_coded.decode('UTF-8')
    stderr = stderr_coded.decode('UTF-8')

    print(stdout)
    # Print the contents of stderr, without exiting
    sys.stderr.write(stderr)


if __name__ == '__main__':
    main()
