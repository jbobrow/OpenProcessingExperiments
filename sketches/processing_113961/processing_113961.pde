
//Thank you Golan + Dan Shiffman for the particle simulation reference code
//Also credit to CreativeCoding.org for the AudioInput reference
import processing.pdf.*;
import ddf.minim.*;

float amp;
Minim minim;
AudioInput input;

ArrayList<Wave> soundwaves;

Repeller centroid;


void setup () {
  background(255);
  size (600, 600);
  smooth();
  noFill();
  stroke(0);

  soundwaves = new ArrayList<Wave>();

  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 512);


  for (int i = 0; i < 14; i++) {
    int numarcs = 4;

    float deg1 = 30+(30*(i+1));
    float deg2 = 110+(30*(i+1));
    for (int j = 1; j <= numarcs; j++) {
      soundwaves.add(new Wave(radians(deg1), radians(deg2), 150+(35*i)));

      deg1 = deg2+ 10;
      deg2 = deg1+ 80;
    }
  }
}


void draw () {
  if (keyPressed) {
    if (key == 'r') beginRecord(PDF, "waves.pdf");
    else if (key == 'e') 
    {
      endRecord();
      exit();
    }
  }

  background(255);
  drawcenter();

  amp = input.mix.level ();

  float voice = map(amp, 0, 0.1, 0, 9900);

  fill(0);

  centroid = new Repeller(width, width, voice);

  for (int i = 0; i < soundwaves.size(); i++) {
    Wave w = soundwaves.get(i);

    PVector force = centroid.repel(w);

    w.addForce(force);
    w.update();

    w.display();
  }
  
}

void drawcenter() {
  ellipse(width/2, height/2, 25, 25);

  float center = width/2;
  float start1 = radians(195);
  float end1 = radians(345);
  float start2 = radians(15);
  float end2 = radians(165);

  //hooray for overly repetitive code
  float diam1 = 50;
  float diam2 = diam1 + 10; 
  float avgdiam = (diam1+diam2)/2;
  float littlediam = (diam2-diam1)/2;
  float p1x = center + (avgdiam/2) * cos(start1);
  float p1y = center + (avgdiam/2) * sin(start1);
  float p2x = center + (avgdiam/2) * cos(end1);
  float p2y = center + (avgdiam/2) * sin(end1);
  float p1x_ = center + (avgdiam/2) * cos(start2);
  float p1y_ = center + (avgdiam/2) * sin(start2);
  float p2x_ = center + (avgdiam/2) * cos(end2);
  float p2y_ = center + (avgdiam/2) * sin(end2);

  //outer arcs
  arc(center, center, diam1, diam1, start1, end1);
  arc(center, center, diam2, diam2, start1, end1);
  arc(center, center, diam1, diam1, start2, end2);
  arc(center, center, diam2, diam2, start2, end2);

  //inner arcs
  arc(p1x, p1y, littlediam, littlediam, start1-PI, start1);
  arc(p2x, p2y, littlediam, littlediam, end1, end1+PI);
  arc(p1x_, p1y_, littlediam, littlediam, start2-PI, start2);
  arc(p2x_, p2y_, littlediam, littlediam, end2, end2+PI);
}

class Repeller {

  float strength;
  PVector location;
  float r = 10;

  Repeller(float x, float y, float str)  {
    location = new PVector(x,y);
    strength = str;
  }

  PVector repel(Wave p) {
    PVector dir = PVector.sub(location,p.location);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d,5,100);
    float force = 1 * strength / (d * d);
    dir.mult(force);
    return dir;
    //[end]
  }
}
class Wave {
  //waves are just arcs
  float start; //the starting angle of the arc
  float end; //the ending angle of the arc

  PVector location;
  PVector velocity;
  PVector acceleration;

  PVector anchor;

  float springConstant = 0.02;

  boolean bLimitVelocities = true;
  boolean bPeriodicBoundaries = false;

  Wave(float start_, float end_, float size) {
    start = start_;
    end = end_;

    float mag = sqrt((size*size)/2);

    location = new PVector(mag, mag);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void addForce(PVector force) {
    PVector f = force.get();
    f.div(location.mag());
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    limitVelocities();
    handleBoundaries();

    location.add(velocity);
    acceleration.mult(0);
    velocity.mult(0.9999);
  }

  void limitVelocities() {
    if (bLimitVelocities) {
      float speed = velocity.mag();
      float maxSpeed = 100;
      if (speed > maxSpeed) {
        velocity.mult(maxSpeed/speed);
      }
    }
  }

  void handleBoundaries() {
    if (bPeriodicBoundaries) {
      if (location.mag() > width*2) location.sub(width, width, 0);
    }
    else if (location.mag() > width*2) velocity.mult(-1);
  }


  void display() {
    noFill();
    float center = width/2;
    
    float diam1 = location.x;
    float diam2 = diam1 + 8; 
    float avgdiam = (diam1+diam2)/2;
    float littlediam = (diam2-diam1)/2;
    float p1x = center + (avgdiam/2) * cos(start);
    float p1y = center + (avgdiam/2) * sin(start);
    float p2x = center + (avgdiam/2) * cos(end);
    float p2y = center + (avgdiam/2) * sin(end);
    
    //outer arcs
    arc(center, center, diam1, diam1, start, end);
    arc(center, center, diam2, diam2, start, end);
    
    //inner arcs
    arc(p1x, p1y, littlediam, littlediam, start-PI, start);
    arc(p2x, p2y, littlediam, littlediam, end, end+PI);
    
  }
}



