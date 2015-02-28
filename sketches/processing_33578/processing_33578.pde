
PImage monroe;
void setup (){
  size(500,500);
  background(0);
  monroe = loadImage ("monroe.png");
  noStroke();
  smooth();

}

void draw(){
  
  float r =map(mouseX,0,width,0,255);
  float g =map(mouseY,0,width,0,255);
  //bg
  fill(r,g,100);
  rect(0,0,width,height);
  //whiteeyes
  fill(255);
  rect(110,235,250,50);
  //eyes
  float leftEyePos = map(mouseX,0,width,141,158);
  float rightEyePos = map(mouseX,0,width,255,275);
  fill(0);
  ellipse(leftEyePos,264,20,20);
  ellipse(rightEyePos,264,20,20);  
  //monroe
  image(monroe,0,0);

}

void mouseDragged() {
  fill(255);
  ellipse(146,260,50,50);
  ellipse(260,260,50,50);
    //eyes
  float leftEyePos = map(mouseX,0,width,141,158);
  float rightEyePos = map(mouseX,0,width,255,275);
  fill(0);
  ellipse(leftEyePos,264,20,20);
  ellipse(rightEyePos,264,20,20);  
}

void mousePressed() {
  ellipse(146,260,50,50);
  ellipse(260,260,50,50);
    //eyes
  float leftEyePos = map(mouseX,0,width,141,158);
  float rightEyePos = map(mouseX,0,width,255,275);
  fill(0);
  ellipse(leftEyePos,264,20,20);
  ellipse(rightEyePos,264,20,20);  
}

  
void mouseClicked() {
  ellipse(146,260,50,50);
  ellipse(260,260,50,50);
    //eyes
  float leftEyePos = map(mouseX,0,width,141,158);
  float rightEyePos = map(mouseX,0,width,255,275);
  fill(0);
  ellipse(leftEyePos,264,20,20);
  ellipse(rightEyePos,264,20,20);  
}
  
void mouseReleased() {
  ellipse(146,260,50,50);
  ellipse(260,260,50,50);
    //eyes
  float leftEyePos = map(mouseX,0,width,141,158);
  float rightEyePos = map(mouseX,0,width,255,275);
  fill(0);
  ellipse(leftEyePos,264,20,20);
  ellipse(rightEyePos,264,20,20);  
}

