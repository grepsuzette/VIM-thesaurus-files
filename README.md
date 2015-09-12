VIM thesaurus files
========================================================================
Since VIM only comes with an english thesaurus, and other language thesaurus
files in VIM format aren't always easy to find, here is a simple converter.

It will convert from OpenOffice thes-xx.dat files to VIM-compatible thesaurus
files.


Multi-word synonyms
=========================================================================
VIM normally doesn't recognize multi-word synonyms.

 Some verbs or words in .dat files come with spaces.
 For instance in french, "demander" != "se demander".
 Since no language possibly use underscores, we 
 replaced all spaces with `_`. 
 
 Tip: to allow multi-words expression to be 
 searched, manually add an underscore before running 
 C-X C-t.

 For instance in this case, `act_of_god` will show up 
 the following synonyms: 

   - force_majeure
   - vis_major
   - inevitable_accident
   - unavoidable_casualty
   - calamity
   - catastrophe
   - disaster
   - tragedy
   - cataclysm

 By discarding them as in most thesaurus, we would get 
 half of these interesting results.

 This also prevents synonyms for `10000` to return
 "ten" and "thousands" on two separate lines, whereas
 the one-liner "ten_thousands" is more readable.

Additional languages
=========================================================================

The VIM thesaurus in French is provided already, 
as well as a shortened alternate thesaurus file for english (courtesy of 
@yever, the one by default having almost too many synonyms you can  
change it easily with :set thesaurus=/path/to/file).

Other languages might be added later. Feel free to propose more!
