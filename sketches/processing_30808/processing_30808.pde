
float midx, midy;
float prevx, prevy;
float bigradius;
float t;
PImage black;

void setup() {
  background(0,0,0);
  size(600,600,P2D); // have to use P2D due to "ghosting" effect
  prevx = 0;
  prevy = 0;
  midx = width/2;
  midy = height/2;
  bigradius = 150;
  t = 0;
  
  black = createImage(width, height, RGB);
  black.loadPixels();
  for (int i = 0; i < black.pixels.length; i++) {
    black.pixels[i] = color(0,0,0);
  }
  black.updatePixels();
  
  stroke(255,255,255);
}

void draw() {
  // fade to black
  
  if (!mousePressed) {
    tint(0, 5);
    image(black, 0, 0);
  }
  
  translate(mouseX, mouseY);
  rotate(t);
  
  // it feels weird when everything is clockwise. mix it up
  if (random(2) < 1)
    t *= -1;
  
  // find a spot to place the circle
  float x = (bigradius/4) * cos(PI*t) + random(-5, 5);
  float y = (bigradius/4) * sin(PI*t) + random(-5, 5);
  float smallradius = random(1, bigradius/8);
  fill(random(255), random(255), random(255));
  
  // flower effect
  strokeWeight(random(10));
  stroke(random(255), random(255), random(255));
  
  ellipse(0 + x, 0-(bigradius/4) + y, smallradius, smallradius);
  
  prevx = x;
  prevy = y;

  t += 0.1;
}

