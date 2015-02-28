
PImage[] img = new PImage[20]; 

float x;
float angle = 0;
float r = 100;
float diff = 1;
float t = 255;

void setup() {
  size(1000, 320); 
  background(255);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".jpg");
  }
}
void draw() {

  tint(255, 1);

  x = r*cos(angle)*1.0;


  for (int i = 0; i < 20; i++) {
    image(img[i], i*50, x*random(0, 10), 50, 50);
  }

  angle = angle + 0.5;
  r = r - diff;

  if ( r == 0 || r == 100) {
    diff =  diff * -0.1;
  }
}



