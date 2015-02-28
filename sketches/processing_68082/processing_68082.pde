
PImage heart;

int x = (int)random(550);
int y = (int)random(470);
color c;
color heart_c = 359;

float [] r = {
  20*0.6, 35*0.6, 50*0.6, 60*0.6, 80*0.6
};

float e_w = 20*0.6;
float e_h = 80*0.6;

int num = (int)random(0, 2.9999999);

void setup() {
  size(550, 470);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  heart = loadImage("heart.png"); 
  imageMode(CENTER);

  image(heart, width/2, height/2);

  noStroke();
}


void draw() {

  c = get(x, y);

  //background(360);


  if (c == -65794) {
    switch(num) {
    case 0:
      peacock(x, y);
      num = (int)random(0, 2.9999999);
      break;
    case 1:
      rose(x, y);
      num = (int)random(0, 2.9999999);
      break;
    case 2:
      flower(x, y);
      num = (int)random(0, 2.9999999);
      break;
    }
  }



  x = (int)random(550);
  y = (int)random(470);


  println(c);
}

void peacock(float x, float y) {
  for (int i = 6;i>=3;i-=2) {
    noStroke();
    fill(random(360), 50, 100);
    drop(x, y, i);
    fill(360);
    drop(x, y, i-1);
  }
}

void drop(float x, float y, int s) {
  for (int j = 0 ; j <= 6; j++) {
    pushMatrix();
    translate(x, y);
    rotate(radians((360/ 6) * j));

    for (int i = 10; i > 0;i--) {
      ellipse(0, (i*1.2*s)*0.3, (s*i+3)*0.3, (s*i+3)*0.3);
    }
    popMatrix();
  }
}

void rose(float x, float y) {
  pushMatrix();

  translate(x, y);
  stroke(360);
  strokeWeight(5*0.6);
  fill(random(290, 360), 80, random(77, 100));
  ellipse(0, 0, r[4], r[4]);
  ellipse(-10, 10, r[3], r[3]);
  ellipse(0, 0, r[2], r[2]);
  ellipse(10, 0, r[1], r[1]);
  ellipse(0, 0, r[0], r[0]);

  popMatrix();
}

void flower(float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(random(360), 50, 100);
  ellipse(0, 0, e_w, e_h);
  ellipse(0, 0, e_h, e_w);
  rotate(radians(45));
  ellipse(0, 0, e_w, e_h);
  ellipse(0, 0, e_h, e_w);
  popMatrix();
}


void mousePressed() {
  x = mouseX;
  y = mouseY;
}


