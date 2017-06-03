element XMLBIBLE {
for $r in collection("biblija-hr-csv")//record
let $b := $r/orig_book_index
group by $b
return element BIBLEBOOK {
  attribute bnumber { $b } ,
  for $rr in $r 
  let $chapter := $rr/*:orig_chapter
  group by $chapter
  return element CHAPTER {
    attribute cnumber { $chapter },
    for $verse in $rr
    let $vnumber := $verse/*:orig_verse
    group by $vnumber
    return element VERSE { 
    attribute vnumber {$vnumber },
    $verse/* }
  }
}
}