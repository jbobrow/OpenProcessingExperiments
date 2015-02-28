
import traer.physics.*;

import geomerative.*;

ParticleSystem p;
RShape grp;
RPoint[] coords;

Particle[] particles;
Spring[] s;
Attraction[] a;
Particle m;

String msg= "Type!";

int count=1;

void setup() {
  size(800, 500);
  frameRate(30);
  smooth();
  background(255);
  p= new ParticleSystem(0.9, 0.01);
  m=p.makeParticle(1, mouseX, mouseY, 0);
  RG.init(this);
  create();
}


void draw() {
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);
  if(msg.length()>0) {
    m.position().set(mouseX, mouseY, 0);
    pushMatrix();
    translate(width/2, height/2);
    grp.draw();
    popMatrix();
    p.tick();
    stroke(0, 100);
    for(int i=0; i<particles.length-1; i++) {
      line(particles[i].position().x(), particles[i].position().y(),
      particles[i+1].position().x(), particles[i+1].position().y());   
      checkEdges(particles[i]);
    }
  }
}

void create() {
  if(msg.length()>0) {
    grp=RG.getText(msg, "GenBasB.ttf", 100, CENTER); 
    RG.setPolygonizer(RG.ADAPTATIVE);
    coords= grp.getPoints();
    particles= new Particle[coords.length];
    s= new Spring[coords.length];
    a=new Attraction[particles.length];
    for(int i=0; i<coords.length; i++) {
      particles[i]=p.makeParticle(1, coords[i].x+width/2, coords[i].y+height/2, 0);
      particles[i].velocity().set(random(-1, 1), random(-1, 1), 0);
    }
    for(int i=0; i<coords.length-1; i++) {
      s[i]=p.makeSpring(particles[i], particles[i+1], 0.4, 0.05, 
      dist(particles[i].position().x(), particles[i].position().y(),
      particles[i+1].position().x(), particles[i+1].position().y()));
    }
    for(int i=0; i<particles.length; i++) {
      a[i]= p.makeAttraction(m, particles[i], -100000, 150);
    }
    fixParticles();
  }
}

void keyTyped() {
  if(key==ENTER) {
    msg="";
  }
  else {
    msg+=key;
    create();
  }
}

void mousePressed() {
  count++;
  fixParticles();
  println(count%3);
}

void fixParticles() {

  for(int i=0; i<particles.length; i++) {
    particles[i].makeFree();
  }

  if(count%3==1) {
    for(int i=0; i<particles.length; i++) {
      if(i%5==0) {
        particles[i].makeFixed();
      }
    }
  }

  if(count%3==2) {
    for(int i=0; i<particles.length; i++) {
      if(i%25==0) {
        particles[i].makeFixed();
      }
    }
  }
}


void checkEdges(Particle pp) {
  if(pp.position().x()>=width) {
    pp.velocity().set(pp.velocity().x()*-1, pp.velocity().y(), 0);
    pp.position().set(width-1, pp.position().y(), 0);
  }
  if(pp.position().x()<=0) {
    pp.velocity().set(pp.velocity().x()*-1, pp.velocity().y(), 0);
    pp.position().set(1, pp.position().y(), 0);
  }
  if(pp.position().y()>=height) {
    pp.velocity().set(pp.velocity().x(), pp.velocity().y()*-1, 0);
    pp.position().set(pp.position().x(), height-1, 0);
  }
  if(pp.position().y()<=0) {
    pp.velocity().set(pp.velocity().x(), pp.velocity().y()*-1, 0);
    pp.position().set(pp.position().x(), 1, 0);
  }
}


