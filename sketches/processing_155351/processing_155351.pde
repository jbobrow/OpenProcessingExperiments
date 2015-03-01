
int posX;
int posY;
int vitX, vitY;
float taille;
float timer, tMax;
boolean play;

void setup() {
  size(800, 800);
  background(138, 165, 135);
  rectMode(CENTER);
  posX = width/2;
  posY = height/2;
  randomSize();
  timer = 0;
  tMax = random(10,60);
  play = true;
}

void draw() {
  timer = timer+1;
  if(timer>tMax){
    randomSize();
    timer = 0;
    tMax = random(10,60);
  }
  
  posX = posX + vitX;// update posX
  if (posX>width) {
    posX = width;
    randomSize();
  }
  
  if (posX<0) {
    posX = 0;
    randomSize();
  }

  posY = posY + vitY;
  if (posY>height) {
    posY = height;
    randomSize();
  }
  
  if (posY<0) {
    posY = 0;
    randomSize();
  }

  rect(posX, posY, taille, taille);
  rect(width-posX, posY, taille, taille);
  rect(posX, height-posY, taille, taille);
  rect(width-posX, height-posY, taille, taille);
}

void randomSize(){
  fill(random(255),random(255),random(255));
  vitX = round(random(-10,10));
  vitY = round(random(-10,10));
  taille = random(10,80);
}

void mousePressed(){
  background(138, 165, 135);
  posX = width/2;
  posY = height/2;
  randomSize();
}


