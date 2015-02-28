
int scale = 2; // 1 for lower resolution, 4 for best one

void setup() {
  size(500, 500);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  
  for (float i = 0 ; i < 100 ; i += 4/scale) {
    for (float j = 0 ; j < 100 ; j += 4/scale) {
 
      float x = ((cos(TWO_PI*i*.01)*.05+.5)*frameCount)%100;
      float y = ((cos(TWO_PI*j*.01)*.05+.5)*frameCount)%100;

      float f = 1+abs((x*5-width/2)*(y*5-height/2));

      f = frameCount/f*255;

      f = (cos(f)*.5+.5)*255;

      fill(255-f);

      rect(i*5, j*5, 20/scale, 20/scale);
    }
  }
}


