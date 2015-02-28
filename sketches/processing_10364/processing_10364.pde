
float x,y;
void setup(){size(300,300,P3D);noFill();stroke(160);smooth();strokeWeight(0.6);}
void draw(){background(255);translate(width/2,height/2, 0);y+=0.003;x+=0.007;rotateY(y);rotateX(x);box(width/3);
rotateY(-y/2);rotateX(-x/2);box(width/5);}

