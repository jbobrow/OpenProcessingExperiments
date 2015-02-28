
/*
 * Stinger
 * Geo Meadows - Iss A 26 Aug 11
 *
 * An exercise in interaction and also a simple game.
 * 
 * Start by pressing the UP button to open the beehive.
 * Bees will flood in to be greeted by a bee-eating wasp.
 * Use arrow keys to move wasp to sting/kill the bees.
 *
 * Any bugs or suggestions?
 *
 * Based on object interaction code by Keith Peters www.bit-101.com  
 */
 
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SineWave sine; 

int numBalls = 40; //adjust as required
float spring = 1.1; //collision spring
float gravity = 0.2; //pulling force towards centre
float friction = 0.95; //gradually reduces speeds
int[] hz;
int F = 220; //base freq for sound effects
int hits; //used to select activity frequency
boolean newdead = false;
boolean flapup = false;
boolean inside = false;
boolean someleft = true;
Ball[] balls = new Ball[numBalls]; //ball array called 'balls' of object type 'Ball'

void setup() 
{
  size(640, 480);
  frameRate(20);
  PFont font;
  font = loadFont("ArialNarrow-Bold-16.vlw");
  textFont(font, 22);
  
  //set up tones with Pythagorean intervals
  hz = new int[32]; 
  for (int i=0; i<25; i+=7) {
  hz[i]=F; hz[i+1]=F*9/8; hz[i+2]=F*81/64; hz[i+3]=F*4/3; hz[i+4]=F*3/2; hz[i+5]=F*27/16; hz[i+6]=F*243/128; F+=F;
  }
   
  minim = new Minim(this);   // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(40, 0.5, out.sampleRate());  // create a sine wave Oscillator
  sine.portamento(50);  // set the portamento speed
  out.addSignal(sine);  // add the oscillator to the line out
  
  smooth();
  colorMode(HSB);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(20,width/2-30), random(20,height-30), random(15, 25), i, balls, random(20,50), false);
  }
  balls[0].dia=20;   //wasp
  balls[0].x=width*0.9; 
  balls[0].y=height*0.2;
}

void draw() {
  if (newdead) {
   newdead = false;
   sine.setFreq(3000);
   delay(50);   
  }
  if (!someleft) {stop();}
  sine.setFreq(hz[hits%32]); 

 
  background(50,10,150);
  hits=0; 
  if (!flapup) {
    
 //  fill(42,255,255);
 //  text ("Press UP arrow to start ", 10, 18); 
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {flapup = true;}
      }
    }
  }
 
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide(); 
    balls[i].move();
    balls[i].display();    
  }
  someleft = false;
  for (int i = 1; i < numBalls; i++) {
    if (balls[i].dead == false) { someleft = true; }
    }
  if (!someleft) {
    int m = int(millis()/1000);
    String s1 = "Finished!  Time Taken = " + m + " Secs";
    fill(42,255,255); 
    text (s1,10,20);
    }
  }

