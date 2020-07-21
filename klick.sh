sleep 2
let br=false
let wid=$(xdotool search --name RobocraftClient)

for ((k=0; k<1000; k++)); do
echo 1
xdotool key --window $wid p
echo 2
while ! (import -window $wid -depth 8 -crop "1x1+1339+122" txt:-|egrep '#060606'); do
    xdotool key --window $wid p
    sleep 0.2
done
echo 3
xdotool mousemove --window $wid 1339 122
echo 4
xdotool click --window $wid 1
echo 5
while ! (import -window $wid -depth 2 -crop "1x1+1447+117" txt:-|grep "#005555"); do
    sleep 0.2
    xdotool click --window $wid 1
done
echo 6

xdotool type --window $wid MAIGA
xdotool key --window $wid space
xdotool type --window $wid Cow
xdotool key --window $wid Return
echo 7
while ! (import -window $wid -depth 8 -crop "1x1+604+253" txt:-|egrep '#1A1F2D|#1B202F'); do
    if (import -window $wid -depth 8 -crop "1x1+1799+956" txt:-|egrep "#000000"); then 
        br=true
        break
    fi
    sleep 0.2;
done
echo 8
if [$br]
then
    br=false
    ((k--))
    sleep 0.8
    continue
fi
echo 9
xdotool mousemove --window $wid 311 200
echo 10
xdotool click --window $wid 1
echo 11

while ! (import -window $wid -depth 8 -crop "1x1+1787+1046" txt:-|egrep "#910405|#920406|#930303|#F3E2E2"); do
    if (import -window $wid -depth 8 -crop "1x1+1799+956" txt:-|egrep "#000000"); then 
        $br=true
        break
    fi
    sleep 0.1
done
if [$br==true]
then
    br=false
    ((k--))
    sleep 0.8
    continue
fi
xdotool mousemove --window $wid 1660 588
xdotool click --window $wid 1

while ! (import -window $wid -depth 8 -crop "1x1+811+473" txt:-|egrep "#282828|#373737"); do
    if (import -window $wid -depth 8 -crop "1x1+1799+956" txt:-|egrep "#000000"); then 
        $br=true
        break
    fi
    sleep 0.1
done
if ($br); then
    br=false
    ((k--))
    sleep 0.8
    continue
fi
xdotool mousemove --window $wid 791 479
xdotool click --window $wid 1
sleep 0.5

xdotool mousemove --window $wid 565 786
xdotool click --window $wid 1
if (import -window $wid -depth 2 -crop "1x1+1083+436" txt:-|grep "#555555"); then
    xdotool mousemove --window $wid 902 623
    xdotool click --window $wid 1
    sleep 0.5
    xdotool mousemove --window $wid 74 52
    xdotool click --window $wid 1
    sleep 0.5
    while ! (import -window $wid -depth 2 -crop "1x1+757+865" txt:-|grep "#555555"); do 
        xdotool mousemove --window $wid 1439 872
        xdotool click --window $wid 1

        while ! (import -window $wid -depth 1 -crop "1x1+912+626" txt:-|grep "#FF0000"); do 
            sleep 0.1
            xdotool click --window $wid 1
        done
        xdotool mousemove --window $wid 846 635
        xdotool click --window $wid 1
        sleep 0.1
    done
((k--))
continue
fi
while (import -window $wid -depth 2 -crop "1x1+805+630" txt:-|grep "#FFFFFF"); do 
    sleep 0.1
done
while ! (import -window $wid -depth 2 -crop "1x1+757+865" txt:-|grep "#555555"); do 
    xdotool mousemove --window $wid 1439 872
    xdotool click --window $wid 1

    while ! (import -window $wid -depth 1 -crop "1x1+912+626" txt:-|grep "#FF0000"); do 
        sleep 0.1
        xdotool click --window $wid 1
    done
    xdotool mousemove --window $wid 846 635
    xdotool click --window $wid 1
    sleep 0.1
done
done
