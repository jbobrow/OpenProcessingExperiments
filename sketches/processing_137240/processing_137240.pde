
//Model of the sun, earth and moon
//Click on either the sun, earth or moon.

//Globals
PImage sun;
PImage earth;
PImage moon;
float counter = 0;

void setup() {
  size(1280, 720);
  sun = loadImage("sun.jpg");
  earth = loadImage("earth.jpg");
  moon = loadImage("moon.jpg");
  background(0);
}

void draw() {
  //random field of stars
  while(counter < 1000) {
    float x = random(width);
    float y = random(height);
    float d = random(2, 6);
    ellipse(x, y, d, d);
    counter++;
  }
  
  //Sun, moon and earth
  image(sun, 100, 200, width/5, height/3);
  image(earth, 100 + width/3, 200, width/5, height/3);
  image(moon, 100 + 2*width/3, 200, width/5, height/3);
  
}

void mouseReleased() {
  //Sun selected
  if (mouseX < width/3) {
    background(0);
    image(sun, width/10, 10, 8*width/10, height-10);
  }

  //Earth selected
  if (mouseX > width/3 && mouseX < width*2/3) {
    background(0);
    image(earth, width/10, 10, 8*width/10, height-10);
  }

  //Moon selected
  if (mouseX > 2*width/3) {
    background(0);
    image(moon, width/10, 10, 8*width/10, height-10);
  }
}


