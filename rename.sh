#! /bin/bash

#made by ramhee (ramhee98)
#use at your own risk!
#this folder contains all movies you want to move into subfolders with the coresponding names
#do not forget the / in the end of the path
foldercontainingallmovies=/media/movies/
#movie extension without dot .
movieextension=mkv

#generate list of all movies
movielist=movielist.txt
ls $foldercontainingallmovies > $movielist
sed -i "/.$movieextension/!d" $movielist

#print movie list
echo "filtered list:"
cat $movielist
echo "-----------\n"

echo "Wait 10 seconds and then continue..."
sleep 10

#iterating through movielist
echo "iterating through list:"
while IFS="" read -r p || [ -n "$p" ]
do
  #printf '%s\n' "$p"
  movie="$p"
  moviename="${movie%.*}"
  fullpath_old=$foldercontainingallmovies$movie
  path_new=$foldercontainingallmovies$moviename
  fullpath_new=$foldercontainingallmovies$moviename/$movie
  #create new dir
  mkdir -p "$path_new"
  #move movie file to new dir
  mv -n "$fullpath_old" "$fullpath_new"
done < $movielist
echo "done"