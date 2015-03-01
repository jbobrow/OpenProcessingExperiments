
ArrayList particles;
ArrayList worms;
mos[] ms;
rect r;
int mode=1;

void setup() {
  size(1024, 768);
  background(0);
  particles = new ArrayList();
  worms = new ArrayList();
  int numms=200;
  ms=new mos[numms];
  for (int i=0; i<ms.length; i++) {
    ms[i]=new mos(0.0, 50.0, 0.0, 0.5);
  }
  smooth();
  r=new rect(0, 0, 1024, 768);
}

void draw() {
  if (mode==1) {
    particles.add(new Particle());
    for (int i = 0; i < particles.size(); i++ ) { 
      Particle p = (Particle) particles.get(i);
      p.fly();
      p.gravity();
      p.display();
    }

    if (particles.size() > 100) {
      particles.remove(0);
    }
  }
  else if (mode==2) {
    worms.add(new Worm());  


    for (int i = 0; i < worms.size(); i++ ) { 
      Worm w = (Worm) worms.get(i);
      w.fly();
      w.gravity();
      w.display();
    }

    if (worms.size() > 300) {
      worms.remove(0);
    }
  }
  else if (mode==3) {
    for (int i=0; i<ms.length; i++) {
      ms[i].drawmos();
    }
    for (int i=0; i<ms.length; i++) {
      if (mousePressed==true) {
        ms[i].drawmos();
      }
    }
  }
  r.drawrect();
}

void keyPressed(){
  if(mode==1){
    mode=2;
  }else if(mode==2){
    mode=3;
  }
}

class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Particle() {
    x = mouseX;
    y = mouseY;
    xspeed = random(-5,5);
    yspeed = random(-5,0);
  }
  
  void fly() {
    x = x+ tan(xspeed)*(xspeed/3);
    y = y+ tan(yspeed)*yspeed;
  }
  
  void gravity() {
    yspeed += 0.1;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x,y,2.5,2.5);
  }
}

class Worm {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Worm() {
    x = mouseX+random(-250,250);
    y = mouseY+random(-250,250);
    xspeed = -5;
    yspeed = 5;
  }
  
  void fly() {
    if(x<mouseX){
      x+=sin(xspeed);
    }else {
      x-=sin(xspeed);
    }
    if(y<mouseY){
      y+=cos(yspeed);
    }else{
      y-=cos(yspeed);
    }
  }
  
  void gravity() {
    yspeed += 0.1;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x,y,5,5);
  }
}

class mos{
  float x = 0.0;       // X-coordinate
  float y = 50.0;      // Y-coordinate
  float angle = 0.0;   // Direction of motion
  float speed = 20.0; 

  
mos(float tempx, float tempy, float tempangle, float tempspeed){
  x=tempx;
  y=tempx;
  angle=tempangle;
  speed=tempspeed;
}

void drawmos(){
  pushMatrix();
  angle += random(-0.3, 0.3);
  x += sin(angle) * speed;  
  y += cos(angle) * speed;  
  translate(x, y);
  rotate(angle/6);
  fill(255);
  ellipse(2*y+300,2*x+200,3,3);
  popMatrix();

}
}

class rect{
  int x;
  int y;
  int h;
  int w;
  
  rect(int tempx, int tempy, int temph, int tempw){
    x=tempx;
    y=tempy;
    h=temph;
    w=tempw;
  }
  void drawrect(){
    fill(0,30);
    rect(0,0,768,768);
  }
}
