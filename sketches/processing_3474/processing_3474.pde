
float r,d=.5;
void setup(){size(400,300);}
void draw(){background(240);d+=mouseX/99000f;d%=MAX_FLOAT;r=d;translate(200,-150);
while(r>0.5){fill(255*r/7);rotate(r);rect(200,200,400,400);r*=0.9;}}

