
/**
*  Tower of Babel by Krystof Pesek, licensed under Creative Commons Attribution-Share Alike 3.0 license.
*  Work: http://openprocessing.org/visuals/?visualID=68096
*  License: http://creativecommons.org/licenses/by-sa/3.0/
*
* visit more @ http://vimeo.com/kof
* if you leave this header, bend, share, spread the code, it is a freedom!
*
*   ,dPYb,                  ,dPYb,
*   IP'`Yb                  IP'`Yb
*   I8  8I                  I8  8I
*   I8  8bgg,               I8  8'
*   I8 dP" "8    ,ggggg,    I8 dP
*   I8d8bggP"   dP"  "Y8ggg I8dP
*   I8P' "Yb,  i8'    ,8I   I8P
*  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
*  88P      Y8P"Y8888P"    PI8"8888
*                           I8 `8,
*                           I8  `8,
*                           I8   8I
*                           I8   8I
*                           I8, ,8'
*                            "Y8P'
*
*/



import traer.physics.*;

ParticleSystem physics;

ArrayList p;
ArrayList s;

float SPRING_STRENGTH = 0.04;
float SPRING_DAMPING = 0.01;
int MAX_CONNECTIONS = 4;

float maxH = 0, rmax = 0;

PImage back;
ArrayList mraky;
int mraky_pocet = 10;

void setup() {

  size(400, 640, P2D);

  smooth();

  maxH = rmax = height;

  textFont(loadFont("53Seed-8.vlw"));
  textMode(SCREEN);

  physics = new ParticleSystem(0.1, 0.01);

  p = new ArrayList();
  s = new ArrayList();

  mraky = new ArrayList();

  for (int i = 0 ; i < mraky_pocet;i++) {
    mraky.add(new Mrak());
  }

  back = loadImage("background.gif");

  rectMode(CENTER);
}

class Spring {
  Particle a, b;

  Spring(Particle _a, Particle _b) {
    a=_a;
    b=_b;
  }

  void draw() {
    line(a.position().x(), a.position().y(), 
    b.position().x(), b.position().y());
  }
}

void draw()
{
  physics.tick();
  background(back); 

  for (int i = 0 ; i < mraky.size();i++) {
    Mrak m = (Mrak)mraky.get(i);
    m.draw();
  }
  
  fill(0);
  noStroke();
  rect(width/2,height-1.5,width,3);



  rmax = height;

  for (int i =0  ; i < p.size();i++) {
    Particle current = (Particle)p.get(i);
    ////////////
    if (current.position().x()>width||current.position().x()<0) {
      current.velocity().set(current.velocity().x()*(-1.0), current.velocity().y(), 0);
      current.position().set(constrain(current.position().x(), 0, width), current.position().y(), 0);
    }


    if (current.position().y()>height-5||current.position().y()<0) {
      current.velocity().set(current.velocity().x(),current.velocity().y()*(-1.0), 0); 

      current.position().set(current.position().x(),constrain(current.position().y(), 0, height), 0);
    }

    if (current.position().y()<rmax) {
      rmax =  current.position().y();
    }

    ///////////
    noStroke();
    fill(0);
    ellipse(current.position().x(), current.position().y(), 8, 8);
  }


  for (int i =0  ; i < s.size();i++) {
    Spring tmp = (Spring)s.get(i);
    strokeWeight(5);
    stroke(0);
    tmp.draw();
  }

  int num = 0;
  for (int i =0  ; i < p.size();i++) {
    Particle current = (Particle)p.get(i);

    /// physics instable fix
    if (current.position().y()>height-10) {
      current.velocity().set(current.velocity().x()*0.5, current.velocity().y()*0.5, 0);
    }

    float d = dist(mouseX, mouseY, current.position().x(), current.position().y());
    if (d<100 && num<4) {
      stroke(0, 127);
      line(mouseX, mouseY, current.position().x(), current.position().y());
      num++;
    }
  }

  if (frameCount>200) {
    maxH+=(rmax-maxH)/20.0;
  }

  pushStyle();
  strokeWeight(1);
  dline(0, maxH, width, maxH, 5);
  textAlign(RIGHT);
  int meters = round((height-maxH)/10.0);
  text(meters+"m", width-5, maxH-2);
  popStyle();
}

void mousePressed() {
  p.add(physics.makeParticle(0.2, mouseX, mouseY, 0.0));

  int num = 0;
  for (int i =0  ; i < p.size()-1;i++) {
    Particle current = (Particle)p.get(p.size()-1);
    Particle tmp = (Particle)p.get(i);
    float d = dist(tmp.position().x(), tmp.position().y(), current.position().x(), current.position().y());
    if (d<100 && num<MAX_CONNECTIONS) {
      s.add(new Spring(current, tmp));
      physics.makeSpring(current, tmp, SPRING_STRENGTH, SPRING_DAMPING, d);
      num++;
    }
  }
}

class Mrak {
  PVector pos;
  float vel;
  PImage map;
  float freq;

  Mrak() {
    pos = new PVector(random(-300, width), random(150));
    vel = random(0.001, 0.33);
    map = loadImage("mrak"+(int)random(1, 3)+".gif");
    map.mask(map);
    freq = random(200, 400);
  }

  void draw() {
    pos.x += vel;
    pos.y += (noise(frameCount/freq)-0.5)/30.0;
    image(map, (int)pos.x, (int)pos.y); 

    if (pos.x>width)
      pos.x = -map.width;
  }
}


