


      float t = 0.0;

void setup() {
  size(400,500);
  smooth();
  frameRate(60);
}


void draw() {

  background(0);
  float xoff = t;
  for (int i = 0; i < width; i++) {
    float y = noise(xoff)*height;
    xoff += 0.01;
    stroke(255,180);
    line(i,height,i,height-y);
    stroke(255,180);
    line(i,height,i,height-y+40);
  }
  t+= 0.01;

}          
                
