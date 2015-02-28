
int x;
int y;
int secMill = 1000;
int savedMill;
boolean openEyes;
boolean animateBall;
PFont font;


void setup () {
  size (600, 480); //size of the window
  background (50); //colour of the background
  ellipseMode (CENTER);
  rectMode (CENTER);
  font = createFont ("alittlepot.ttf", 18, true);
  smooth ();
  strokeWeight (2);
  savedMill = millis (); //assigns the integer savedMill the value of millis
  openEyes = false; //default setting of boolean to false
  animateBall = false; //sets the default of boolean to false
  x=600; //assigns a value of 600 to x
  y=220; //assigns a value of 220 to y
}

void draw () {
  
    //***screen flashes for a full minute every hour***\\
  int m = minute (); //sets the value of m to minute
  if (m==0) { //for the duration of the value of m being 0 
    background (random (255), random (255), random (255)); //choses random background colour
  } else {
    background (50); //when the value of m is not 0 this is the background colour
  }
  
  int mon = month(); //assigns integer mon the value of the current month
  int d = day(); //assigns integer day the value of the current day
  int h = hour (); //assigns integer h the value of the current hour
  int minu = minute(); //assigns integer d the value of the current day
  int sec = second(); //assigns integer sec the value of the current second
  
  //***code for the text in the incident sign**\\
  fill (200);//grey sign colour
  rect (300, 50, 500, 100);//draws a rectangle
  textFont (font, 24);//calls font, sets text size to 24
  fill (255, 0, 0); //red for numbers
  text (mon, 70, 35); 
  fill (0); //black
  text ("months", 100, 35);
  fill (255, 0, 0);
  text (d, 170, 35);
  fill (0);
  text ("days", 200, 35);
  fill (255, 0, 0);
  text (h, 255, 35);
  fill (0);
  text ("hours", 285, 35);
  fill (255, 0, 0);
  text (minu, 340, 35);
  fill (0);
  text ("minutes", 370, 35);
  fill (255, 0, 0);
  text (sec, 445, 35);
  fill (0);
  text ("seconds", 475, 35);
  text ("since the last incident", 210, 75);
  
  points (55, 5); //calls the procedure called points
  
  //***code for creating the conveyor belt***\\\
  beginShape ();
  //outside conveyor belt arc
  fill (150);
  curveVertex (600, 230); //beginning point of the curve
  curveVertex (600, 230);
  curveVertex (280, 230);
  curveVertex (280, 300);
  curveVertex (600, 300); //end point of the curve
  curveVertex (600, 300);
  endShape ();
  
   beginShape ();
  //inside conveyor belt arc
  fill (200);
  curveVertex (600, 245); //beginning point of the curve
  curveVertex (600, 245);
  curveVertex (295, 245);
  curveVertex (295, 285);
  curveVertex (600, 285); //end point of the curve
  curveVertex (600, 285);
  endShape ();
  
  //***loop that creates conveyor belt wheels***\\
  for (int xPos=580; xPos > 280; xPos -=40) { 
  beltWheels (xPos, 265, 35, 35); //calls the procedure beltWheels
  }
  
   //***a ball rolls down the conveyor every minute***\\
  int s = second (); //dclares the value of s as second
  if (s==0) { //if the value of s is 0 then the boolean is true
     animateBall = true;
  }
  if (animateBall == true) { //if the boolean is true, execute this code
    fill (255, 20, 147);
    ellipse (x, y, 25, 25); //draws an ellipse
    x--; //decrements by 1
    if (x<=240){ //if the value of x is less than or equal to 240
      y=y+2; //y increments 2
      if (y==600) { //if the value of y is 600
        animateBall = false; //the boolean becomes false and the animation stops
        x=600; //assigns x the value of 600
        y=220; //assigns y the value of 220
      }  
    }
  }
  
  
  //***monster teeth***\\
  //top row (top to bottom)
  fill (255);
  beginShape ();
  vertex (185, 250);
  vertex (205, 260);
  vertex (165, 265);
  vertex (195, 280);
  vertex (150, 285);
  vertex (185, 295);
  vertex (145, 300);
  endShape ();
  
  //bottom row
  beginShape ();
  vertex (235, 363);
  vertex (230, 355);
  vertex (225, 360);
  vertex (220, 355);
  vertex (210, 358);
  vertex (200, 350);
  vertex (190, 355);
  
  endShape ();
  
  //***monster body***\\
  fill (124, 252, 0); //green for the monsters body
  beginShape ();
  curveVertex (50, 480);
  curveVertex (50, 480);
  curveVertex (15, 230);
  curveVertex (180, 230);
  curveVertex (150, 300);
  curveVertex (180, 350);
  curveVertex (250, 375);
  curveVertex (300, 480);
  curveVertex (300, 480);
  endShape ();
  
   //***blinking monster eyes every second***\\
  
  //assigns integer passedMill the value of millis - the saved millis
  int passedMill = millis() - savedMill; 
  //if the amount of milliseconds passed is less than 1000
  if (passedMill < secMill) { 
    //boolean is true
    openEyes = true;
  }
  //if the boolean is true
  if (openEyes == true) {
    //call monsterEyes procedure
    monsterEyes (80, 300, 25, 25);
    //if the amount of milliseconds passed is more than 1000
    if (passedMill > secMill){
      //boolean is false
      openEyes = false;
      //call the needsVisine procedure
      needsVisine (80, 300, 25, 25);
      //assigns savedMill the value of millis
      savedMill = millis();
    }
  }
  
  //***monster arms***\\
  line (200, 420, 300, 350); //right arm
  //right fingers
  line (300, 350, 310, 340);
  line (300, 350, 310, 355);
  line (300, 350, 305, 335);
  
  line (250, 375, 290, 330); //left arm
  //left fingers
  line (290, 330, 300, 320);
  line (290, 330, 300, 330);
  line (290, 330, 295, 315);
 }
 
