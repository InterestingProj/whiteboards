module Users.Messages exposing (..)

import Http
import Users.Models exposing (Name, User)

type Msg = 
           RetrievedUsers (Result Http.Error (List User))
         | ShowUsers
         | ShowUser Name
