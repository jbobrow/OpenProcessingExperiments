
/* 
moon
by Simon Fraser Duncan (www.sayssimonmusic.com) 
press any key to spawn stars and rays of 'light'
move mouse to move 'moon' 
change int 'circlepop' to change the 'crater' effect on the moon
*/

float speed = 0.5;
float x;
float y;
float easing = 0.99;
float ex;
float ey;
int diameter = 20;
int circlepop = 20;
int moonX = 200;
//int moonX = mouseX;
//use mouseX to move the moon along the X axis
int moonY = 200;
//int moonY = mouseY;
//use mouseY to move the moon along the Y axis 


void setup () {
  size (400, 400);
  smooth();
  x = width /2;
  y = height /2;
  strokeWeight(1);
  background(100);
}

void draw () {
  fill(255, 5);
  noStroke();
  float targetX = mouseX;
  ex+= (targetX - ex) * easing;
  float targetY = mouseY;
  ey+= (targetY - ey) * easing;
  ellipse(moonX, moonY,ex/2,ex/2);
  if (keyPressed) {
    strokeWeight(0.5);
    fill(255,255,255,5);
    rect(-100,-100,600,600);
    for (int z = 0; z <= 500; z+=20) {
      for (int a = 0; a <=500; a+=20) {
        stroke(255,10);
        line(z,a,mouseX,mouseY);
        float offsetZ = random(-z/2,z*22);
        float offsetA = random(-a/2,a*2);
        noStroke();
        fill(255,100);
        ellipse(offsetZ,offsetA,2,2);
      }
    }
    fill(0,0,0,30);
  } 
  
  else {
  strokeWeight(1);
  }
  
  for (int x = width/2; x<=width; x+=10) {
    for (int y = height/2; y<=height; y+=10) {
      stroke(10,10,10,10);
      float speed2 = 5;
      fill(0,0,0,20);
      float mx = x*speed2/2;
      float my = y*speed2/2;
      float offsetX = random(-mx,mx);
      float offsetY = random(-mx,mx);
      ellipse(offsetX, offsetY,circlepop,circlepop);
    }
  }
}         
                                                                
