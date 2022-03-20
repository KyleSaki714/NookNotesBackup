-- NookNotesBackup
-- Kyle Santos
-- 3/18/2022
/* Takes an annotations.db database file and
extracts the notes and highlights from it,
and outputs it in a text file for u to copy
to your notes system

takes in parameters to add timestamps or idk*/

.headers on
.mode csv
select ean as "File", timestamp as Timestamp, pagenumber as PageNumber, highlighttext as HighlightedText, note as UserNote 
from annotations;