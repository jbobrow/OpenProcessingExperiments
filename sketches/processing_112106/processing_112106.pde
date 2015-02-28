
float x1=random(0, width/2), y1=random(0, (height-50)/2);
float x2=random(0, width/2), y2=random(100, height-50);
float x3=random(200, width), y3=random(100, height);
float x4=random(200, width), y4=random(200, height);

float w1=random(0, width), v1=random(0, height);
float w2=random(0, width), v2=random(0, height);

float x1Speed = random(-3, 3), y1Speed = random(-3, 3);
float x2Speed = random(-3, 3), y2Speed = random(-3, 3);
float x3Speed = random(-3, 3), y3Speed = random(-3, 3);
float x4Speed = random(-3, 3), y4Speed = random(-3, 3);

float w1Speed = random(-3, 3), v1Speed = random(-3, 3);
float w2Speed = random(-3, 3), v2Speed = random(-3, 3);

float score=0;

PImage xl;
PImage sj;
PImage t;
PFont yummyfont;
PFont scorefont;

void setup() {

  size(500, 500);
  noCursor();  
  xl = loadImage("xlb.png");
  sj = loadImage("sj.png");
  t = loadImage("ti.png");
  yummyfont = createFont("PWYummyDonuts.ttf",50);
  scorefont = createFont("indiestarbb_reg.ttf",40);
}

void draw() {

  background(0);
  image(xl, x1, y1, 40, 40);
  x1 = x1 + x1Speed;
  y1 = y1 + y1Speed;
  image(xl, x2, y2, 40, 40);
  x2 = x2 + x2Speed;
  y2 = y2 + y2Speed;
  image(xl, x3, y3, 40, 40);
  x3 = x3 + x3Speed;
  y3 = y3 + y3Speed;
  image(xl, x4, y4, 40, 40);
  x4 = x4 + x4Speed;
  y4 = y4 + y4Speed;

  image(sj, w1, v1, 40, 40);
  w1 = w1 + w1Speed;
  v1 = v1 + v1Speed;
  image(sj, w2, v2, 40, 40);
  w2 = w2 + w2Speed;
  v2 = v2 + v2Speed;

  image(t, mouseX, height-110, 80, 60);
  //initial setting



  if (x1 < 0 || x1 > width-40) {
    x1Speed = -x1Speed;
  }
  if (y1 < 0) {
    y1Speed = -y1Speed;
  }
  if (x2 < 0 || x2 > width-40) {
    x2Speed = -x2Speed;
  }
  if (y2 < 0) {
    y2Speed = -y2Speed;
  }
  if (x3 < 0 || x3 > width-40) {
    x3Speed = -x3Speed;
  }
  if (y3 < 0) {
    y3Speed = -y3Speed;
  }
  if (x4 < 0 || x4 > width-40) {
    x4Speed = -x4Speed;
  }
  if (y4 < 0) {
    y4Speed = -y4Speed;
  }

  if (w1 < 0 || w1 > width-40) {
    w1Speed = -w1Speed;
  }
  if (v1 < 0 || v1> height-40) {
    v1Speed = -v1Speed;
  }
  if (w2 < 0 || w2 > width-40) {
    w2Speed = -w2Speed;
  }
  if (v2 < 0 || v2>height-40) {
    v2Speed = -v2Speed;
  }
  //bounce

  if (x1 > mouseX-40 && x1 < mouseX+80 && y1 > height-130 && y1 < height-130+y1Speed-0.1) {
    x1Speed = -x1Speed * random(1, 1.05);
    y1Speed = -y1Speed * random(1, 1.05);
    score++;
  }
  if (x2 > mouseX-40 && x2 < mouseX+80 && y2 > height-130 && y2 < height-130+y2Speed-0.1) {
    x2Speed = -x2Speed * random(1, 1.05);
    y2Speed = -y2Speed * random(1, 1.05);
    score++;
  }
  if (x3 > mouseX-40 && x3 < mouseX+80 && y3 > height-130 && y3 < height-130+y3Speed-0.1) {
    x3Speed = -x3Speed * random(1, 1.05);
    y3Speed = -y3Speed * random(1, 1.05);
    score++;
  }
  if (x4 > mouseX-40 && x4 < mouseX+80 && y4 > height-130 && y4 < height-130+y4Speed-0.1) {
    x4Speed = -x4Speed * random(1, 1.05);
    y4Speed = -y4Speed * random(1, 1.05);
    score++;
  }

  if (w1 > mouseX-40 && w1 < mouseX+80 && v1 > height-130 && v1 < height-130+v1Speed-0.1) {
    w1Speed = -w1Speed * random(1, 1.1);
    v1Speed = -v1Speed * random(1, 1.1);
    score = score - 2;
    fill(100, 0, 0);
    rect(0, 0, width, height);
  }
  if (w2 > mouseX-40 && w2 < mouseX+80 && v2 > height-130 && v2 < height-130+v2Speed-0.1) {
    w2Speed = -w2Speed * random(1, 1.1);
    v2Speed = -v2Speed * random(1, 1.1);
    score = score - 2;
    fill(100, 0, 0);
    rect(0, 0, width, height);
  }
  //collide

  for (int i=0;i<score;i++) {
    image(xl, 70+40*i, 20, 20, 20);
  }
  fill(255);
  textFont(scorefont, 15);
  textSize(15);
  text("score:", 0, 20, 70, 20);
  //score

  if (score==4) {
    fill(200, 100, 60);
    textFont(yummyfont, 70);
    text("yummy", 120, 250);
    x1 = x2 = x3 = x4 = w1 = w2 = width; 
    y1 = y2 = y3 = y4 = v1 = v2 = height;
  }
  if (y1 > height || y2 > height || y3 > height || y4 >height ) {
    textFont(yummyfont, 50);
    fill(255, 0, 0);
    text("hungry to die", 42, 250);
    x1 = x2 = x3 = x4 = w1 = w2 = width; 
    y1 = y2 = y3 = y4 = v1 = v2 = height;
  }
  //result
}


