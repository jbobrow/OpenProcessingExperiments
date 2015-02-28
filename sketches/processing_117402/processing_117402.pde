
float posStep = 0.3;
int   nParticles = 300;
float Positionx = 0;
color c;
Particle[] particles;

 
void setup() {
  size(displayWidth,displayHeight, P3D);
  frameRate(30);
  background(0);
  particles = new Particle[nParticles];
   
  for(int i=0; i<nParticles; i++) {
    particles[i] = new Particle();
  }
}
 
void draw() {
  fill(0,0,0,5);
  rect(0,0,width,height);
  translate(0, 0);
  fill(0, 0,0,1);
  Positionx+=0.25;
  rect(random(0,200), Positionx,7,7);
  translate(4*width/5, 0);
  c = color(255,255,255);
  
 
  for(int i=0; i<nParticles; i++) {
    particles[i].update();
    particles[i].show();
  }
  pushMatrix();
  translate(-700,0);
  c = color(2,255,255);
    for(int i=0; i<nParticles; i++) {
    particles[i].update();
    particles[i].show();
  }
  popMatrix();
}
 
void keyPressed() {
}
 
 
class Particle {
   
  PVector pos;
  float angle;
  float dRange;
  float dAngle;
  color c;
//  PVector pos;
   
  Particle() {
    pos = new PVector(0,0);
    angle  = 0;
    dRange = 0.001;
    dAngle = 0;   
    c = color(255,255,255);
  }
   
  void update() {
    float cor = 0.5*dRange*atan(angle)/PI;
    float randNum = (random(2)-1)*dRange-cor;  //Random number from (-dRange, dRange)
    dAngle+=randNum;                       //We don't change the angle directly
                                           //but its differential - source of the smoothness!
     
    angle+=dAngle;                         //new angle is angle+dAngle
   
    pos.x+=posStep*sin(angle);            //just move on step
    pos.y+=posStep*cos(angle);
  }
   
  void show() {
    fill(c);
    noStroke();
    ellipse(pos.x,pos.y,9,9);
  }
  
  
}



