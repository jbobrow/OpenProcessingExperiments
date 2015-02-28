
void setup(){
  size(500, 500);
  background(50);
  smooth();
}

void draw(){
  background(50);
    for (float y = 50; y <= height-50; y= y+50) {
      for (float x = 50; x <= width-50; x = x +50) {
        strokeWeight(random(2,100));
        stroke(random(0,255),random(100,255),50,200);
        point(x, y);
      }
    }
}

