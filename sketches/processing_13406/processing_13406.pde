
void setup(){
  size(500,500);
  background(random(50));
  noFill();
  smooth();
  frameRate(100);
}
 
void draw(){
  float a = random(10);
  float b = random(30);
  float c = random(50,200);
  float d = random(0.1,4);
  rotate(c);
  stroke (mouseX+a,mouseY+a+b,mouseY-c);
  strokeWeight (d);
  rect (mouseX,mouseY,a,b);
  }
                
                
