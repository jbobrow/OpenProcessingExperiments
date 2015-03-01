

float fltX=random(50,750);
float fltY=random(50,350);
int intBloodY=0;
  
void setup() {
  size(800,400);
  smooth();
}

void drawRobot(float fltRobotX ,float fltRobotY)
{
  noStroke();
  fill(0);
  rect(fltRobotX+20, fltRobotY+0, 38, 30); // head
  rect(fltRobotX+13, fltRobotY+32, 50, 50); // body
  rect(fltRobotX+0, fltRobotY+32, 10, 37); // left arm
  rect(fltRobotX+66, fltRobotY+32, 10, 37); // right arm  
  rect(fltRobotX+21, fltRobotY+84, 18, 50); // left leg
  rect(fltRobotX+41, fltRobotY+84, 18, 50); // right leg 
  fill(255);
  ellipse(fltRobotX+30, fltRobotY+12, 12, 12); // left eye
  ellipse(fltRobotX+47, fltRobotY+12, 12, 12); // right eye
}

boolean targetRobot (float fltSpotX, float fltSpotY) 
{
  fill(0);
  rect(0,0,800,800);
  println(fltSpotX,",",fltSpotY);
  if (mousePressed) {
    fill(255);
  } else {
    fill(0);
  }
  noStroke();  
  ellipse(mouseX,mouseY,120,120);
  drawRobot(fltSpotX,fltSpotY);
  if ((mouseX>(fltSpotX-10)) && (mouseX<(fltSpotX+80)) && (mouseY>(fltSpotY)) && (mouseY<(fltSpotY+100)) && mousePressed)  {
    return true;
  } else { return false;}
}

void draw() {
  if (targetRobot(fltX,fltY)) {
    fill(128, 0,0);
    rect(0,0,800,intBloodY);
    intBloodY+=10;
  } 
   if (keyPressed) {
    fltX=random(50,750);
    fltY=random(50,350);
  }
}

void mouseReleased() {
  if (intBloodY>400) {
    intBloodY=0;
  }
}



