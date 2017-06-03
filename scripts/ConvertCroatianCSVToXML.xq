let $text := file:read-text("/home/neven/Downloads/biblija/croatian/biblija-hr.csv")
return csv:parse($text, map { 'header': true(), 'separator':'tab', 'quotes' : false() })