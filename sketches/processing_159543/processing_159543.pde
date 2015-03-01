
int[] starsX;
int[] starsY;
int[] scroll;
boolean hyperspeed = false;

void setup() {
  size(400, 600);
  starsX = new int[21];
  starsY = new int[21];
  scroll = new int[21];
  background(0);
  for (int i=0; i<21; i++) {
    starsX[i] = int(random(0, 401));
  }
  for (int i=0; i<21; i++) {
    starsY[i] = int(random(0, 601));
  }
  for (int i=0; i<21; i++) {
    scroll[i] = 0;
  }
}



void draw() {
  background(0);

  if (hyperspeed == false) {
    for (int i=0; i<21; i++) {
      scroll[i] = scroll[i] + 3;
    }
  } else {
    for (int i=0; i<21; i++) {
      scroll[i] = scroll[i] + 25;
    }
  }


  stars();


  if (mousePressed) {
    hyperspeed = true;
  }
}





void mouseReleased() {
  hyperspeed = false;
}



void keyReleased() {
  if (key == ' ') {
    for (int i=0; i<21; i++) {
      starsX[i] = int(random(0, 401));
    }
    for (int i=0; i<21; i++) {
      starsY[i] = int(random(0, 601));
    }
  }
} 



void stars() {

  for (int i=0; i<21; i++) { 
    if (starsY[i]+scroll[i] > height) {
      starsY[i] = 0;
      scroll[i] = 0;
      
    }
  }
  stroke(255);
  fill(255);
  ellipse(starsX[1], starsY[1]+scroll[1], 1, 1);
  ellipse(starsX[2], starsY[2]+scroll[2], 1, 1);
  ellipse(starsX[3], starsY[3]+scroll[3], 1, 1);
  ellipse(starsX[4], starsY[4]+scroll[4], 1, 1);
  ellipse(starsX[5], starsY[5]+scroll[5], 1, 1);
  ellipse(starsX[6], starsY[6]+scroll[6], 1, 1);
  ellipse(starsX[7], starsY[7]+scroll[7], 1, 1);
  ellipse(starsX[8], starsY[8]+scroll[8], 1, 1);
  ellipse(starsX[9], starsY[9]+scroll[9], 1, 1);
  ellipse(starsX[10], starsY[10]+scroll[10], 1, 1);
  ellipse(starsX[11], starsY[11]+scroll[11], 1, 1);
  ellipse(starsX[12], starsY[12]+scroll[12], 1, 1); 
  ellipse(starsX[13], starsY[13]+scroll[13], 1, 1);
  ellipse(starsX[14], starsY[14]+scroll[14], 1, 1);
  ellipse(starsX[15], starsY[15]+scroll[15], 1, 1);
  ellipse(starsX[16], starsY[16]+scroll[16], 1, 1);
  ellipse(starsX[17], starsY[17]+scroll[17], 1, 1);
  ellipse(starsX[18], starsY[18]+scroll[18], 1, 1);
  ellipse(starsX[19], starsY[19]+scroll[19], 1, 1);
  ellipse(starsX[20], starsY[20]+scroll[20], 1, 1);
}



