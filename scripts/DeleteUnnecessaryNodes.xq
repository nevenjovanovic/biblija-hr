let $names := ("orig_book_index", "orig_chapter", "orig_verse", "orig_subverse", "order_by")
for $e in //*[name()=$names]
return delete node $e