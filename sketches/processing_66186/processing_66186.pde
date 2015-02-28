
void setup(){
size(400,400);
background(0);
smooth();

}
 float a=0;
void draw(){
 stroke(random(256),random(256),random(256));
  a=a+0.1;
translate(random(400),random(400));
rotate(a);
ellipseMode(CENTER);
ellipse(0,0,10,100);

}
