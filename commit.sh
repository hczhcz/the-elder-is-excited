echo 'rip'
exit

# ========

begin=$(expr $(cat ./begin) + 86400) # init: 972576000
end=$(date '+%s')

list=$(seq $begin 86400 $end)
after=''

for i in $list
do
    date -u --date=@$i '+%Y年%m月%d日：没有' >> ./README.md
    echo >> ./README.md

    echo $i > ./begin

    git add ./README.md
    git add ./begin
    git commit --date=$i --message='add'
done

git push -f origin HEAD
