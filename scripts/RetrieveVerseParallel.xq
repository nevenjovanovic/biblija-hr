let $bib := ("41", "10", "15")
for $verse in collection("biblije-paralelno")//*:BIBLEBOOK[@bnumber=$bib[1]]/*:CHAPTER[@cnumber=$bib[2]]/*:VERS[@vnumber=$bib[3]]
return $verse