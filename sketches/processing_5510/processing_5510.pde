
/*
*  Random Type Visualizer
 *  by Hannah Perner-Wilson, www.plusea.at
 *  Begin typing and every time you make a space a shape will be drawn on screen.
 *  Representing random changes made through the alphabet of the word.
 *  ... work in progress
 */

float r = 10;
float g = 10;
float b = 10;
float alph = 255;
float R = 0;
float G = 0;
float B = 0;
float Alph = 0;
int ran = 0;


void setup(){
  size(700,600);
  frameRate(25);
  background(255);
  strokeWeight(5);
  stroke(0);
  smooth();
  strokeCap(ROUND);
}//end setup


void draw(){
  stroke(r,g,b, alph);
  fill(R,G,B, Alph);
}//end draw()


void keyPressed(){
  if (key=='a')
    g = 30;

  if (key=='b')
    r = 10;

  if (key=='c')
    b = 20;

  if (key=='d')
    r = random(255);

  if (key=='e')
    g = random(255);

  if (key=='f')
    b = random(255);

  if (key=='g')
    alph = random(255);

  if (key=='h')
    G = random(255);

  if (key=='i')
    R = random (255);

  if (key=='j')
    B = random (255);

  if (key=='k')
    Alph = random(255);

  if (key=='l')
    Alph = 255;

  if (key=='m')
    strokeCap(ROUND);

  if (key=='n')
    strokeCap(SQUARE);

  if (key=='o')
    r = 255;

  if (key=='p')
    g = 255;

  if (key=='q')
    b = 255;

  if (key=='r')
    ellipseMode(CORNER);

  if (key=='s')
    r = 28;

  if (key=='t')
    b = 45;

  if (key=='u')
    g = 200;

  if (key=='v')
    g = 30;

  if (key=='w')
    G= 255;

  if (key=='x')
    R = 255;

  if (key=='y')
    B = 255;

  if (key=='z')
    alph = 255;

  if (key==' '){
    ran = int(random(3));
    if(ran == 0)line(random(width), random(height), random(width), random(height));
    if (ran == 1)rect(random(width), random(height), random(width), random(height));
    if (ran ==2)ellipse(random(width), random(height), random(width), random(height));
  }


}// end keyPressed

