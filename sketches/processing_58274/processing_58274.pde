
import processing.opengl.*;

int delay =0;
int clock;
int dTime;
int fps;
Frame       frame;
GravCenter  gravCenter;
ArrayList   particles;
float scale = 0.5;
int nParticles  = 1000;

float  gravity = 0.01;

void setup() {
  size(500, 500, P3D);
  background(0);
  frame = new Frame();
  gravCenter = new GravCenter();
  particles = new ArrayList();

  for (int i=0;i<nParticles;i++) {
    particles.add(new Particle(random(2)-1, random(2)-1, random(2)-1, 0.009));
  }
}



void draw() {
  background(0);
  delay(delay);
  dTime=millis()-clock;
  fps = int(1000/dTime);
  clock=millis();
  
  showTxt();
  
  noStroke();
  lights();

  translate(width/2, width/2, width/2);
  scale(scale);
  rotateX(rCoord(-mouseY)*2*PI);
  rotateY(rCoord(mouseX)*2*PI);

  gravCenter.display();

  for (int i=0;i<particles.size();i++) {
    Particle particle=(Particle) particles.get(i);
    //    enemy.update(i);
    particle.display();
    particle.update();
  }


  frame.display();
}


float rCoord(float rTemp) {
  return(((rTemp*2)/width) );
}

int sCoord(float cTemp) {
  return(int((cTemp)*scale*width/2));
}

int sSize(float cTemp) {
  return(int((cTemp)*width/2));
}

void showTxt() {
  fill(250);
  textSize(sSize(0.1));
  textAlign(RIGHT);
  text("FPS: "+fps,sSize(2),sSize(0.1));
  textAlign(LEFT);
}


class Frame {

  Frame() {
  }
  void display() {
    stroke(250, 0, 0);      //x axis
    line(sCoord(-1), sCoord(-1), sCoord(-1), sCoord(1), sCoord(-1), sCoord(-1));
    stroke(0, 250, 0);      //y axis
    line(sCoord(-1), sCoord(-1), sCoord(-1), sCoord(-1), sCoord(1), sCoord(-1));
    stroke(0, 0, 250);      //z axis
    line(sCoord(-1), sCoord(-1), sCoord(-1), sCoord(-1), sCoord(-1), sCoord(1));
    stroke(255);
    line(sCoord(1), sCoord(1), sCoord(1), sCoord(1), sCoord(1), sCoord(-1));
    line(sCoord(1), sCoord(1), sCoord(1), sCoord(1), sCoord(-1), sCoord(1));
    line(sCoord(1), sCoord(1), sCoord(1), sCoord(-1), sCoord(1), sCoord(1));

    line(sCoord(-1), sCoord(-1), sCoord(1), sCoord(1), sCoord(-1), sCoord(1));
    line(sCoord(-1), sCoord(-1), sCoord(1), sCoord(-1), sCoord(1), sCoord(1));
    line(sCoord(1), sCoord(-1), sCoord(-1), sCoord(1), sCoord(1), sCoord(-1));
    line(sCoord(1), sCoord(-1), sCoord(-1), sCoord(1), sCoord(-1), sCoord(1));
    line(sCoord(-1), sCoord(1), sCoord(-1), sCoord(-1), sCoord(1), sCoord(1));
    line(sCoord(-1), sCoord(1), sCoord(-1), sCoord(1), sCoord(1), sCoord(-1));
  }
}


class GravCenter {

  float x;
  float y;
  float z;
  float r;

  GravCenter() {
    x=0;
    y=0;
    z=0;
    r=0.02;
  }

  void display() {
    //    sphere(sSize(r));
  }
}


class Particle {
  float x;
  float y;
  float z;
  float r;
  float m;

  Particle(float xTemp, float yTemp, float zTemp, float rTemp) {
    x=xTemp;
    y=yTemp;
    z=zTemp;
    r=rTemp;
    m=1;
  }

  void display() {
    stroke(0);
    translate(sCoord(x), sCoord(y), sCoord(z));
    int R = sSize(r);
    box( (R>=1) ? R:1 );
    translate(-sCoord(x), -sCoord(y), -sCoord(z));
  }
  
  void update() {
    float distance =dist(x,y,x,gravCenter.x,gravCenter.y,gravCenter.z);
    float force=gravity*m/sq(distance);
  }
  
}



