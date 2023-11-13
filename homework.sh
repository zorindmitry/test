#створюю ключи SSH для роботи з github test і test.pub
ssh-keygen -t ed25519 -C "zorindk@gmail.com"

eval "$(ssh-agent -s)"

#добавляю вapple-keychain
touch ~/.ssh/config
open ~/.ssh/config
ssh-add --apple-use-keychain ./test

#add ssh to github settings

ssh -T git@github.com
#...works....

#Переміщую ключи в папку SSH тому що створив їх в робочій папці
mv ./test ~/.ssh/
mv ./test.pub ~/.ssh/

#створюю перший комміт
git init
touch README.md
vim README.md
git add .
git commit -m "first commit"

#додаю файли з прошлих лекцій
cp ../lecture2\ vm:vagrant/Vagrantfile .
cp ../lecture2\ vm:vagrant/script.sh .
cp ../lecture2\ vm:vagrant/database.sh .
git add .
git commit -m "add Vagrantfile, script.sh database.sh"
git push -u origin main

#додаю локально 2 гілки
git branch feature-1
git branch feature-2

#переходжу на гілку 1
git checkout feature-1
#додаю зміни в script.sh
vim script.sh

#роблю комміт пуш і мердж з main
git status
git add script.sh
git commit -m "feature 1 add comment"
git push origin feature-1
git checkout main
git merge feature-1
git push origin main

#переходжу на гілку 2
git checkout feature-2
#додаю зміни в script.sh на тій же строчці
vim script.sh
#роблю комміт пуш
git add script.sh
git commit -m "feature-2 merge test"
git push origin feature-2
git checkout main
#виконую мердж, вирішую проблеми і обєдную в один комміт
git merge --squash feature-2
git log

############
#Author: zorindmitry <zorindk@gmail.com>
#Date:   Mon Nov 13 21:41:14 2023 +0200

#    Squashed commit of the following:

#    commit 216beedfb4741ff3bb065ea218541a3d6f2fd2d6
#    Author: zorindmitry <zorindk@gmail.com>
#    Date:   Mon Nov 13 20:34:06 2023 +0200

#        feature-2 merge test

###########

#виконую зміни в feature-1
