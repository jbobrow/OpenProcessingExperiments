
//import ddf.minim.*;
//Minim minim;
//AudioSnippet caw;

int[] birdX = new int[60];
int[] birdY = new int[60];

int h;
int m;
int s;

void setup() {
  size(1000, 500);
  smooth();
  noStroke();
  
  int counter = 0;
  for(int col = 0; col < 12; col++) {
    for(int row = 0; row < 5; row++) {
      birdX[counter] = (width/24) + (width/12)*col;
      birdY[counter] = (height/2)+((height/2)/5)*row;
      counter++;
    }
  }
  
  //minim = new Minim(this);
  //caw = minim.loadSnippet("http://www.animal-sounds.org/Air/Crow%20animals010.wav");
}

void draw() {
  h = hour();
  m = minute();
  s = second();
  drawSky();
  drawSun();
  drawGround();  
  drawBirds();
  if (s%2 == 0) {
    //caw.play();
  }
}

void drawSky() {
  if (h < 6 || h > 18) {
    background(31, 66, 100);
  }
  else 
  background(157, 199, 255);
}

void drawSun() {
  noStroke();
  float x;
  float y;
  if (h < 6 || h > 18) {
    fill(214, 251, 255, 120);
    x = map(h, 18, 24, 0, width);
    y = map(h, 1, 24, height/2, height/4);
  }
  else {
    fill(255, 226, 59, 120);
    x = map(h, 6, 18, 0, width);
    y = map(h, 6, 18, height/2, height/4);
  }
  ellipse(x, y, 120, 120);
  ellipse(x, y, 100, 100);
  ellipse(x, y, 80, 80);
}

void drawGround() {
  noStroke();
  if (h < 6 || h > 18) {
    fill(15, 88, 36);
  }
  else fill(78, 185, 54);
  rect(0, height/2, width, height/2);
}

void drawBirds() {
  for(int i = 0; i < m; i++) {
    int rndm = 0;
    if(s%2 == 1) {
      rndm = int(random(-3, 3));
    }
    drawBird(birdX[i]+rndm, birdY[i]+rndm);
  } 
}

void drawBird(int x, int y) {
  fill(0);
  //body and legs
  ellipse(x, y, 40, 20);
  strokeWeight(3);
  stroke(0);
  line(x, y, x-10, y+20);
  line(x, y, x+10, y+20);
  //head 
  ellipse(x+20, y-5, 15, 15);
  //beak
  if(s%2 == 0){
    line(x+20, y-5, x+33, y-6);
    line(x+20, y-5, x+33, y-4);
  }
  else {
    line(x+20, y-5, x+33, y-8);
    line(x+20, y-5, x+33, y-2);
  }  
  //eye
  fill(255);
  ellipse(x+20, y-5, 8, 8);
}

void stop() {
  caw.close();
  minim.stop();
  super.stop();
}
