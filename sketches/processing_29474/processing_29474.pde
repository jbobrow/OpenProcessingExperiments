

float distanceRotate;
 
void setup(){
  frameRate(5);
  size(500,500);
  smooth();

}

void renderS(){
colorMode(HSB, 100,100,100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j,100);
    point(i*1.2, j*1.2);
  }
}
}
void renderT(){
colorMode(HSB, 100,100,100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j,100);
    point(i*1.8, j*1.8);
  }
}
}

void renderR(){
colorMode(HSB, 100,100,100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j,100);
    point(i*2.4, j*2.4);
  }
}
}

void renderM(){
colorMode(HSB, 100,100,100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j,100);
    point(i*3, j*3);
  }
}
}
 void renderN(){
colorMode(HSB, 100,100,100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j,100);
    point(i*3.2, j*3.2);
  }
}
}
 
void draw() {
  distanceRotate = dist(0,0,0,0)+1 + distanceRotate;
translate(250,250);
  rotate(distanceRotate);
 renderS();
renderT();
renderR();
renderM();
renderN();
}
 




