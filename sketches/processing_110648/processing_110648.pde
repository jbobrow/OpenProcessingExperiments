
float x;
float y;
float x_speed, y_speed;
float radius;
float gravity;
color c1;
Transformer transformer;

void setup() {
  size (600, 600);
  smooth();
  y_speed = random (-6, 6);
  radius = 50;
  gravity = 0.1;
  x=(width/2);
  y = (25);
  c1 = color(random(255), random(255), random(255));
  transformer = new Transformer();
}

void draw() {
  background (0);
  noStroke();

  y= y + y_speed; // get that speed/direction going
  y_speed = y_speed + gravity; //get that gravity going





  if (mousePressed && (mouseButton == LEFT)) { //smap ball to mouse 
    x=mouseX;
    y=mouseY;
    y_speed = 1; // give ball downwards direction when snapped to mouse
    if (mouseY > height-25) { //boundaries for mouse -- cant take ball out of area
      y=(height-25);
    }
    if (mouseY < 25) {
      y=25;
    }
    if (mouseX <25) {
      x= 25;
    }
    if (mouseX> width-25) {
      x = width-25;
    }
  }
 if (y> height-25) {  //bounce if ball hits top -- BOUNDARY
    y_speed *=-.90; //dampen the bounce -- each time it slows down a tad
    if (y + y_speed > height-25) {
      y = 574;
    }
    c1 = color(random(255), random(255), random(255));  
    if (y_speed<.05 && y_speed>-.05) { // we want the ball to stop eventually...
      y_speed=0;
      c1= color(255);
    }
  }
  if (y< 0) { //bounce if ball hits bottom -- BOUNDARY
    y_speed *=-1;
  }

  fill (c1); //make the ball. Quite pointless without the ball, in fact. 
  ellipse (x, y, radius, radius);

  transformer.display(); //loads the Transformer class (rectangle), as seen directly below/other tab.
}

class Transformer {
   PFont font; // load font as font variable
  
  Transformer() {
    font = loadFont ("Arial.vlw"); //I had previously clicked Tools/Create Font, created Arial
  }
    
    
  void display() {
    fill(0, 0, 255); //rectangle at bottom
    rectMode(CORNERS);
    rect (600, height, 0, height-50);
    
    fill (c1); //make the words white!
     textFont (font, 30); // textfont (name of font, size of font)
    text ("Transformer!", width/2-70, height-20); //text ("string", locationX, locationY) 
    
    
  }
}


