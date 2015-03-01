
int x, y, velX, velY, dirX, dirY, radio, score;
boolean inicio=true;
PFont font;
int margen=400;
void setup() {
  size(400, 400);
  font = loadFont("Chalkduster-48.vlw");
  textFont(font, 32);

  frameRate(24);
  x=int(random(400-radio))+radio/2;
  y=score=0;
  velX=1;
  velY=5;
  dirX=1;
  dirY=1;
  radio=20;
}
void draw() {
  background(0);

  if (inicio==false) {
    rect(0, 0, 400, 5);
  };

  rect(0, 395, 185, 400);
  rect(215, 395, 400, 400);

  display();
  movement();
  control();
}

void display() {

  fill(255);
  ellipse(x, y, radio, radio);
  text(score, 320, 50);
}

void control() {
  if (mouseX<width/2) {
    dirX=-4;
  }
  if (mouseX>width/2) {
    dirX=4;
  }
}

void movement() {
  if (x<radio/2) {
    dirX*=-4;
    x=radio;
  }

  if (x>width-radio/2) {
    dirX*=-4;
    x=width-radio;
  }

  if (y>margen-radio/2) {

    if (x>185+radio/2 && x<215-radio/2) {
      y=0-radio/2;
      x=int(random(400));
      inicio=true;
      score++;
    } else {
      dirY*=-1;
      inicio=false;
    }
  }

  if (y<radio/2) {
    if (inicio!=true) {
      y=radio/2;
      dirY*=-1;
    }
  }

  y+=velY*dirY;
  x+=velX*dirX;
}


