
float x,y,z,w,b,c,q;void setup(){size(900,900);q=random(1,10);smooth();}void draw(){c++;b=sin(log(c))*q;translate(450,450);z=x+cos(b);w=y+sin(b);for(b=0;b<10;b++){rotate(.628);line(x,y,z,w);}x=z;y=w;}

