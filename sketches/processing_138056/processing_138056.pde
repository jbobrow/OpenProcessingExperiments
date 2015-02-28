

import ddf.minim.*;


//Global variables
Minim mini;
  AudioSample song;
PImage img;
ParticleSystem ps;

//variables for clock
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup()
{
  
  size(800,800);
  
  // draw clock
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
  
  //load image and sound
   ps = new ParticleSystem(new PVector(width/2,50));
  img=loadImage("cake1.gif");
  mini=new Minim(this);
  song=mini.loadSample("birthday.mp3");
}
void draw()
{
  // Draw the clock background
  background(#E58686);
  fill(#E58686);
  fill(0, 102, 153);
 
 stroke(0);
 strokeWeight(5);
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  fill(#E58686);
  
  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  textSize(50);
  text("Click me",300,100);
  
  //draw image
 
  
  if(mousePressed)
 {background(0);
  ps.addParticle();
  ps.run();
     if(key=='b'  || key=='B' )
  {
    image(img,150,150);
  tint(255,150);
    song.trigger();
  }
 }
  if(key=='s'||key=='S')
  saveFrame("bday1.png");

  
}






