
// perlin noise demo
// by steven kay

ArrayList all;
int PARTICLES=3000; // number of particles
float scaler=0.005;
float DISTORT=0.01; // effect parameter
float SPEED=1.0;
long framecount=0; // used for color cycling
float offset=0.0;
boolean showtrails=false; // if false, erase each frame

class Particle{
  float x;
  float y;
  float z;
  float r,g,b;
  public Particle() {
    x=random(0,512);
    y=random(0,512);
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
  }
  
  public void randomize(){
    x=random(0,512);
    y=random(0,512);
    z=random(0,512);
  }
  
  public void move() {
    float ang=((float)(Math.PI*2.0))*noise(0+(this.x*scaler),offset+(this.y*scaler));
    this.x+=SPEED*Math.cos(ang);
    this.y+=SPEED*Math.sin(ang);
    if (this.y>512.0 || this.y<0.0 || this.x>512.0 || this.x<0.0) {
      randomize();
    }    
  }
  
}

void setup() {
  all=new ArrayList();
  for (int i=0;i<PARTICLES;i++) {
    all.add(new Particle());
  }
  size(512,512,P3D);
  background(0);
}

void mousePressed() {
  reset();
}

void keyPressed() {
  
  if (key==' ') reset();
  if (key=='t'||key=='T') showtrails=!showtrails;
}

void reset() {
  offset=random(99000.0);  
  background(0);
  for (int i=0;i<PARTICLES;i++) {
    Particle p=(Particle)(all.get(i));
    p.randomize();
  }
}

void draw() {
  noStroke();
  framecount++;
  offset+=DISTORT;
  if (!showtrails) background(lerpColor(color(255,0,0),color(0,0,255),0.5f+(0.5f*(float)Math.abs(Math.sin(framecount/360.0)))));
  for (int i=0;i<PARTICLES;i++) {
    Particle p=(Particle)(all.get(i));
    p.move();
    fill (p.r,p.r,p.r,255);
    rect(p.x,p.y,2,2);
  }  
}



