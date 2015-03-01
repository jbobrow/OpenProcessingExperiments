
float x;
float y;
float easing = 0.01;
float yspeed = 10;
float xspeed = 10;
float balldiameter = 100;
float ballradius = balldiameter/2;
float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;
float pathAlpha=125;
float Alpha=125;
float centerAlpha=125;


void setup() 
{
  size (1440,900);
  background (255);
  fill (0);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  x = width/2;
  y = height/2;
}
 
void draw() {
  noStroke();
  mouseChecks();
  boundaryChecks();
  ballFunctions();
  keyFunctions();
  fill(pathR, pathG, pathB, 100);
  pathR=centerR+R*sin(a);
  a=a+.003;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.003;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.003;
}

 
 



 
void mouseChecks() {
  if (mousePressed == true) {
    x = mouseX;
    y = mouseY;
    yspeed = mouseY - pmouseY;
    xspeed = mouseX - pmouseX;
    frameRate(60);
  }
}
 
void boundaryChecks() {
  if (y >= height - ballradius) {
    y = height - ballradius;
    yspeed = -yspeed/1.05;
  }
  if (y <= ballradius) {
    y = ballradius;
    yspeed = -yspeed/1.05;
  }
  if (x >= width -ballradius) {
    x = width -ballradius;
    xspeed = -xspeed/1.05;
  }
  if (x <= ballradius) {
    x = ballradius;
    xspeed = -xspeed/1.05;
  }
}
 
void ballFunctions() {
  if (balldiameter < 4) {
    balldiameter = 5;
  }
  if (balldiameter > 400) {
    balldiameter = 400;
  }
  ballradius = balldiameter/2;
  ellipse (x,y,balldiameter,balldiameter);
  yspeed = yspeed += 0.5;
  xspeed = xspeed/1.005;
  y = y + yspeed;
  x = x + xspeed;
}
void keyFunctions() {
  if (keyPressed) {
    if(keyCode == UP) {
      balldiameter +=25;
    }
    if (keyCode == DOWN) {
      balldiameter -=15;
    }
   
   if (keyCode == SHIFT){
  setup();


  }}}



