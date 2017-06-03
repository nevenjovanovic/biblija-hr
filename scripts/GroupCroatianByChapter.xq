for $b in //*:BIBLEBOOK
return element BIBLEBOOK {
  $b/@bnumber ,
for $v in $b//*:VERSE
let $c := $v/*:orig_chapter
group by $c
return element CHAPTER {
  attribute cnumber { $c } ,
  for $vv in $v return element VERSE {
    attribute vnumber { $vv/*:orig_verse },
    $vv/*:orig_subverse ,
    $vv/*:text
  }
}
}