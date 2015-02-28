
Cloud c[] = new Cloud[10];
int d = 50;

color clight, cdark; 
float time = 0; // 0 ~ 2*PI (multiples)
int weather = 0; // 0 ~ 9

Sun sun = new Sun();
Moon moon = new Moon();
int starc = 500;
Star[] stars;

void setup() {

  size(512, 160);
  frameRate(8);
  smooth();

  // populate cloud array
  float distance = 0;
  for (int i = 0; i < c.length; i++) {
    distance += random(d*5);
    c[i] = new Cloud(distance, random(height*0.0+d, height*0.6), random(1, 3));
  }

  // stars are center
  stars = new Star[starc];
  for (int i = 0; i < stars.length; i++)
    stars[i] = new Star();
}

void draw() {

  //time-keeping
  cycle();

  //paint the sky
  sky();
  
  //change weather
  changeWeather();

  // draw and refresh clouds
  for (int i = 0; i < c.length; i++) {
    c[i].draw();
    //NOTE: maybe I should methodify the following?
    if (c[i].dead)
      c[i] = new Cloud(width, random(height*0.0+d, height*0.6), random(1, 3));
  }

  // give me RED
  redden();
  
}

void cycle() {
  time+=0.005;
  time%=24;
  clight = color(255 - abs(255*sin(time)));
  cdark = color(abs(255*sin(time)));
}

void redden() {
  loadPixels();
  for (int i = 0; i < width*height; i++)
    pixels[i] = color(red(pixels[i]), 0, 0);
  updatePixels();
}


