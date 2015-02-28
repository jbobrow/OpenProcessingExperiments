
float p=0,q=0,x,y,r=0;void draw(){smooth();stroke(0,60+255*sin(r/5),0);x=300+173*cos(r)-63*cos(r*173/63);y=300+173*sin(r)-63*sin(r*173/63);if(p>0)line(p,q,x,y);else background(255);p=x;q=y;r+=PI/30;}

