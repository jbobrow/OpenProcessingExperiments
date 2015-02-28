
void setup(){
  background(45,82,131);
  size(700,600);
  smooth();
}

void draw(){
  stroke(75,132,211);
  strokeWeight(1);
  fill(63,107,167,50);
  float y = random(width);
  float z = random(height);
  float t = random (10,50);
  rect (y,z,t,t);
  
  float w = random (width);
  float x = random (height);
  fill(160,180,206,50);
  float u = random (20,70);
  ellipse (w,x,u,u);
  
  strokeWeight(1/2);
  float a = random (width);
  float b = random (height);
  fill(83,144,165,10);
  triangle(mouseX,b+15,a+10,mouseY,a+20,b+15);
}

