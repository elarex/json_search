
##Files

main.rb - the amin execution loop
client.rb - the client object
search.rb - the search interface

.ruby_version - 3.0 at the time of writing

client_spec.rb
search_spec.rb - Test files for client and search

##To run:

`ruby main.rb`. Instructions are printed to screen

##To test:
`ruby client_spec.rb`
`ruby search_spec.rb`

##Notes:
My approach is to do the simplest thing that can possibly work, and refine it from there.
I start with a few basic assumptions, and adjust where required as the project unfolds.

I've tried to keep my commits frequent so you can see it progressing.


Example output:
```
$ ruby main.rb
"Commands are load, search. Anything else quits."
search
ane
"match found: id: 2, full_name: Jane Smith, email: jane.smith@yahoo.com"
"match found: id: 15, full_name: Jane Smith, email: jane.smith@gmail.com"
"Commands are load, search. Anything else quits."
```


Assumptions:

Search through all clients and return those with names partially matching a given
search query

* the search string should be a subset of the name, case insensitive.

Find out if there are any clients with the same email in the dataset, and show
those duplicates if any are found.

* No mention of partially matching, but a mention of duplicates, so I went with a substring match as with name, case insensitive


What if we wanted to accept any JSON file, and make the search dynamic i.e.
the user specifies which field to search for, rather than always searching by
name?

* I did this as part of the first implementation

What if we wanted to offer the same functionality on a REST API? i.e. GET
http://localhost:3000/query?q=foo

* There are some lighweight web frmeworks available, like webrick.

What if we wanted to offer this capability at scale?

* We'd need an indexed DB to speed up access, and a bunch of the API runners accessing the lookups. With a proxy(s) in front, we can scale nearly arbitrarily.

