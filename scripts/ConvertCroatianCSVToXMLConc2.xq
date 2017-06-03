let $r := let $text := file:read-text("/home/neven/Downloads/biblija/croatian/book_names_zef_conc.csv")
return csv:parse($text, map { 'header': true(), 'separator':'tab', 'quotes' : false() })
for $record in $r//record
let $n := $record/nr/string()
let $b := $record/bsname/string()
return insert node attribute bsname { $b } into collection("biblija-hr-book-chapter-verse-subverse")//*:BIBLEBOOK[@bnumber=$n]