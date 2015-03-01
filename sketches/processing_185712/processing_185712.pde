
PImage spritePic;
float xSprite;
float ySprite;

PImage prizePic;
float xPrize;
float yPrize;

float xPrize2;
float yPrize2;

PFont font;
float score;

float xBad;
float yBad;

float xPrize3;
float yPrize3;
PImage prizePic3;

void setup () {
  size (400, 800);
  background(255, 255, 255);
  spritePic = loadImage("NinjaFX.png");
  xSprite = 0;
  ySprite = 0;  
  
  prizePic = loadImage ("ShurikenFX2.png");
  xPrize = random(20, width-20);
  yPrize = height;
  
  font = loadFont("DejaVuSans-48.vlw");
  textFont(font, 32);
  score = 0;
 
  yBad = height;
  xBad = random(20., width-20);
  
  prizePic3 = loadImage ("ShurikenFX.png");
}

void draw () {
   background(255, 255, 255);
  drawSprite();
  moveSprite();
  drawPrize();
  movePrize();
  collision();
  drawScore();
  
  movePrize2();
  drawPrize2();
  
  drawBad();
  moveBad();
  collisionBad();
  
  drawPrize3();
  movePrize3();
}

void drawSprite () {
  image(spritePic, xSprite, ySprite, 50, 50);
}

void moveSprite () {
  xSprite = xSprite+1;
  if (xSprite > width)
  {
    xSprite = 0;
  }
ySprite = mouseY;
}

void drawPrize () {
  image(prizePic, xPrize, yPrize, 70, 70); //size of Prize
}

void movePrize () {
  yPrize = yPrize -1; //moves prize up
  if(yPrize < -2)
  {
    yPrize = height;
    xPrize = random (20, width-20);
  }
}
  
void collision () {
    if( abs(xSprite - xPrize) <40
  &&
  abs(ySprite - yPrize) <40)
  {
    yPrize = height;
    xPrize = random(20, width-20);
    score = score +1;
  }

   if( abs(xSprite - xPrize2) <40
  &&
  abs(ySprite - yPrize2) <40)
  {
    yPrize2 = height;
    xPrize2 = random(20, width-20);
    score = score +1;
  }
  
   if( abs(xSprite - xPrize3) <40
  &&
  abs(ySprite - yPrize3) <40)
  {
    yPrize3 = height;
    xPrize3 = random(20, width-20);
    score = score +5;
  }
}

void drawScore () {
  fill(10, 20, 30);
  text("Score " + score, 10, 30);
}

void drawPrize2 () {
  image(prizePic, xPrize2, yPrize2, 70, 70); //size of Prize
}

void movePrize2 () {
  yPrize2 = yPrize2 -5; //moves prize up
  if(yPrize2 < -5)
  {
    yPrize2 = height;
    xPrize2 = random (20, width-20);
  }
}

void drawBad () {
  fill(0, 0, 0);
  ellipse(xBad, yBad, 14, 14);
}

void moveBad () {
  yBad = yBad -2;
  if(yBad < 0)
  {
    yBad = height;
    xBad = random(20, width-20);
  }
}

void collisionBad () {
  if(abs (xSprite - xBad) <40
  &&
  abs (ySprite - yBad) <40)
  {
    yBad = height;
    xBad = random(20, width-20);
    score = score -1;
  }
}


void drawPrize3 () {
  image(prizePic3, xPrize3, yPrize3, 50, 50); //size of Prize
}

void movePrize3 () {
  yPrize3 = yPrize3 -5; //moves prize up -5
  if(yPrize3  <-2)
  {
    yPrize3 = height;
    xPrize3 = random (20, width-20);
  }
}


