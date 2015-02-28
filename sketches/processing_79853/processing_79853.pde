
void setup() {
  size ( 300,300);
  smooth();
  background(0);
  mouseX=width/2;
  mouseY=height/2;
}
void draw(){
float r = random(200);
fill(random (256),random (256),random (256) );
triangle(mouseX,mouseY,r,r,random(8),random(10));
r= r+ 20;
}


