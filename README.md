# Simple_Patch
I had a requirement where I need to change source code in some files and put those files from local to production server in exact same director with use of GIT or RPM with minimal code.

First, I searched for the files where I made changes. This will be accomplished by script **patch_source.sh**.

```sh
find . -name *.c|xargs grep -l "func_msg"
```

Then I iterated, and put all the updated files in the exact directory structure as of staging and production in folder viz **changes**.
```sh
do
  destination=`echo -n $file | sed 's/^.//'`
  cp "$file" "./changes$destination";
done
```

Once the folder changes got created, I transfer this folder on production and run the second script **patch_destination.sh** which will copy the new source files from folder changes to folder in production.
```sh
for file in `find ./changes/ -name *.c`;
do
  destination=`echo -n $file | sed 's/^.\/changes//'`
  cp "$file" ".$destination";
done
```
