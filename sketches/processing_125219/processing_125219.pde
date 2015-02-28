
//Libraries
import ddf.minim.*;

/* @pjs preload="spirals.png"; */
/* @pjs preload="spiralsM.png"; */


// PImage variable type
PImage spirals;
PImage spiralsM;

// Global variables
color[] palette = 
{#B97BCE,#C45486,#8377B7,#668BCE,#80BCC4};
float rndPalette = random(0,5);
int toggleImg = 0;

//Sound variables
Minim minim;
AudioPlayer TicToc;
AudioPlayer Chords1;
AudioPlayer Chords2;
AudioPlayer Chords3;
AudioPlayer Chords4;


// CLOCK

// Variables
int cx,cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  // Canvas
  size(850,700);
  spirals = loadImage("spirals.png");
  spiralsM = loadImage("spiralsM.png");
  
  //Load audio files
  minim = new Minim (this);
  TicToc = minim.loadFile("TicToc.mp3");
  TicToc.loop(); //Repeat ticking track
  
  Chords1 = minim.loadFile("Chords1.mp3");
  Chords2 = minim.loadFile("Chords2.mp3");
  Chords3 = minim.loadFile("Chords3.mp3");
  Chords4 = minim.loadFile("Chords4.mp3");
  
  // Clock elements
  int radius = min(width, height) / 3;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {

  background(palette[(int)rndPalette]);
  if (toggleImg == 0) {
    image(spirals,0,0);
  }
  else {
    image(spiralsM,0,0);
  }
  
  // Clock background 
  fill(#D8C1FF);
  noStroke();
  ellipse(cy,cy,clockDiameter,clockDiameter);
  strokeWeight(3);
  stroke(#CB1052);
  ellipse(cx,cy,clockDiameter/2,clockDiameter/2);
  stroke(255,0,0,53);
  strokeWeight(260);
  point(545,300);
  stroke(15,0,0,79);
  strokeWeight(310);
  point(560,430);
  
  
  // Angles for sin() and cos() start at 3 o'clock;
  //subtract HALF_PI to make them start at the top
  float s = map(second(),0,60,0,TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(),0,60),0,60,0,TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(),0,60),0,24,0,TWO_PI * 2) - HALF_PI;
  
  // Hands of the clock
  stroke(0);
  strokeWeight(0.5);
  line(cx,cy,cx + cos(s) * secondsRadius,cy + sin(s) * secondsRadius);
  stroke(180);
  strokeWeight(3);
  line(cx,cy,cx + cos(m) * minutesRadius,cy + sin(m) * minutesRadius);
  stroke(255);
  strokeWeight(7);
  line(cx,cy,cx + cos(h) * hoursRadius,cy + sin(h) * hoursRadius);
  
  // Minute ticks
  
  stroke(#32008B);
  strokeWeight(3);
  beginShape(POINTS);

  for (int a = 0; a < 360; a+=6){
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x,y);
  }
  endShape();
  
  //Repeat minute ticks to vary colour and size
  stroke(#32968B);
  strokeWeight(7);
  beginShape(POINTS);
  
   for (int a = 0; a < 360; a+=30){
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x,y);
  } 
  endShape();
  
  
  stroke(#36768B);
  strokeWeight(10);
  beginShape(POINTS);
  
   for (int a = 0; a < 360; a+=60){
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x,y);
  }
  endShape();
  
}

// Mouse input (changes background)
void mouseClicked() {
  
  if (toggleImg == 0) {
    toggleImg = 1;
  }
  else {
    toggleImg = 0;
  }
  rndPalette = (int)random(0,5);
}

void mouseDragged() {
  mouseClicked();
}

void keyPressed() {
 if (key == 'a' || key == 'A') Chords1.play(1);
 if (key == 'b' || key == 'B') Chords2.play(1);
 if (key == 'c' || key == 'C') Chords3.play(1);
 if (key == 'd' || key == 'D') Chords4.play(1);
}

