
/*
 J. Dailey Clash of Structure & Order
 Some code derived from:
 - Examples -> Typography -> Words
 - Examples ->Minim Audio ->LoadFile
 */

// Sound.
import ddf.minim.*;
AudioPlayer battle; Minim minim;

//
PImage bg;

// Top adjectives is for the adjectives for the Outer ascpect. 
float x_Introverted = 0;
int Introverted_hp = 5;

// Bottom adjectives is for the adjectives for the Inner aspect.
float x_Authoritative = 0;
int Authoritative_hp = 5;
//
float OutSpeed, InSpeed, y1_Position, y2_Position = 0;
//
// Font.
PFont fontA;

void setup() 
{
  //
  size(640, 240); background(255); bg = loadImage("space.jpg"); 

 minim = new Minim(this);
 battle = minim.loadFile("war.wav", 1024); battle.loop();
 
  // Loading font type.
  fontA = loadFont("Verdana-Bold-16.vlw");
  // Setting up the font variable and size.
  textFont(fontA, 14);
  OutSpeed = random(0, 3) + .5;   InSpeed = random(0, 3) + .5;

  // Outer aspect cordinates from y-axis. 
  x_Introverted = -20;
  y1_Position = random(15, 225);
  
  // Inner aspect aspect cordinates from y-axis.
  x_Authoritative = 660;
  y2_Position = random(15, 225);
  
}

void draw() 
{
  println(OutSpeed);
  // Re-coded to create consistentcy.
  background(125); image(bg, 0, 0, width, height);
  //
  textAlign(CENTER);
  Introverted(); Authoritative();
  
}

void Introverted() 
{
  //
  fill(255, 255, 255);
  text("Introverted", x_Introverted, y1_Position);
  x_Introverted += (OutSpeed);
    //
  if (x_Introverted > 690) 
  { 
  x_Introverted = -20; OutSpeed = random(0, 3) + .5; x_Introverted += (OutSpeed);
  y1_Position = random(15, 225);
  }
  
  if (dist(x_Introverted,y1_Position,x_Authoritative,y2_Position) < 125)
  { 
  fill(random(255), random(255), random(255)); 
  // Outer aspect cordinates from y-axis. 
  x_Introverted = -20; OutSpeed = random(0, 3) + .5; x_Introverted += (OutSpeed);
  y1_Position = random(15, 225);
  }
  else { fill(0, 0, 0); }
}

void Authoritative()
{
  //
  fill(255, 255, 255);
  x_Authoritative -= (InSpeed);
  text("Authoritative", x_Authoritative, y2_Position);
  
  //
  if (x_Authoritative < -50) 
  { 
  x_Authoritative = 660; InSpeed = random(0, 3) + .5; x_Authoritative -= (InSpeed);
  y2_Position = random(15, 225);
  }
  
  //
  if (dist(x_Authoritative, y2_Position, x_Introverted, y1_Position) < 125)
  { 
  fill(random(255), random(255), random(255));
    
  // Inner aspect aspect cordinates from y-axis.
  x_Authoritative = 660; InSpeed = random(0, 3) + .5; x_Authoritative -= (InSpeed);
  y2_Position = random(15, 225);
  }
  else { fill(0, 0, 0); }

}

