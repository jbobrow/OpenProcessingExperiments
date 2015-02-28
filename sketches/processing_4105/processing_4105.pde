
float r;float g;float b;float x;float y;void setup(){size(200,200);r=random(0,255);g=random(0,255);b=random(0,255);noStroke();}void draw(){for(x=0;x<=205;x=x+5){fill(r,g,b);ellipse(x,y,10,10);r=r+random(-5,5);g=g+random(-5,5);b=b+random(-5,5);}if(x>=205){x=0;y=y+5;}if(y>=205){filter(BLUR,2);noLoop();}}

