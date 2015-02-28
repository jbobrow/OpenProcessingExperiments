

///////////////////////////////////////////////////////////////////
///Based on the sketch "Simple Particle System" by Callum Rogers///
///////////////////////by Alyssa Riach/////////////////////////////
///////////////////////////////////////////////////////////////////


class Particle {
  float x = width;
  float y = height;
  float xv = -3.2+random(6);
  float yv = -random(8); 
  float maxYV = 20;
  float gravity = 0.3; 
  float friction = 1; 
  float radius = random(15,35);
  color Pcolor = color(0,0,0);
  

  
  Particle(float xp,float yp, color tempColor){
    x = xp;
    y = yp;
    Pcolor = tempColor;
  }
  
  Particle(float xp,float yp,float xvel,float yvel) {
    xv = xvel;
    yv = yvel;
  }
  
  void run() {
    update();
    render();
  }
  
  void update() {          
    if(x <= radius) {
      xv = abs(xv);
    }
    else if(x >= width - radius) {   
      xv = -abs(xv);
    }
  
    if(y + radius >= height) {      
      yv = -abs(yv);
      if(y + radius - height >= 0.15) {
        y = height - radius;
        if(yv > -0.1) {
          xv *= 0.96;
        }
      }
    }
  
    if((yv < maxYV)) { 
      yv += gravity;
    }
    yv *= friction;
    y += yv;
  
    x += xv;
  }
  
  void render() {
    fill(Pcolor);
    ellipse(x,y,radius,radius);
  }
}
 

class ParticleSystem {
  ArrayList particles = new ArrayList();
    
   void add(Particle p) {
    particles.add(p);
  }
    
  void removeAll() {
    particles.clear();
  }
    
  void run() {
    for(int i = 0; i < particles.size(); i++) {
      Particle p = (Particle)particles.get(i);
      p.run();
    }
  }
}
 
 
int oneX = 500;
int oneY = 300;
 
int changeX = 10;
int changeY = 5;
int ChangeX = 10;
int ChangeY = 7;
 
ParticleSystem ps;
color ballcolor = color(0,0,0);

import ddf.minim.*;
Minim minim;
AudioPlayer song;

void setup() {
  
  minim =new Minim (this);
  song = minim.loadFile("mySound4.mp3");
  song.play();
 
  size(700, 700);
  ps = new ParticleSystem();
  smooth();
  frameRate(40);
}
 
void draw() {
  background(0);
  ellipseMode(CORNER);
  noStroke();
  ellipse(oneX, oneY, 100, 100);
  oneX += changeX;
  oneY += changeY;
  if(oneX >= 600 || oneX <= 0) {
    changeX *= -1;
  }
  if(oneY >= 600 || oneY <= 0) {
    changeY *= -1;
  }
  if(oneX >= 600) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(155, 0, random(0,255));
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
  if(oneX <= 0) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(0,random(95,255),0);
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
  if(oneY >= 600) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(255, random(205,255), 0);
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
  if(oneY <= 0) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(0, random(70,255), 255);
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
      ps.run();

}

 
void keyPressed() {
  if(key != CODED) {
    switch(key) {
      case 'c' : ps.removeAll(); break;
    }
  }
}

