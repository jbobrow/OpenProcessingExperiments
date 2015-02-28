
float maxDistance;
int numEllipse = 5000; //5000 total ellises can be drawn
int currentEllipse = 0; //starts at 0 ellipses

void setup() {
frameRate(40);
size(500, 500);
noStroke();
smooth();
fill(0);
maxDistance = dist(0, 0, width, height);
}

void draw(){
 rect (0, 0, 500, 500);
 Clock (0);
 circle();
 drawEyes();
 
}
 
void Clock(int x) {
background(225);
float s = map(second(), 0, 60, 0, 250);
float m = map(minute(), 0, 60, 0, 250);
float h = map(hour(), 0, 24, 0, 250);
rect(s, s, s, s);
rect(m, m, m, m);
rect(h, h, h, h);
for (int i = 0; i <= width; i += 10) {
for (int j = 0; j <= height; j += 20)
             
{stroke( random(0, 255), random(0, 255), random(0, 255));
line(0, i, 500, i); 
     
float mouseDist = dist(mouseX, mouseY, i, j);
float diameter = (mouseDist / maxDistance) * 66.0;
ellipse(i, j, diameter, diameter);
 
  
}                                   
}
}

void circle() {
  if (mousePressed == true) {
    ellipse(mouseX, mouseY, pmouseX, pmouseY);
  if( currentEllipse < numEllipse - 1) {
    currentEllipse++;
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  }
}
}

void drawEyes() {
  noStroke();
  if (mousePressed == true) {
  drawEye(0,400);
  drawEye(100,400);
  drawEye(200,400);
  drawEye(300,400);
  drawEye(400,400);
  drawEye(500,400);
  drawEye(600,400);
  drawEye(700,400);
  drawEye(800,400);
  }
 }
  
void drawEye(float minX, float maxX) {
    
   ellipse(map(mouseX,300,500,minX,maxX), map(mouseY,0,600,250,350), 50, 50);
   
    
}




