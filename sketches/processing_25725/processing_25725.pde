
void setup() {
  size(800, 600);
  smooth();
  background(255,255,255);


  for(int i = 0; i < 41; i++) {
    for(int j = 0; j < 31; j++) {
      noStroke();
      ellipse(i * 20, j* 20,18,18);
      fill(random(97,255),random(0,0),random(0,255),random(20,50));
    }
  }
  for(int i = 0; i < 41; i++) {
    for(int j = 0; j < 31; j++) {
      noStroke();
      ellipse(i * 20, j* 20,23,23);
      fill(random(97,255),random(0,0),random(0,255),random(20,50));
    }
  }
  for(int i = 0; i < 41; i++) {
    for(int j = 0; j < 31; j++) {
      noStroke();
      ellipse(i * 20, j* 20,28,28);
      fill(random(97,255),random(0,0),random(0,255),random(20,50));
    }
  }
  for(int i = 0; i < 41; i++) {
    for(int j = 0; j < 31; j++) {
      noStroke();
      ellipse(i * 20, j* 20,33,33);
      fill(random(97,255),random(0,0),random(0,255),random(20,50));
    }
  }
  for(int i = 0; i < 41; i++) {
    for(int j = 0; j < 31; j++) {
      noStroke();
      ellipse(i * 20, j* 20,50,50);
      fill(random(97,255),random(0,0),random(0,255),random(20,50));
    }
  }
}

void draw() {
}

void keyPressed() {
  if(key == 'i') {
    filter(INVERT);
  }
  if(key == 'l') {
    filter(BLUR, 1);
  }
  if(key=='e') {
    filter(ERODE);
  }
  if(key=='d') {
    filter(DILATE);
  }
  if(key=='p') {
    filter(POSTERIZE,12);
  }
  if(key=='o') {
    filter(OPAQUE);
  }
}


