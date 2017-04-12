{-# LANGUAGE OverloadedStrings #-}
module DB
    (
      DBDetails (..),
      statusUpdateQuery,
      insertQuery
    ) where

import           Database.SQLite.Simple
import qualified Data.Text as T

data DBDetails = DBDetails { connection :: Connection, tableName :: T.Text }

statusUpdateQuery :: T.Text -> Query
statusUpdateQuery tablename = Query $ T.concat ["UPDATE ", tablename ," SET status = :str WHERE jobId = :id AND hitNo = :hit"]

insertQuery :: T.Text -> Query
insertQuery tablename = Query $ T.concat ["INSERT INTO ", tablename ," (jobId, startDate, hitNo, status) VALUES (?,?,?,?)"]
