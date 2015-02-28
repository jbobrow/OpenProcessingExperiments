
float eyeWidth = 75;
float eyeRadius = .3*eyeWidth;
 
 
 
void setup(){
size (600, 300);
smooth();
noStroke();
}
 
void draw(){
  background(0);
  fill(#fff200);
  smooth();
  ellipse(200, 200, 100, 80);
  ellipse(334, 200, 100, 80);{
  
  }
  animateEyes();
   
}
//pupils
void animateEyes(){
  fill(#ff0202);
  noStroke();
  float leftAngle=atan2(mouseY-200, mouseX-200);
  float leftX=cos(leftAngle)*eyeRadius;
  float leftY=sin(leftAngle)*eyeRadius;
  ellipse(leftX+200, leftY+200, 10, 30);
  float rightAngle=atan2(mouseY-200, mouseX-200);
  float rightX=cos(rightAngle)*eyeRadius;
  float rightY=sin(rightAngle)*eyeRadius;
  ellipse(rightX+334, rightY+200, 10, 30);
}

