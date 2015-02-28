


// déclaration des variables 

PImage a; 
PImage b;
PImage c;
float d;
float e;
float f;
int amplitude;

void setup() {

  background(255);
  size(604, 340);

  a = loadImage("canard1.jpg");
  b = loadImage("canard2.jpg");
  c = loadImage("canard3.jpg");
}

void draw() {



  amplitude = 128;
  d = 128+(amplitude*(sin((millis()*0.001) % TWO_PI)));
  e = 128+(amplitude*(sin((millis()*0.001 + TWO_PI/3) % TWO_PI)));
  f = 128+(amplitude*(sin((millis()*0.001 + TWO_PI/3 * 2) % TWO_PI)));




  image(a, 0, 0);
  tint(255, d);
  filter(BLUR, 6);


  image(b, 0, 0);
  tint(255, e);
  filter(BLUR, 6);


  image(c, 0, 0);
  tint(255, f);
  filter(BLUR, 6);
}


