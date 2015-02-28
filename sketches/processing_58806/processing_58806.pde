
//candice ferreira. Problem set 1 Question4
// loops

void setup() {
  size(400, 400);
  background(255);
}

void draw(){
  
  float h = height;
  while (h > 1) {
    line(0,h,width,h);
    h -= height/8;
  }
    float w = width;
  while (w > 1) {
    line(w,0,w,height);
    w -= width/8;
  }
}

