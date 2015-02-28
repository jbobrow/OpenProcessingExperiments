
/*
  henderson[###]

  Simple experimenting with sineWaves to set the fill color of
  a grid of rect()
  
  Minor adjustments of the i and j increments, rect size etc
  vary the patterns greatly.
*/

float time=0;

void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  background(0);
noStroke();
  for (int i=0; i<width; i+=3) {
    for (int j=0; j<height; j+=3) {
      
      fill(sineWave(127, i*j, i*j+time)+127);
      rect(i, j, 2, 2);
    }
  }
  time+=0.1;
}

float sineWave(float a, float t, float phase) {
  float sw = a*(sin(radians(t)+phase));
  return sw;
}
/*
void keyPressed() {
  if (key == ' ') {
    save("image-r"+int(random(0, 100))+frameCount+".jpg");
    println("image-"+frameCount+".jpg saved!");
  }
}
*/

