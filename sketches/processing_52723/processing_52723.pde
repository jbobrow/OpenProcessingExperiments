
float angle = 0;   
float aVelocity = 0;
float aAcceleration = 0.001;
void setup() {
  background(100,170,110);
  size(600,600);
}
 
void draw() {
   
  fill(175);
  stroke(0);
  translate(width/2,height/2);
  rotate(angle);
  stroke(100,100,255);
  fill(mouseY,mouseY,0);
 // ellipse(150,0,180,18);
 ellipse(mouseX,0,180,mouseY);
   fill(50,mouseX+10,55);
  ellipse(-150,0,180,18);
   
  stroke(255,0,0);
  fill(255,255,mouseX-100);
  //ellipse(50,0,80,18);
   ellipse(50,0,mouseX,mouseY);
   fill(mouseX,50,50);
  ellipse(mouseX,0,80,18);
aVelocity += aAcceleration;
angle += aVelocity;
}

