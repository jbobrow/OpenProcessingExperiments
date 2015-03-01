
void setup(){
  size(400,400);
}

void draw(){
  background(random(75));
  stroke(0);
  fill(255,192,203);
  float eyeLeftX = constrain(map(mouseX,0,width,67.5,132.5),67.5,132.5);
  float eyeLeftY = constrain(map(mouseY,0,height,132.5,162.5),137.5,162.5);
  float eyeRightX = constrain(map(-mouseX+400,0,width,267.5,332.5),267.5,332.5);
  float eyeRightY = constrain(map(mouseY,0,height,132.5,162.5),137.5,162.5);
  float mouthX = constrain(mouseX,0,400);
  float mouthY = constrain(mouseY,0,400);
  ellipse(200,200,400,400);
  fill(255);
  ellipse(100,150,135,85);
  ellipse(300,150,135,85);
  stroke(0);
  if (mousePressed){
    fill(255,0,0);
  } else {
    fill(124,247,252);
  }
  
  ellipse(eyeLeftX,eyeLeftY,42.5,42.5);
  ellipse(eyeRightX,eyeRightY,42.5,42.5);
  fill(0);
  ellipse(eyeLeftX,eyeLeftY,6.5,6.5);
  ellipse(eyeRightX,eyeRightY,6.5,6.5);
  if (mousePressed){
    fill(0);
    stroke(0);
    ellipse(eyeLeftX-7.5,eyeLeftY-7.5,5,5);
    ellipse(eyeLeftX+7.5,eyeLeftY-7.5,5,5);
    ellipse(eyeLeftX,eyeLeftY+9,5,5);
    ellipse(eyeRightX-7.5,eyeRightY-7.5,5,5);
    ellipse(eyeRightX+7.5,eyeRightY-7.5,5,5);
    ellipse(eyeRightX,eyeRightY+9,5,5);
    fill(255,0,0);
    stroke(255,0,0);
    strokeWeight(10);
    line(200-mouthX/4,302,200-mouthX/4,400);
    fill(255,0,0);
    stroke(0);
    strokeWeight(1);
    ellipse(200,300,mouthX/2,mouthY/15);
  } else {
    fill(255);
    stroke(0);
    ellipse(200,300,mouthX/2,mouthY/15);
  }
}


