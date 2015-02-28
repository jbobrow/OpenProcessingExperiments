
void setup(){
size(400,400);
background(0);
noFill();
smooth();
 
}
 float a=0;
void draw(){
 stroke(random(256),random(256),random(256));
  a=a+0.1;
 translate(random(400),random(400));
rotate(a);
ellipse(random (255),random (255),random (255) ,random (100));
 
}





