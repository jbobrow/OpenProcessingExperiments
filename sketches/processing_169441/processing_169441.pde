
////sin wave for periodic pattern
//
//void setup()
//{
//  size(600, 600);
//}
//
//void draw()
//{
//  background(255);
//  stroke(0);
//  strokeWeight(5);
//
//  float t = 0;
//  float tDelta = radians(1);
//  float w = map (mouseX, 0, width, 0.1, 10);
////frequency
//  for (int x =0; x<width; x++) {
//    float y = height/2 - 100*sin(w * t);
//    point (x, y);
//    t += tDelta;
//  }
//}

//
//float angleInc = PI/28;
//float angle = 0;
//
//
//void setup()
//{
//  size(700, 100);
//}
//
//void draw()
//{
//  fill(255);
//  for (int offset = -10; offset<width + 10; offset+=20) {
//    for (int y =0; y <= height; y+=2) {
//      float x = offset + 20*sin(angle);
//      ellipse(x, y, 10, 10);
//      stroke(0);
//      angle += angleInc;
//    }
//    angle += PI;
//  }
//}

//size(300, 100);
//background(0);
//
//stroke(255, 60);
//for (int i=0; i<600; i++) {
//  float r = random(1, 10);
//  strokeWeight(r);
//  float offset = r*5;
//  line(i, 100, i+offset, 0);
//}

//size(600, 100);
//float v = 0.0;
//float inc = 0.1;
//noStroke();
//fill(0);
//noiseSeed(0);
//for (int i = 0; i < width; i = i+4) {
//  float n = noise(v) * 70.0;
//  rect(i, 10 + n, 3, 20);
//  v = v + inc;
//}

//
//void setup(){
//  size(100,100);
//  background(0);
//}
//
//float znoise =0;
//void draw()
//{
//  float xnoise =


