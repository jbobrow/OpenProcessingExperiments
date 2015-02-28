
//original code by Caitlin Morris

void setup(){
  size(900,300);
  background(0);
}

void draw(){
  fill(255,255,255);
  noStroke();
  ellipse(300,150,50,90);
  ellipse(600, 150, 50, 90);
  float leftEyePos = map(mouseX,0,width,250,350);
  float rightEyePos = map(mouseX,0,width,550,650);
  fill(0,0,0);
  ellipse(leftEyePos,170,20,20);
  ellipse(rightEyePos,170,20,20);
  float lidPos = map(mouseY,0,height,0,250);
  rect(0,0,width,lidPos);
}

                
                
