
/*****************************************
 * Assignment 3
 * Name: Stephanie Bredbenner
 * E-mail: sbredbenne@brynmawr.edu
 * Course:  CS 110 - Section 01
 * Submitted: 10/3/2012
 *My sketch for assignment 3, for which I coded a space scene 
 *with randomly generated planets and satellites. 
 *
 ***********************************************/
//planet variables declared
float p1CenterX = random (100, 250);
float p1CenterY = random (100, 150);
float p1Width = random (90,150);
float p1Height = random (90, 150); 
float p2Width = random (90,150);
float p2Height = random (90, 150); 
float p3Width = random (90,150);
float p3Height = random (90, 150); 
float p2CenterX = random (350, 400);
float p2CenterY = random (100, 200);
float p3CenterX = random (100, 350);
float p3CenterY = random (300, 350);
//satellite variables declared
float s1CornerX = random (0, 50);
float s1CornerY = random (0,50);
float s1Width = random (50, 70);
float s1Height = random (20, 50);
float s2CornerX = random (375, 430);
float s2CornerY = random (0, 50); 
float s2Width = random (50, 70);
float s2Height = random (20, 50);
float s3CornerX =  random (400, 450);
float s3CornerY = random (400, 450);
float s3Width = random (50, 70);
float s3Height = random (20, 50);

void setup () {
  //setup
  size (500, 500);
  smooth ();
  rectMode (CORNER);
  ellipseMode (CENTER);
  background (4, 4, 44);
}

void draw () {
 //use array for stars?
 //draw planets using functions
 drawPlanet1 (p1CenterX, p1CenterY, p1Width, p1Height);
 drawPlanet2 (p2CenterX, p2CenterY, p2Width, p2Height);
 drawPlanet3 (p3CenterX, p3CenterY, p3Width, p3Height);
 //draw satellites using functions
 drawSatellite1 (s1CornerX, s1CornerY, s1Width, s1Height);
 drawSatellite2 (s2CornerX, s2CornerY, s2Width, s2Height);
 drawSatellite3 (s3CornerX, s3CornerY, s3Width, s3Height);
  }
  
  /****************************************************************************
 **Funtion: drawPlanet1
 **Inputs: p1CenterX, p1CenterY, p1Width, p1Height.
 **Outputs: a drawing of a randomly generated planet that will appear
 **in the upper left hand portion of the screen.
 *****************************************************************************/
 void drawPlanet1 (float p1CenterX, float p1CenterY, float p1Width, float p1Height){
   float speed = 1;
   fill (224, 7, 25);
   ellipse (p1CenterX, p1CenterY, p1Width, p1Height);
   if (mouseX >= 250) {
     p1CenterX = p1CenterX + speed;
   }
   if ((mouseX >= p1CenterX + p1Width) && (mouseX <= p1CenterX - p1Width) && (mouseY >= p1CenterY + p1Height) && (mouseY <= p1CenterY - p1Height)) {
     fill (63, 165, 214);
   }
 }
   /****************************************************************************
 **Funtion: drawPlanet2
 **Inputs: p2CenterX, p2CenterY, p2Width, p2Height.
 **Outputs: a drawing of a randomly generated planet that will appear
 **in the upper right hand portion of the screen.
 *****************************************************************************/
  void drawPlanet2 (float p2CenterX, float p2CenterY, float p2Width, float p2Height){
   fill (45, 131, 20);
   ellipse (p2CenterX, p2CenterY, p2Width, p2Height);
 }
  /****************************************************************************
 **Funtion: drawPlanet3
 **Inputs: p3CenterX, p3CenterY, p3Width, p3Height.
 **Outputs: a drawing of a randomly generated planet that will appear
 **in the bottom portion of the screen. 
 *****************************************************************************/
  void drawPlanet3 (float p3CenterX, float p3CenterY, float p3Width, float p3Height){
   fill (227, 122, 37);
   ellipse (p3CenterX, p3CenterY, p3Width, p3Height);
  }
   
/****************************************************************************
 **Funtion: drawSatellite1
 **Inputs: s1CornerX, s1CornerY, s1Width, s1Height
 **Outputs: a drawing of a randomly generated satellite.
 *****************************************************************************/
 void drawSatellite1 (float s1CornerX, float s1CornerY, float s1Width, float s1Height){
   float speed = 1;
   fill (142, 135, 130);
   rect (s1CornerX, s1CornerY, s1Width, s1Height);
 }
 
 /****************************************************************************
 **Funtion: drawSatellite2
 **Inputs: s2CornerX, s2CornerY, s2Width, s2Height
 **Outputs: a drawing of a randomly generated satellite.
 *****************************************************************************/
 void drawSatellite2 (float s2CornerX, float s2CornerY, float s2Width, float s2Height){
   fill (142, 135, 130);
   rect (s2CornerX, s2CornerY, s2Width, s2Height);
 }
  /****************************************************************************
 **Funtion: drawSatellite3
 **Inputs: s3CornerX, s3CornerY, s3Width, s3Height
 **Outputs: a drawing of a randomly generated satellite.
 *****************************************************************************/
 void drawSatellite3 (float s3CornerX, float s3CornerY, float s3Width, float s3Height){
   fill (142, 135, 130);
   rect (s3CornerX, s3CornerY, s3Width, s3Height);
   
 }

