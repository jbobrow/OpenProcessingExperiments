
PImage img1;
PImage zangief;
PImage img2;
PImage hDoken;
PImage zanWiggle;

void setup() {
  size(800, 800);
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
  img1 = loadImage("Zangief.gif");
  img2 = loadImage("RyuSFA3.gif");
  frameRate(10);
}
 
 
int numObjects = 10;
int centerX = 400;
int centerY = 400;
int distance = 250;
int zanSpinCount = 0;
int dokenCount = 0;
int zanWiggleCount = 1;
int zanWigIncr = 1;
int bgShade = 60;
int bgIncr = 10;

void draw() {
  if(bgShade == 50 || bgShade == 150) bgIncr *= -1;
  bgShade += bgIncr;
  background(bgShade);
  
  if(zanWiggleCount % 2 == 0) zanWigIncr *= -1;
  zanWiggleCount += zanWigIncr;

  float angleObject = TWO_PI/numObjects;
  zanSpinCount = (zanSpinCount + 1) % 6;
  dokenCount = (dokenCount + 1) % 8;
  
  for (int j=0;j<numObjects;j++)
  { 
    float posX=centerX + distance *sin(angleObject*j + frameCount*.05);
    float posY=centerY + distance *cos(angleObject*j + frameCount*.05);
    
    
    distance -= 50;
    float posX2=centerX + distance *sin(angleObject*j + frameCount*.05);
    float posY2=centerY + distance *cos(angleObject*j + frameCount*.05);
    distance += 50;
    float posX3=centerX + .125 * distance *sin(angleObject*j + frameCount*.05);
    float posY3=centerY + .125*distance *cos(angleObject*j + frameCount*.05);
    
    pushMatrix();
    scale(.25);
    translate(1150, 1150);
    drawGief(posX3, posY3);
    popMatrix();
    
    pushMatrix();
    scale(.35);
    translate(posX2 + 750, posY2 + 750);
    rotate(angleObject*(numObjects - j) - + frameCount*.01);
    drawDoken(0, 0);
    popMatrix();
    
    pushMatrix();
    scale(.5);
    translate((350), (350));
    drawGief(posX2, posY2);
    popMatrix();
    
    pushMatrix();
    scale(.75);
    translate(posX + 130, posY + 150);
    rotate(angleObject*(numObjects - j) + frameCount*.01);
    drawDoken(0, 0);
    popMatrix();
    
    drawGief(posX - 50, posY - 50);

    pushMatrix();
    scale(1.5);
    translate(posX - 125, posY - 125);
    rotate(angleObject*(numObjects - j) + frameCount*.01);
    drawDoken(0, 0);
    popMatrix();

  }
  
  drawZanWiggle(100, 725);
  
  pushMatrix();
  translate(100, 625);
  rotate(PI);
  drawZanWiggle(0, 0);
  popMatrix();
  
  pushMatrix();
  translate(125, 75);
  rotate(PI);
  drawZanWiggle(0, 0);
  popMatrix();
  
  pushMatrix();
  drawZanWiggle(125, 175);
  popMatrix();
  
  pushMatrix();
  translate(675, 75);
  rotate(PI);
  drawZanWiggle(0, 0);
  popMatrix();
  
  pushMatrix();
  drawZanWiggle(675, 175);
  popMatrix();
  
  drawZanWiggle(675, 725);
  
  pushMatrix();
  translate(675, 625);
  rotate(PI);
  drawZanWiggle(0, 0);
  popMatrix();
}

void drawGief(float x, float y)
{
  
  pushMatrix();
  //scale(.75);
  
  if(zanSpinCount == 0){
    zangief = img1.get(0, 24 * 150, 90, 150);
    image(zangief, x, y);
  }
  else if(zanSpinCount == 1){
    zangief = img1.get(90, 24 * 150, 200, 150);
    image(zangief, x - 40, y);
  }
  else if(zanSpinCount == 2){
    zangief = img1.get(280, 24 * 150, 200, 150);
    image(zangief, x - 70, y);
  }
  else if(zanSpinCount == 3){ 
    zangief = img1.get(510, 24 * 150, 90, 150);
    image(zangief, x + 10, y); 
  }
  else if(zanSpinCount == 4){
    zangief = img1.get(30, 25 * 150, 200, 150);
    image(zangief, x- 30, y);
  }
  else if(zanSpinCount == 5){
    zangief = img1.get(230, 25 * 150, 200, 150);
    image(zangief, x - 50, y);
  }
  
  popMatrix();
}

void drawDoken(float x, float y)
{
  imageMode(CENTER);
  if(dokenCount == 0)
  {
    hDoken = img2.get(0, 105 * 32, 100, 50);
    image(hDoken, x, y);
  }
  else if(dokenCount == 1)
  {
    hDoken = img2.get(100, 105 * 32, 80, 50);
    image(hDoken, x + 10, y);
  }
  else if(dokenCount == 2)
  {
    hDoken = img2.get(185, 105 * 32, 120, 50);
    image(hDoken, x - 10, y);
  }
  else if(dokenCount == 3)
  {
    hDoken = img2.get(310, 105 * 32, 80, 50);
    image(hDoken, x + 10, y);
  }
  else if(dokenCount == 4)
  {
    hDoken = img2.get(395, 105 * 32, 100, 50);
    image(hDoken, x, y);
  }
  else if(dokenCount == 5)
  {
    hDoken = img2.get(500, 105 * 32, 80, 50);
    image(hDoken, x, y); 
  }
  else if(dokenCount == 6)
  {
    hDoken = img2.get(0, 101 * 34 - 10, 100, 50);
    image(hDoken, x, y);
  }
  else if(dokenCount == 7)
  {
    hDoken = img2.get(105, 101 * 34 - 10, 80, 50);
    image(hDoken, x + 10, y);
  }
  
  imageMode(CORNER); 
}

void drawZanWiggle(int x, int y)
{
    imageMode(CENTER);
    if(zanWiggleCount == 0)
    {
      zanWiggle = img1.get(95, 152 * 21 - 10, 105, 150);
      image(zanWiggle, x - 20, y);
    }
    else if(zanWiggleCount == 1)
    {
      zanWiggle = img1.get(205, 152 * 21 - 10, 165, 150);
      image(zanWiggle, x, y);
    }
    else if(zanWiggleCount == 2)
    {
     zanWiggle = img1.get(375, 152 * 21 - 18, 190, 150);
     image(zanWiggle, x + 10, y - 5);     
    }
    imageMode(CORNER);
}

