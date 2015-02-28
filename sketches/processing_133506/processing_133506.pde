
int x=0;
int speed=5;
 
void setup(){
  size(400,400);
  smooth();
  noFill();
  background(0);
}
 
void draw(){
  frameRate(30);
  noFill();
  float a=random(400);
  float b=random(400);
  stroke(b/1.5,200,a/1.5,25);
  strokeWeight(0.5);
  line(200,200,200,200);
  for (int i=0; i<25;i=i+5)
  {
    triangle(a,b,b,a,200,200); 
}

 
}
