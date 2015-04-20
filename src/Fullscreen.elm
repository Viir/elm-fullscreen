module Fullscreen where
{-| Elm bindings to HTML5 Fullscreen API.

-}

import Signal
import Task exposing (Task)

import Native.Fullscreen

{-|
Active - The page is currently in Fullscreen Mode.
RequestAvailable - The page is in a state where Fullscreen Mode can be requested.
RequestUnvailable - The page is not a state where Fullscreen Mode can be requested.
Unsupported - This browser does not support the Fullscreen API.
-}
type Status
  = Active
  | RequestAvailable
  | RequestUnavailable
  | Unsupported

{-|
A signal of Booleans representing whether Fullscreen Mode is active. It begins
False and switches to True or False as appropriate whenever a `fullscreenchange`
event is fired on the document.
-}
fullscreenActive : Signal Bool
fullscreenActive = Native.Fullscreen.fullscreenMode

{-|
Requests that the document enter Fullscreen Mode.
-}
requestFullscreen : Task error ()
requestFullscreen = Native.Fullscreen.requestFullscreen

{-|
Requests that the document enter Fullscreen Mode.
-}
exitFullscreen : Task error ()
exitFullscreen = Native.Fullscreen.exitFullscreen

{-|
Checks the document's current fullscreen status.
-}
checkStatus : Task error Status
checkStatus = Native.Fullscreen.checkStatus