
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int counter = 0;
int counter1 = 0;
//---------------redraws clouds-------------

float[] xcloud = new float[0];
float[] ycloud = new float[0];

//--------------thunder-------------------

Minim m;
AudioPlayer thunder;

int colour = 237;

//------------- rain & wind -------------
AudioPlayer wind;
AudioPlayer rain;

ParticleSystem ps; 
float w = 1;
float w1 = -1;

float windvol = 60;
//-------------tornado----------------
int amount = 100;

int[] xpos = new int[amount];
int[] ypos = new int[amount];
int[] wid = new int[amount];
int[] hei = new int[amount];

AudioPlayer tornado;
//------------------------------------


void setup() {
  size(700, 400);
  background(255);
  
  ps = new ParticleSystem(1, new PVector(width/2, height/2, 0)); 
  smooth();
  
  //--------------sound-----------------------

  m = new Minim(this);
  thunder = m.loadFile("thunder.wav");  

  m = new Minim(this);
  wind = m.loadFile("windy.wav");

  m = new Minim(this);
  rain = m.loadFile("rain.wav");
  
  m = new Minim(this);
  tornado = m.loadFile("tornado.wav");
  //---------------------------------------
}


void draw() {
  background(255);
  
//---------------------wind--------------------
  if (counter > 30 && counter < 50) {
    wind.setGain(counter - windvol);
    if(wind.isPlaying() == false){
    wind.loop(0);
    }}
    
//------------------------rain-----------------
  if (counter > 10 && counter < 51) {
    ps.run(); 
    if (mousey) {  
      ps.addParticle(new PVector(mouseX, mouseY));
    }  
    mousey = false;
  }
  
  //-----------------tornado---------------------
   if(counter > 50){
   wind.setGain(-50);
   rain.setGain(-50);
   noFill();
   smooth();
   stroke(64,64,64);
   strokeWeight(3);
   int i = 0;
  int x = 350;
  int y = 0;
  int w = 200;

  while (i < amount) { 
    xpos[i] = mouseX;
    ypos[i] = mouseY + y;
    wid[i] = (height - ypos[i])/2; 
    hei[i] = 20;

    ellipse(xpos[i], ypos[i], wid[i], hei[i]);
    y = y + 5;
    w = w - 5;
    i = i + 1;


    float vol = map(height-mouseY, 0, height, -30, 10);
    tornado.setGain(vol);
    if (tornado.isPlaying() == false ) {
      tornado.loop();
    }
  }}
  //-------------------clouds------------------------

  
  int i = 0;
  while(i < counter1){
    noStroke();
    fill(colour, colour, colour);
    ellipse(xcloud[i] - 8, ycloud[i] - 8, 25, 25);
    ellipse(xcloud[i] + 8, ycloud[i] + 8, 25, 25);
    ellipse(xcloud[i] - 8, ycloud[i] + 8, 25, 25);
    ellipse(xcloud[i] + 8, ycloud[i] - 8, 25, 25);
    ellipse(xcloud[i] + 15, ycloud[i], 25, 25);
    ellipse(xcloud[i] - 15, ycloud[i], 25, 25);
    i = i + 1;
  }

    noStroke();
    fill(colour, colour, colour);
    ellipse(mouseX - 8, mouseY - 8, 25, 25);
    ellipse(mouseX + 8, mouseY + 8, 25, 25);
    ellipse(mouseX - 8, mouseY + 8, 25, 25);
    ellipse(mouseX + 8, mouseY - 8, 25, 25);
    ellipse(mouseX + 15, mouseY, 25, 25);
    ellipse(mouseX - 15, mouseY, 25, 25);}

boolean mousey = false;     

void mouseMoved() {  
  mousey = true; 
  
  if(counter > 12 && counter < 30){
  rain.setGain(-20);
  if(rain.isPlaying() == false) {
  rain.loop(0);
}}}

class Particle {  
  PVector loc;  
  PVector vel;
  PVector acc;
  float r;  
  float timer;    

  Particle(PVector a, PVector v, PVector l, float r_) { 
    acc = a.get();  
    vel = v.get();  
    loc = l.get();  
    r = r_;  
    timer = 100.0;
  }  

  Particle(PVector l) {
    acc = new PVector(0, 0.05, 0);  
    vel = new PVector(random(w1, w), random(-2, 0), 0);  
    loc = l.get();  
    r = 10.0;  
    timer = 500.0;
  }  



  void run() {  

    update();  

    render();
  }  



  // Method to update location  

  void update() {  

    vel.add(acc);  

    loc.add(vel);  

    timer -= 2.0;
  }  



  // Method to display  

  void render() {  

    ellipseMode(CENTER);  

    stroke(0, timer);  

    fill(0, timer);  

    line(loc.x, loc.y, loc.x, loc.y + 5);
  }  



  // Is the particle still useful?  

  boolean dead() {  

    if (timer <= 0.0) {  

      return true;
    }   

    else {  

      return false;
    }
  }
}  



class ParticleSystem {  



  ArrayList particles;    // An arraylist for all the particles  

    PVector origin;        // An origin point for where particles are birthed  



  ParticleSystem(int num, PVector v) {  

    particles = new ArrayList();              // Initialize the arraylist  

      origin = v.get();                        // Store the origin point  

      for (int i = 0; i < num; i++) {  

      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  }  



  void run() {  

    // Cycle through the ArrayList backwards b/c we are deleting  

    for (int i = particles.size()-1; i >= 0; i--) {  

      Particle p = (Particle) particles.get(i);  

      p.run();  

      if (p.dead()) {  

        particles.remove(i);
      }
    }
  }  



  PVector place;  

  void addParticle(PVector _place) {  

    place = _place.get();  



    particles.add(new Particle(place));
  }  





  // A method to test if the particle system still has particles  

  boolean dead() {  

    if (particles.isEmpty()) {  

      return true;
    }   

    else {  

      return false;
    }
  }
} 
void mousePressed() {
  if(mouseButton == LEFT){
  counter = counter + 1;
  colour = colour - 3;
  
  //------------redrawing clouds-------------
  if (mouseY < 75) {
    counter1 = counter1 + 1;
    xcloud = expand(xcloud, counter);
    xcloud[counter1-1] = mouseX;
    ycloud = expand(ycloud, counter);
    ycloud[counter1-1] = mouseY; 
    
  }
//--------------thunder---------------------

  if (counter > 15 && counter < 30) {
      if (mouseY < 75) {
        if(thunder.isPlaying() == false){
          thunder.loop(0);
        }}}
//--------------wind---------------------
  if (counter > 25 && counter < 40) {
    if(w < 40){
    w1 = w1 + 0.5;
    w = w + 0.5;
  }}

  if (counter > 30 && counter < 50) {
    windvol = windvol - 2;
  }}
  
}


