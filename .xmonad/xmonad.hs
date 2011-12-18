import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.WorkspaceCompare
import qualified XMonad.StackSet as W
import System.IO

myManageHook = composeAll
    [ className =? "Gimp"        --> doFloat
    , className =? "Vncviewer"   --> doFloat
    , className =? "Nvidia-settings" --> doFloat
    , className =? "stalonetray" --> doIgnore
    ]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/mstine/.xmobarrc"
    xmonad $ defaultConfig
        { borderWidth = 2 
	, manageHook = manageDocks <+> myManageHook
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , terminal = "urxvt"
        , modMask = mod4Mask
        } `additionalKeys`
	(
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
	)
