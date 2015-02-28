

float[] arm = {100,100,200,100};
float[] forearm = {arm[0],arm[1],200,0};
float size = 100;
float position = 100;

void setup(){
  size(500,350);
  stroke(255);
}

void draw(){
  background(51);
  updateArm();
  updateForearm();
  // draw Arm
  line(arm[0],arm[1],arm[2],arm[3]);
  // draw Forearm
  line(forearm[0],forearm[1],forearm[2],forearm[3]);
  // draw elbow
  ellipse(forearm[0],forearm[1],10,10);
  // draw hand
  ellipse(forearm[2],forearm[3],10,10);
}

void updateForearm(){
 float x2 = (cos( mouseY / 50.0) * size) + arm[2];
 float y2 = (sin( mouseY / 50.0) * size) + arm[3];
 forearm[0] = arm[2];
 forearm[1] = arm[3];
 forearm[2] = x2;
 forearm[3] = y2;
}

void updateArm(){
 float x = ( cos(-mouseX / 50.0) * size) + position;
 float y = ( sin(-mouseX / 50.0) * size) + position;
 arm[2] = x;
 arm[3] = y;
}

