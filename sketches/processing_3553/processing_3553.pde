
float x,y,a,b;void setup(){size(900,600);noStroke();fill(0,20);x=y=300;}void draw(){for(int i=0;i<20;i++){a=random(x-1,x+1);b=random(y-1,y+1);if ((a*b<540000)&(a*b>0)){rect(a,b,1,1);x=a;y=b;}}}

