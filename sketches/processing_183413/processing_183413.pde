
//NO ESTÀ ACABADA DEL TOT, PERÒ HO ESTARÀ
//com a mínim la idea és aquesta



float pastiX;
float pastiY;
float velX;
float velY;
float mida = 10;

float obstacleX, obstacleY;

PImage nen;
void setup() {
  size(600, 400);
  pastiX = width/2;
  pastiY = height/2;
  velX = 5;
  velY = 5;

  nen = loadImage("nen.png");
}

void draw() {
  background(random(0, 255), random(0, 255), random(90, 160));

  //foto
  image(nen, 0, 0);
  fill(#fcff00);

  //pastilla
  stroke(1);
  ellipse(pastiX, pastiY, mida, mida);

  //DIBUJO OBSTACULOS
  //obstacleX = line
  //barrera1
  noStroke();

  line(430, 0, 430, 240);
  //barrera2
  line(430, 350, 430, 400);

  //velocitat
  pastiX = pastiX + velX;
  pastiY = pastiY + velY;

  //rebots
  if ((pastiX < 0)|| (pastiX > width)) {
    velX = -velX;
  }

  if ((pastiY < 0)||(pastiY>height)) {
    velY = -velY;
  }

  //prova rebots
  if ((pastiX >=430)||(pastiY>=240)||(pastiY<=350)) {
  }

  //boca
  if (pastiX > 430) {
    if (pastiY > 240 || pastiY < 350) {
      background(0);
      fill(255);
      textSize(50);
      text("DROGAS NO", 150, height/2);
    }
  }
}
//la boca es 430,240; 430,350



