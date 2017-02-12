module Messages exposing (..)

import Navigation exposing (Location)
import Users.Messages

type Msg = UsersMsg Users.Messages.Msg
         | OnLocationChange Location


