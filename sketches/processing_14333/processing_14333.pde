
//Hans Nelson
//Exercise 7

float x1 = -160.0; //horizontal start position cloud #1
float x2 = -220.0; //horizontal start position cloud #2
float x3 = -180.0; //horizontal start position cloud #3
float y1 = random(10, 200); //vertical position cloud #1
float y2 = random(10, 150); //vertical position cloud #2
float y3 = random(10, 150); //vertical position cloud #3

int r = 192; //sky red value
int g = 241; //sky green value
int b = 255; //sky blue value

int hr = 107; //hill red value
int hg = 219; //hill green value
int hb = 60; //hill blue value

int wr = 190; //worm red value
int wg = 165; //worm green value
int wb = 125; //worm blue value

int numSegments = 24; //length of worm
float[] x =new float[numSegments]; //parameters for worm reach
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 7; //length of each segment
float targetX, targetY; //position of worm base

int numFrames = 60; //array set up for worm's blink
PImage[] images = new PImage[numFrames];
int frame = 0;

int sunFrames = 50; //array set up for sun blink
PImage[] suns = new PImage[sunFrames];
int frame2 = 0;

int rayFrames = 7; //array set up for sun rays
PImage[] rays = new PImage[rayFrames];
int frame3 = 0;

int moonFrames = 50; //array set up for moon blink
PImage[] moons = new PImage[moonFrames];
int frame4 = 0;

void setup(){ //SETUP BLOCK
  size(400, 400);
  noStroke();
  ellipseMode(RADIUS); //simplification for hill drawing
  smooth();
  noCursor();
  frameRate(40); //slows down framerate for blinking
  for(int i=0; i <=57; i++) { //iteration for worm eyes open
    images[i] = loadImage("wormface-01.png");
  }
  images[58] = loadImage("wormface-02.png"); //worm blink frames
  images[59] = loadImage("wormface-02.png");
  
  for(int i=0; i <=47; i++) { //iteration for sun eyes open
    suns[i] = loadImage("sf-001.png");
  }
  suns[48] = loadImage("sf-002.png"); //sun blink frames
  suns[49] = loadImage("sf-002.png");
  
  for(int i=0; i<rays.length-1; i++) { //iteration for sun ray frames
    String imageName = "ray-" + nf(i, 3) + ".png";
    rays[i] = loadImage(imageName);
  }
  for(int i=0; i <=47; i++) { //iteration for moon eyes open
    moons[i] = loadImage("m-000.png");
  }
  moons[48] = loadImage("m-001.png"); //moon blink frames
  moons[49] = loadImage("m-001.png");
  
  x[x.length-1] = width/2; //positions for worm base
  y[x.length-1] = 300;
}

void draw() { //MAIN DRAW BLOCK
  hill(); //draws background elements and clouds behind worm
  sunmoon(); //draws sun or moon depending on mouse click
  cloud1();
  cloud2();
  cloud3();
  float yy = constrain(mouseY, 0, 275); //worm can't go below dirt clod
  
  reachSegment(0, mouseX, yy); //code for worm reach I don't explicitly
  for(int i=1; i<numSegments; i++) { //understand a lot of this code, I
    reachSegment(i, targetX, targetY); //copied and pasted it and adjusted
  }                                  //it to conform to my worm
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);
  }
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], 66);
  }
  
  wormface(x[0], y[0]); //overlays worm face at head position
  PImage d1; //dirt clump
  d1 = loadImage("dirt2.png");
  imageMode(CORNER);  
  tint(255, 255);
  image(d1, 0, -10);
  
  if(mouseButton == LEFT) { //lengthy code for changing colors for night
    r = 140;
    g = 100;
    b = 160;
    hr = 68;
    hg = 110;
    hb = 50;
    wr = 168;
    wg = 140;
    wb = 95;
  }else { //returns to day on right click
    r = 192;
    g = 241;
    b = 255;
    hr = 107;
    hg = 219;
    hb = 60;
    wr = 190;
    wg = 165;
    wb = 125;
  }
  if (key == ' ') {
    save("worm.png");
  }
}

void hill() { //draws hill and sky
  noStroke();
  background(r, g, b);
  if(mouseButton == LEFT) {
    PImage stars;
    stars = loadImage("stars.png");
    image(stars, 0, 0);
  }else {
    background(r, g, b);
  }
  fill(hr, hg, hb);
  ellipse(width/2, height-25, width/2+30, width/3);
}

void cloud1() { //first cloud
  PImage cl;
  cl = loadImage("cloud1.png");
  tint(255, 175);
  image(cl, x1, y1, 125, 53);
  x1 = x1 + 0.3; //speed of cloud #1
  if (x1 > width) { //returns cloud to left side
    x1 = -160;
    y1 = random(10, 200);
  }
}

void cloud2() { //second cloud
  PImage cl;
  cl = loadImage("cloud1.png");
  tint(255, 230);
  imageMode(CORNER);
  image(cl, x2, y2, 220, 94);
  x2 = x2 + 0.5; //speed of cloud #2
  if (x2 > width) {
    x2 = -220;
    y2 = random(10, 150);
  }
}

void cloud3() { //third cloud
  PImage cl;
  cl = loadImage("cloud1.png");
  tint(255, 200);
  image(cl, x3, y3, 175, 75);
  x3 = x3 + 0.8; //speed of cloud #3
  if (x3 > width) {
    x3 = -180;
    y3 = random(10, 150);
  }
}

void sunmoon() { //function for sun or moon
  if(mouseButton == LEFT) { //on left click, changes to moon
    frame4++;
    if(frame4 == moonFrames) {
      frame4 = 0;
    }
    tint(255, 255);
    image(moons[frame4], 25, 30, 60, 60); //animates moon blink
  }
  else { //returns to sun on right click
  frame3++;
  if(frame3 == rayFrames-1) {
    frame3 = 0;
  }
  image(rays[frame3], 298, 20, 75, 75); //animates sun rays
  frame2++;
  if(frame2 == sunFrames) {
    frame2 = 0;
  }
  tint(255, 230);
  image(suns[frame2], 300, 20, 75, 75); //animates sun blink
  } 
}

void wormface(float headx, float heady) { //worm's face, params = position
  frame++;
  if (frame == numFrames) {
    frame = 0;
  } tint(255, 230);
  imageMode(CENTER); //makes positioning easier
  image(images[frame], headx, heady-5, 55, 55);
}

void positionSegment(int a, int b) { //functions for worm reach
  x[b] = x[a] + cos(angle[a]) * segLength; //again, I don't really understand
  y[b] = y[a] + sin(angle[a]) * segLength; // a lot of this code
}

void reachSegment(int i, float xin, float yin) { //function for reach
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) { //most important function
  strokeWeight(sw); //for the reach coding. This function controls the worm's
  pushMatrix(); //color, width, etc
  translate(x, y);
  rotate(a);
  stroke(wr, wg, wb); //worm's color, changes with day/night
  line(0, 0, segLength, 0); //worm itself!
  popMatrix();
}

  

