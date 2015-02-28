
void setup(){size(640,480);}void draw(){if(!keyPressed){int f=mousePressed?18:17;f=random(1)<0.01?13:f;filter(f);ellipse(mouseX,mouseY,10,10);}}



