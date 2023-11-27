"""
powershell in Cmder that allows us to retain the linux-like commands.
"""

import os

from rez.utils.platform_ import platform_
from rezplugins.shell.pwsh import PowerShellCore


class CmderPwSh(PowerShellCore):

    @classmethod
    def executable_name(cls):
        return 'powershell'

    @classmethod
    def name(cls):
        return 'cmder_pwsh'

    @classmethod
    def get_syspaths(cls):
        """
        Get the system $PATHs so we have a clean environment. Then re-add the
        paths from Cmder so that we can still use linux-like commands.
        """
        syspaths = set(super(CmderPwSh, cls).get_syspaths())
        current_paths = os.environ['PATH'].split(os.pathsep)

        cmder_root = os.environ['CMDER_ROOT']
        cmder_paths = [p for p in current_paths if p.startswith(cmder_root)]
        syspaths = syspaths.union(set(cmder_paths))

        # if git for windows is installed
        git_root = os.environ.get('GIT_INSTALL_ROOT')
        if git_root:
            git_paths = [p for p in current_paths if p.startswith(git_root)]
            syspaths = syspaths.union(set(git_paths))

        cls.syspaths = syspaths
        return cls.syspaths


def register_plugin():
    if platform_.name == "windows":
        return CmderPwSh