class Ball {
  float x, y;
  float dia;
  float vx = 0;
  float vy = 0;
  float rot;
  int id;
  Ball[] others;
  float colour;
  boolean dead;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin, float col, boolean deadin) {
    x = xin;
    y = yin;
    dia = din;
    id = idin;
    others = oin; //an array of 'Ball' objects
    colour = col;
    dead = deadin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
        float dx = others[i].x - x;
        float dy = others[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = others[i].dia/2 + dia/2;
        if (id == 0) {minDist *=2;}
        float bounce=spring;
        if (id == 0) {bounce = spring*5;}   //wasp
        if (!flapup) {bounce = 0.01;}
        if ((distance < minDist) ) {    
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * bounce;
        float ay = (targetY - others[i].y) * bounce;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;  
        if (id == 0) {
          if ((y < others[i].y + 20) && ( y > others[i].y - 20) && (x > others[i].x    ) ) {   
          others[i].dead = true;
          newdead = true;;         
          }
        }
        if (hits < 32) {hits++;}       
        }
      } 
   }
  
  void move() {
    if (x > width*0.5) {inside=true;}
    else inside=false;   
    if (id>0) {                          // bees
      
      vx *= friction;
      if (x < width*0.75) { vx += gravity; }
      if (x > width*0.75) { vx -= gravity; }
      
      if (inside) {                      // inside hive
        vy *= friction;
        if (y < height*0.5) { vy += gravity; }
        if (y > height*0.5) { vy -= gravity; }      
        y += vy;
        if (y+dia/2 > height)  //bounce off bottom wall
            { y = height - dia/2; vy *= -1;  if (hits < 32) {hits++;} } 
        else if (y-dia/2 < 0)  //bounce off top wall
            { y = dia/2; vy *= -1;  if (hits < 32) {hits++;} }
        x += vx; 
        if (x+dia/2 > width)  //bounce off right wall
          { x = width-dia/2; vx *= -1;   if (hits < 32) {hits++;} }
        if ((x-dia/2 < width*0.5 ) && ( (y+dia/2 < height*0.75 || y-dia/2 > height*0.8) ) ) //bounce off hive wall
          { x = width*0.5 + dia; vx *= -1;  if (hits < 32) {hits++;} }        
      }
      else {                                // outside hive
      if (flapup) {
        vy *= friction;
        if (y < height*0.75) { vy += gravity; }
        if (y > height*0.75) { vy -= gravity; }      
        y += vy;
        if (y+dia/2 > height) 
            { y = height - dia/2; vy *= -1;  if (hits < 32) {hits++;} } //bottom bounce
        else if (y-dia/2 < 0) 
            { y = dia/2; vy *= -1;  if (hits < 32) {hits++;} } //top bounce       
        
        if ((x+dia > width/2-10) && ((y+dia/2 < height*0.75) || (y-dia/2 > height*0.8))) {}
        if ((y+dia/2 > height*0.75) && (y-dia/2 < height*0.8)) { x += vx*2; } 
        if (x < dia/2 ) { x = dia/2; vx *= -1; if (hits < 32) {hits++;} }  //left wall bounce  
      } 
    }
  }
    // deal with wasp position & allow 'spring' adjustment
    else {       
      if(keyPressed) {
        if (key == CODED) {
          if ((keyCode == LEFT) && (x>width/2+20)) {x -= 10;}
          if ((keyCode == RIGHT)  && (x<width-20)){x += 10;}
          if ((keyCode == UP) && (y>10)) {y -= 10;}
          if ((keyCode == DOWN) && (y<height-10)) {y += 10;}
          }
        else {   
          if  (key == 'S' && (spring < 2.0)) {spring += 0.02;}
          else if (key == 's' && (spring > 0.021)) {spring -= 0.02;}    
       //debug   println("spring = " + spring + "  gravity = " + gravity + "  friction = " + friction);
        }
      }
    }
  }  

void display() {
  //draw hive wall
  rect(width/2-3,0,6,height*0.7);
  rect(width/2-3,height*0.8,6,height*0.2);
  if (!flapup) {
    rect(width/2-9,height*0.69,6,height*0.12);
  }
  else {
    rect(width/2-9,height*0.58,6,height*0.12);
  }
  fill(int(colour),255,255);
  x += random(-3, 3);  //add jitter
  y += random(-3, 3);
  float x2 = width*0.75-x;
  float y2 = height*0.5-y;
  float ang = atan2(y2, x2); 
  //draw bees
  if (id>0) { 
    if (!dead) { 
    ellipse(x, y, dia, dia); 
    ellipse(x+cos(ang)*dia/1.8, y+sin(ang)*dia/1.8, dia/2, dia/2); 
      }
    }
  
  else {
    //draw wasp body
    fill(42,255,255); 
    ellipse(x-dia*0.7, y, dia, dia/8);  //sting
    ellipse(x, y, dia, dia*0.7);
    fill(255,0,0);
    ellipse(x+dia*0.25, y, dia,dia*0.8);  
    fill(42,255,255); 
    ellipse(x+dia*0.5, y, dia, dia); 
    //add wings
    fill(255,20);
    pushMatrix(); 
    translate(x+12,y);
    rotate(PI/6);
    ellipse(0, 0, dia*4, dia/4);  
    popMatrix();
    //more body
    fill(255,0,0);
    ellipse(x+dia*0.75, y, dia, dia);  
    fill(42,255,255); 
    ellipse(x+dia, y, dia, dia);
    //add eyes
    fill(255,0,0);
    ellipse(x+dia-3, y, dia/5, dia/5);  
    ellipse(x+dia+3, y, dia/5, dia/5);   
    }    
  }
}


void stop() {    // close Minim audio classes when done with
  out.close();
  minim.stop();
//  super.stop();
}


