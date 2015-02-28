
int x, y;  //fågelns koordinater
int rectX, upperBound, lowerBound; //rektanglarnas koordinater
int rectWidth;
color rectColor;
PImage flappyBird, bkgr;
int bkgrX; //bakgrundens x-koordinat
/*******************************************************************/
/*info bakgrundsbild:                                              */
/*bilden är 1136 pixlar lång men ser likadan ut efter 284 pixlar   */
/*den är 91 pixlar hög så himmel och gräs måste målas.             */
/*himmelsfärg = rgb(118, 198, 206)                                 */
/*gräsfärg = rgb(136, 226, 143)                                    */
/*******************************************************************/
 
 
void setup() {
  size(700, 500);
  rectWidth = 50;
  x = width/4;
  y = height/2;
  flappyBird = loadImage("FlappyBird.png");
  bkgr = loadImage("LongFlappyBirdBkgr.png");
  newRectangles();
}
 
void draw() {
  //måla himmel, gräs och bakgrund
  noStroke();
  fill(118, 198, 206);
  rect(0,0, width, height/2);
  fill(136, 226, 143);
  rect(0, height/2, width, height);
  image(bkgr, bkgrX, height/2);
  //flytta bakgrund i x-led
  if (bkgrX<-283) {
    bkgrX = 0;
  } else {
    bkgrX -=1;
  }
  //flytta fågeln upp
  if (mousePressed) {
    if (y>5) {
       y -=5;
    }
  }
  //låt fågeln sjunka ner
  if (y+50<height) {
    y += 2;
  }
  //rotera fågeln slumpmässigt mellan -3 och 3 grader och måla den
  pushMatrix();
  translate(x, y);
  rotate(radians(random(-3, 3)));
  image(flappyBird, 0, 0);
  popMatrix();
  //flytta och måla rektanglar
  rectX -= 2;
  if (rectX+rectWidth<0) {
    newRectangles();
  }
  stroke(0);
  fill(rectColor);
  rect(rectX, -2, rectWidth, upperBound);
  rect(rectX, lowerBound, rectWidth, height);
  rect(rectX-2, upperBound-10, rectWidth+4, 10);
  rect(rectX-2, lowerBound, rectWidth+4, 10);
}
 
//slumpa nya rektanglar
void newRectangles() {
  rectX = width;
  upperBound = int(random(20, height-130));
  lowerBound = upperBound+110;
  rectColor = color(random(256), random(256), random(256));
}
 
