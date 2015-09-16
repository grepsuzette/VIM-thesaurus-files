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
 
 To allow multi-word expressions to be searched, use 
 the included script: [multiword.vim](multiword.vim).
 Simply put the file in your `.vim` directory and invoke
 it from your `.vimrc` using:
 ```vim
 source ~/.vim/multiwordthesaurus.vim
 ```

 Using this script, if you place your cursor after `act of god`
 and click C-x C-t, it will automatically be transformed
 to `act_of_god` and the following synonyms will show up:

   - force_majeure
   - vis_major
   - inevitable_accident
   - unavoidable_casualty
   - calamity
   - catastrophe
   - disaster
   - tragedy
   - cataclysm

 After choosing one, pressing C-y, escape, space or any 
 closing punctuation mark will replace the underscores to
 spaces.
 

Additional languages
=========================================================================

The VIM thesaurus in French is provided already, 
as well as a shortened alternate thesaurus file for english (courtesy of 
@yever, the one by default having almost too many synonyms you can  
change it easily with :set thesaurus=/path/to/file).

Other languages might be added later. Feel free to propose more!
