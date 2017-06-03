for $v in //*:VERSE[not(*:br)]
return replace value of node $v with normalize-space($v)