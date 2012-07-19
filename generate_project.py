#!/usr/bin/env python

import os, sys
from optparse import OptionParser

this_dir = os.path.dirname(os.path.realpath(__file__))

def get_license_by_name(name):
  if name.lower() == 'bsd':
    return open(os.path.join(this_dir, 'licenses', 'bsd.txt'), 'r').read()
  elif name.lower() == 'mit':
    return open(os.path.join(this_dir, 'licenses', 'mit.txt'), 'r').read()
  elif name.lower() == 'gpl':
    return open(os.path.join(this_dir, 'licenses', 'gpl_v3.txt'), 'r').read()
  else:
    return "REPLACE ME WITH A LICENSE"

def comment_license(license, prefix=" * "):
  commented_license = ""
  for line in license.split('\n'):
    commented_license += (prefix+line+'\n')
  return commented_license

def create_project(options):
  # Create subs
  subs = {}
  subs['project_name'] = options.project_name.lower()
  project_name = options.project_name.lower()
  output_dir = os.path.join(options.output_dir, project_name)
  subs['project_name_camel'] = options.project_name
  subs['project_name_caps'] = project_name.upper()
  subs['author'] = options.author
  subs['email'] = options.email
  from datetime import date
  subs['year'] = str(date.today().year)
  subs['license'] = get_license_by_name(options.license)
  subs['license_commented'] = comment_license(subs['license'])
  subs['organization'] = options.organization
  subs['include_hook'] = ''

  # Recursively replace
  for key in subs.keys():
    try:
      subs[key] = subs[key].format(**subs)
    except KeyError as e:
      print('Unhandled key: {}'.format(str(e)))

  # If the directory does not exist, make it
  if not os.path.exists(output_dir):
    os.makedirs(output_dir)

  # Walk the template base
  for root, dirs, files in os.walk(os.path.join(this_dir, 'base')):
    rel_path = os.path.relpath(root, os.path.join(this_dir, 'base'))
    if not os.path.exists(os.path.join(output_dir, rel_path.format(**subs))):
      os.makedirs(os.path.join(output_dir, rel_path.format(**subs)))
    for file_name in files:
      # Read the file contents
      file_contents = open(os.path.join(root, file_name), 'r').read()
      try:
        # Substitute the file name
        file_name_sub = file_name.format(**subs)
        subs['this_file'] = file_name_sub
        # Substitute the contents
        file_contents = file_contents.format(**subs)
      except KeyError as e:
        print("Missing key `{}` in file `{}`".format(str(e), os.path.join(root, file_name)))
        return
      # Write the new contents to the desitnation
      open(os.path.join(output_dir, rel_path.format(**subs), file_name_sub), 'w+').write(file_contents)

def main():
  parser = OptionParser()
  parser.add_option("-o", "--output-dir", dest="output_dir",
                    help="Folder to write new project to", metavar="OUTPUT_DIR")
  parser.add_option("-p", "--project-name", dest="project_name",
                    help="Name of the project, use camel case (e.g. SuperSensor4001 rather than supersensor4001 or SUPERSENSOR4001)",
                    metavar="PROJECT_NAME")
  parser.add_option("-a", "--author", dest="author",
                    help="Author's name", metavar="AUTHOR")
  parser.add_option("-e", "--email", dest="email",
                    help="Author's email", metavar="EMAIL")
  parser.add_option("-l", "--license", dest="license", default="None",
                    help="License of the project: BSD, MIT, GPL, NONE [default: %default]")
  parser.add_option("-g", "--organization", dest="organization",
                    help="Organization", metavar="ORGANIZATION")
  (options, args) = parser.parse_args()
  if not options.output_dir:
    print("Ouput Directory required")
    parser.print_help()
    return
  if not options.project_name:
    print("Project Name required")
    parser.print_help()
    return
  if not options.author:
    print("Author Name required")
    parser.print_help()
    return
  if not options.email:
    print("Author Email required")
    parser.print_help()
    return
  if options.license.lower() not in ['bsd', 'mit', 'gpl', 'none']:
    print("Invalid license, must be on of BSD, MIT, GPL, NONE")
    parser.print_help()
    return
  if not options.organization:
    print("Organization required")
    parser.print_help()
    return
  create_project(options)

if __name__ == '__main__':
  main()