//***procedure for creating belt wheels***\\
void beltWheels (int xPos, int yPosition, int wide, int tall) {
  {
    fill (200); // grey fill
    ellipse (xPos, yPosition, wide, tall); //draws an ellipse
    ellipse (xPos, yPosition, wide-10, tall-10); //draws an ellipse
    fill (0); //black fill
    ellipse (xPos, yPosition, wide-30, tall-30); //draws and ellipse
  }
}
  
  //***procedure monster eyes, creates the open eyes of the monster***\\
void monsterEyes (int xEye, int yEye, int wEye, int hEye) {
    fill (255); //sets colour to white
    ellipse (xEye, yEye, wEye, hEye); //draws an ellipse for outer left eye
    fill (0); //sets colour to black
    ellipse (xEye+5, yEye, wEye-15, hEye-15); //draws an ellipse inner left eye
    fill (255); //sets colour to white
    ellipse (xEye+40, yEye-60, wEye-5, hEye-5); //draws an ellipse outer right eye
    fill (0); //sets colour to black
    ellipse (xEye+35, yEye-60, wEye-20, hEye-20); //draws an ellipse inner right eye
  }

//***function to create closed eyes of monster***\\
  void needsVisine (int xVisine, int yVisine, int wVisine, int hVisine) {
    fill (124, 252, 0); //colour green of monster
    ellipse (xVisine, yVisine, wVisine, hVisine); //closed left eye
    ellipse (xVisine+40, yVisine-60, wVisine-5, hVisine-5); //closed right eye
    line (xVisine+10, yVisine-8, xVisine-10, yVisine+10); //draws the left eyelid line
    line (xVisine+48, yVisine-68, xVisine+35, yVisine-53); //draws the right eyelid line
  }  
  
  //***procedure to draw the points for the sign***\\
void points (int pointX, int pointY) {
  stroke (10);
  strokeWeight (3);
  point (pointX, pointY); //top left point
  point (pointX, pointY+90); //bottom left point
  point (pointX+490, pointY); //top right point
  point (pointX+490, pointY+90); //bottom right point
}
