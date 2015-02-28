
PImage b;float x=40;float y=520;void setup(){size(760,573);b=loadImage("p.jpg");}void draw(){image(b,0,0);x=x+5;if(x>760){x=-15;}fill(0);ellipse(x,y,30,20);triangle(x-25,y+10,x-15,y,x-25,y-20);}


