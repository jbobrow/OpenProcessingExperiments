
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

int numParticles = 400;
// !--------------------------------------------------------------!
// WaterParticles and SparkParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] p = new GenParticle[numParticles];
GenParticle[] s = new GenParticle[numParticles];
GenParticle[] h = new GenParticle[numParticles];
 
void setup() {
  size(300, 300);
  
  minim = new Minim(this);  
  song = minim.loadFile("Eye of the Tiger.mp3", 2048);
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
      beat.setSensitivity(50);
        kickSize = snareSize = hatSize = 0;
          bl = new BeatListener(beat, song);  
            song.loop();  

  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5,-3);
    // note the different origin locations, here
    // sparks are made near the top of the sketch, water comes up from the bottom

    s[i] = new SparkParticle(0, 85, velX, velY, 5.0, width/2, 25); 
   
      p[i] = new jumpingParticle(random(width), height, velX, velY, 5.0, width/2, height); 
 
      h[i] = new SparkParticle2(300, 95, velX, velY, 5.0, width/2, 25); 
    
  }
  }

 
void draw() {
delay(5);
    
  fill(0, 36);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    if (beat.isKick()) {
      s[i].regenerate();
    }
 
    if (beat.isSnare()) {
      p[i].regenerate();
    }
     if (beat.isHat()) {
      h[i].regenerate();
    }
    s[i].update();
    s[i].display();
    
      p[i].update();
    p[i].display();
    
      h[i].update();
    h[i].display();
    
  
  }
}
 
 
class jumpingParticle extends GenParticle {
  float age;
 
  jumpingParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0; // age is used for color; water starts off blue and gradually turns to white and very transparent (vapor)
  }
 
  void display() {

    color c = lerpColor(color(30,189,12,30), color(255,255,255,5), age * 0.005);
    fill(c);
        rotate(degrees(45));
    rect(x, y, 5, radius);

    radius+=0.5; // radius gradually gets bigger
    age++;

  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = random(width);
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(-7.0, -5.0);
      radius = 5.0;
      age = 0;
    }
  }
}
 
 
class SparkParticle extends GenParticle {
  float age;
 
  SparkParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }
 
  void update() {
    if(y >= 300) { // added bounce here
      y = 200;
      vy = -0.5 * vy;
      radius = radius * 1.5;  // radius shrinks when a spark hits something
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }
 
  void display() {
    color c = lerpColor(color(255,255,255,80), color(225,100,0,80), age * 0.01); // create the changing color effect
    fill(c);
    ellipse(x, y, radius, radius);
  }
 
  void regenerate() {
    if (age > 300) {    // sparks die at age 300
      x = 0;
      y = 85;
      vx = random(-1.5, 1.5);    // more x velocity than y
      vy = random(-1, -0.5);
      age = 0;
      radius = 5.0;
    }
  }
}
 
 
class GenParticle extends Particle {
  float originX, originY;
 
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
class SparkParticle2 extends GenParticle {
  float age;
 
  SparkParticle2(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }
 
  void update() {
    if(y >= 300) { // added bounce here
      y = 200;
      vy = -0.5 * vy;
      radius = radius * 1.5;  // radius shrinks when a spark hits something
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }
 
  void display() {
    color c = lerpColor(color(255,255,255,80), color(225,0,0,80), age * 0.003); // create the changing color effect
    fill(c);
    ellipse(x, y, radius, radius);
  }
 
  void regenerate() {
    if (age > 300) {    // sparks die at age 300
      x = 300;
      y = 25;
      vx = random(-1.5, 1.5);    // more x velocity than y
      vy = random(-1, -0.5);
      age = 0;
      radius = 5.0;
    }
  }
}
 
 
class GenParticle2 extends Particle {
  float originX, originY;
 
  GenParticle2(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
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
 
 
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.1;
 
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
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( song.isMuted() )
    {
      song.unmute();
    }
    else
    {
      song.mute();
    }
  }
}

void stop()
{
 song.close();
  minim.stop();

 super.stop();
}




class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
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


