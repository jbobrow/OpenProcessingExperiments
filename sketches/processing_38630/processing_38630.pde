
//Shiffman fall 2011 week 2 hw
//Feed the piggy some coins!

float x=250;
float y=250;
float eyeSize=30;
float a=0;
float waist=150;
float h=0;
float mouseSpeedx=0;
float mouseSpeedy=0;
int coinSize=60;

void setup() {
  size(500, 500);
  smooth();
  noCursor();
}

void draw() {
  background(188, 240, 245);

  //body stretch
  if (mouseX>=x-waist && mouseX<=x+waist && mouseY<=y+200 && mouseY>=y)
  {
    mouseSpeedx=abs(mouseX-pmouseX);
    mouseSpeedy=abs(mouseY-pmouseY);
    h=mouseSpeedy*5;
    waist=150+mouseSpeedx*2;
  }

  else {
    h=0; 
    waist=150;
    
    //coins    
    fill(252, 202, 18);
    noStroke();
    ellipse(mouseX, mouseY, coinSize, coinSize);
    fill(0);
    text("$1",mouseX-5,mouseY+5);
  }

  //body
  fill(245, 62, 95);
  noStroke();
  beginShape();
  vertex(x-40, y-h);
  bezierVertex(x-waist, y+140, x+waist, y+140, x+40, y-h);
  vertex(x+30, y+10-h);
  vertex(x-30, y+10-h);
  //vertex(x-50, y-50);
  endShape();


  //left eye

  pushMatrix();
  translate(x-40, y+60-h);
  //first i tried the mapping method for the eyeballs rolling
  //int pX= (int) map(mouseX,80,width,-20,20);
  //int pY = (int) map(mouseY,80,height,-20,20);
  //fill(255);
  //ellipse(pX, pY,leftEyesize,leftEyesize);

  //then I used the atan2() function instead
  fill(255);
  //draw white eyeball
  ellipse(0, 0, eyeSize, eyeSize);
  //calculate the angle from mouse to the center of the eyeball
  a=atan2((mouseX-(x-40)), (mouseY-(y+60)));
  //rotate has to be put before the object to be rotated
  //first i tried rotate(a), but the iris goes opposite direction to the mouse
  //so i put minus sign in front of the "a"
  rotate(-a);
  fill(0);
  //draw the iris
  ellipse(eyeSize/4, 0, eyeSize/2, eyeSize/2); 
  popMatrix();


  //right eye
  pushMatrix();
  translate(x+40, y+60-h);
  fill(255);
  ellipse(0, 0, eyeSize, eyeSize);
  a=atan2((mouseX-(x+40)), (mouseY-(y+60-h)));
  rotate(-a);
  fill(0);
  ellipse(eyeSize/4, 0, eyeSize/2, eyeSize/2);
  popMatrix();


  //nose
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(x, y+80-h, 40, 20);
  strokeWeight(8);
  line(x-10, y+80-h, x-10, y+80-h);
  line(x+10, y+80-h, x+10, y+80-h);
}




