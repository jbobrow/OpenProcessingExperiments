
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;    
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;
 
 
float kickSize, snareSize, hatSize;
 
int numParticles = 100;
 
float Levels = 0;
 
// !--------------------------------------------------------------!
// IceParticles and KickParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] s = new GenParticle[numParticles];
GenParticle[] k = new GenParticle[numParticles];
GenParticle[] h = new GenParticle[numParticles];

void setup() {
 
  minim = new Minim(this);   
  mySound = minim.loadFile("j5.mp3");
  mySound.loop();
  beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());
  beat.setSensitivity(35);
  kickSize = snareSize = hatSize = 0;
  bl = new BeatListener(beat, mySound);
 
  size(550, 800);
  noStroke();
  smooth();
  for (int i = 0; i < s.length; i++) {
    float velX = random(-3, 3);    // set the initial velocities to throw particles from all sides of the origin
    float velY = random(-3, 3);
    s[i] = new RightParticle(width/2, height/2, velX, velY, 10.0, width/2, height/2);
    k[i] = new LeftParticle(width/2, height/2, velX, velY, random(10.0,20.0), width/2, height/2);
    h[i] = new Left2Particle(width/2, height/2, velX, velY, random(10.0,20.0), width/2, height/2);
  }
}
 
void draw() {
  fill(0, 5);
  rectMode(CORNER);
  rect(0, 0, width, height);
  for (int i = 0; i < mySound.bufferSize() - 1; i += 20) {
    Levels = pow(mySound.mix.level()*5, 3);
  }
  for (int i = 0; i < s.length; i++) {
 
    if (beat.isKick()) {
      k[i].regenerate();
    }
 
    if (beat.isSnare()) {
      s[i].regenerate();
    }
    if (beat.isKick()) {
      h[i].regenerate();
    }
 
 
 
    k[i].update();
    k[i].display();
 
    s[i].update();
    s[i].display();
    
    h[i].update();
    h[i].display();
  }
}
 
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.025;
 
  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }
 
  void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
  }
 
  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
 
 
class GenParticle extends Particle {
  float originX, originY, originV, originW;
 
  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}
 
class RightParticle extends GenParticle {
 
  RightParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    gravity = .1;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-Levels, Levels);    // Kicks are thrown in all directions, left, right, up, down
      vy = random(-Levels, Levels);
    }
  }
 
 
 
  void display() {
    fill(255, 30);
    ellipse(x, y, radius*2, radius*2);
  }
}
 
class LeftParticle extends GenParticle {
 
  LeftParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    gravity = .1;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = width;
      y = height/3;
      vx = random(-Levels, Levels);    // Kicks are thrown in all directions, left, right, up, down
      vy = random(-Levels, Levels);
    }
  }
 
 
 
  void display() {
    fill(243, 247, 25, 50);
    ellipse(x, y, radius*2, radius*2);
  }
}
class Left2Particle extends GenParticle {
 
  Left2Particle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    gravity = .1;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = 0;
      y = (height/3);
      vx = random(-Levels, Levels);    // Kicks are thrown in all directions, left, right, up, down
      vy = random(-Levels, Levels);
    }
  }
 
 
 
  void display() {
    fill(243, 247, 25, 50);
    ellipse(x, y, radius*2, radius*2);
  }
}
 
 
 
 
 
 
 
class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioPlayer source;
 
  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
 
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
 
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}


