
void setup(){
  size(500,500);
  background(0);

  smooth();
  colorMode(HSB,360,100,100);
  ellipseMode(CENTER);
}
float a=0;
 float x=random(500);
 float y=random(500);
void draw(){
    stroke(random(100),random(100),random(100));
 translate(x,y);
  rotate(a);
  a=a+0.1;
  line(-50,0,50,0);
  ellipse(-50,0,10,10);
  ellipse(50,0,10,10);
  x=x+random(-20,20);
  y=y+random(-20,20);
}
