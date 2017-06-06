import os
import copy
#import ycm_core

#import_module(pythonUtils.folders_utils)
import sys, os
sys.path.append('/home/giulio/sources/devarch')

from pythonUtils.folders_utils import *
from pythonUtils.specific_utils import *

INSTALL_PREFIX="/data/builds/"
INSTALL_PSTFIX="pc/zinc-install-root/debug/debian-8-x86_64/"
BUILD_PSTFIX="/pc/zinc-build-root/debug-debian-8-x86_64/"
INCLUDE_FOLDERS=["include/", "oss/include/"]

GENERAL_FLAGS = [
"-std=c++11",
"-Wall",
"-Wextra",
"-Werror",
"-x",
"c++",
"-DUSE_CLANG_COMPLETER",
]

def FlagsForFile( filename, **kwargs ):
  flags = GENERAL_FLAGS
  dbg.debug("filename: " + filename)
  base = getBaseSourceDirectory()
  base, element, component = getElementComponentNames(filename)
  splitted_component = getSplittedComponentName(filename)
  branchName = getCurrentGitBranchName(base)
  flags = getTargetFolders(base, filename, branchName, element, splitted_component, GENERAL_FLAGS)
  flags = getComponentFolders(base, element, component, flags)
  return { "flags": flags }

def getComponentFolders(base, element, component, flags):
  blist = []
  ppath = os.path.join(os.path.join(base, element), component)
  dbg.debug("component base folder: " + ppath)
  for root, dirs, _ in os.walk(ppath, topdown=True):
    for dir in dirs:
      hidden = False
      if dir[0] == ".":
        hidden = True
        blist.append(dir)
        continue
      for b in blist:
          if b in root:
            hidden = True
      if not hidden:
        name = os.path.join(root, dir)
        flags.append("-I")
        flags.append(name)
        dbg.debug("element include: " + name)
  return flags

def getTargetFolders(base, filename, branchName, element, splittedComponentName, flags):
  incpath= INSTALL_PREFIX + branchName + "/" + INSTALL_PSTFIX
  buildpath = INSTALL_PREFIX + branchName + BUILD_PSTFIX
  for inc in INCLUDE_FOLDERS:
    path = os.path.join(incpath, inc)
    flags.append("-I")
    flags.append(path)
    dbg.debug("install include: " + path)
  if "JsCore" in splittedComponentName:
    path = buildpath + element + "/" + ".".join(splittedComponentName) +"/"
    flags.append("-I")
    flags.append(path)
    dbg.debug("binding folder: " + path)
    path = os.path.join(incpath, "htmlengine/qt-5.5.0/include/")
    flags.append("-I")
    flags.append(path)
    dbg.debug("binding folder: " + path)    
  return flags


if __name__ == "__main__":
  fname = "/home/giulio/sources/devarch/Uranium/Uranium.Client.System/test/metadata/MetadataObserverTest.cpp"
  res = FlagsForFile(fname)
  bs, el, cm = getElementComponentNames( fname)
  component = getSplittedComponentName(fname)
