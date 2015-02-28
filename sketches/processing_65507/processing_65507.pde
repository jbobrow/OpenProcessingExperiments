
/* 
 'Spirograph'
 
 Program written for CPSC 601-36
 Assignment 3
 Prepared for Ben Stephenson
 Written by Christopher Sparrow
 2011/11/03
 
 This program writes sine curves around circles by 
 drawing lines between two points on the sine curve
 aggregating multiple lines using continuous mode.
 
 The user is able to modulate the values that define
 both the circle and the curve using mouse input on 
 the drawing screen.
 
 */

boolean title = false;     // toggles title screen
boolean pause;             // pauses the program
PFont bfont;               // large font
PFont sfont;               // small font
float cr = 50;             // circle function: circle radius
float cx;                  // circle x value
float cy;                  // circle y value
float angle = (1.5 * PI);  // angle start         
float angle2 = (1.5 * PI) + (PI/60);  //circle function: second angle start
int rad = 100;              // radius of spiro
int iRad = 20;             // inner radius of spiro
int pi_A = 20;             // length of line (lower # is longer)
float pi_B = 3;            // modifies the (rad)ius based on sine wave
int pi_C = 2;              // modifies the radius of the spiro
int pi_D = 1;              // modifies the step angle


/*
   sets the window size, line quality, background, stroke colour, 
   fill colour, text alignment, font styles, base framerate.
*/
void setup ()              
{        
  size (800, 800);  
  smooth ();
  background (0);
  stroke (255);
  fill (255);
  textAlign (CENTER);
  bfont = loadFont("BankGothicBT-Light-48.vlw");  
  sfont = loadFont ("BankGothicBT-Light-24.vlw"); 
  frameRate (60);
}

/*
   Draw a semi transparent rectangle every 15 frames to 
   slowly overwrite legacy spiro.
*/
void bgnd ()                  
{ 
  if (frameCount % 15 <= 0)
  {
    stroke (0);
    fill (0, 20);
    rect (0, 0, 800, 800);
  }
}


//  Draws the linear sine wave on the titlescreen

void circle (float cx, float cy)
{
  float x;
  float y;
  float px;
  float py;

  if (frameCount % 1 <= 0)
  {
    x = cx + (cos(angle) * cr);    // determines a point
    y = cy + (sin(angle) * cr);    // on a circle
    
    stroke (255,20);             
    
    angle += 1.5 * PI/60;          // angle step around circle
    
    stroke (125,20);
    
    px = cx + (cos(angle2) * cr);  // determines a second point
    py = cy + (sin(angle2) * cr);  // on a circle
    
    stroke (255,100);
    
    line  (px, py, x, y);          // line joining first circle 
                                   // point to second
    angle2 += 1.5 * PI/60;         // angle increment for next loop
  }
}

/*
Draws the spirograph when called. 
*/
void spiro ()
{
  float x;              //x-value of spiro point 1
  float y;              //y-value of spiro point 1
  float px;             //x-value of spiro point 2
  float py;             //y-value of spiro point 2

// the horizontal and vertical array of the spiro's across the screen
  for (float i = 0; i <= width; i = i + 200)
  {
    for (float j = 0; j <= 600; j = j + 200) 
    {
      cx = i;
      cy = j;
        
        //formula defines the location of a first point on a sinewave mapped to a circle
        x = cx +(cos(angle + PI/pi_A) * (rad + (sin(angle * (PI/pi_B) + (PI/pi_C))*iRad)));
        y = cy +(sin(angle + PI/pi_A) * (rad + (sin(angle * (PI/pi_B) + (PI/pi_C))*iRad)));
       
        //formaula defines the location of a second point on a sinewave mapped to a circle
        px = cx +(cos(angle - PI/pi_A) * (rad + (sin(angle * (PI/pi_B) - (PI/pi_C))*iRad)));
        py = cy +(sin(angle - PI/pi_A) * (rad + (sin(angle * (PI/pi_B) - (PI/pi_C))*iRad)));
        
        stroke (255);

        //increment of angle on circle
        angle += 2 * (PI/pi_D);
                
        strokeWeight (1);
        beginShape ();
        vertex (x, y);
        vertex (px, py);
        endShape ();
    }
  }
}

// defines the buttons at the bottom of the spiro screen
void buttons ()

{
  String operators = "++++++------";       // characters on buttons 
  char oper;
  int var_pos = 0;                         // string position

  stroke(0);                         
  textAlign (CENTER);

  fill (0); 
  rect (0, 650, 800, 800);                // black background behind buttons


  float [] parameters = {rad, iRad, pi_A, pi_C, pi_D, pi_B}; // list of parameter values mapped to buttons
    
  String [] pName = {"rad1", "rad2", "A", "B", "C", "D"} ;    // list of parameter names mapped to buttons
  
  for (int y = 700; y <= 720; y = y + 20)                    // array of buttons
  {
    for (int x = 80; x <= 700; x = x + 120)
    {
      fill(100);
      rect(x, y, 20, 20);
      fill (255);
      oper = operators.charAt(var_pos++);                    //when an operator is drawn, move to next in list
      textSize (16);
      text(oper, x+10, y+15);                                //draw the operators
    }
  }
  textSize (25);

  for (int index = 0; index <= 5; index ++)
  {
    for (int i = 130; i <= 610; i = i + 120)
    {
      text (pName [index], i-30, 770);                       //draw int value names below controls
      text (round(parameters [index++]), i, 730);            //draw the 5 int values beside their controls
    }
    textAlign (LEFT);
    text (parameters [5], 705, 730);                         //draw float values beside controls
    text (pName [5], 690, 770);                              //draw float value name below controls
  }
}

// if a button is released when the mouse x&y are located within a button, add or subtract 
// a value from the corresponding parameter & display
void mouseReleased ()
{
  if (((mouseX <= 100) && (mouseX >= 80)) && ((mouseY <= 720) && (mouseY >= 700)))
    rad++;
  if (((mouseX <= 100) && (mouseX >= 80)) && ((mouseY <= 740) && (mouseY >= 720)))
    rad--;
  if (((mouseX <= 220) && (mouseX >= 200)) && ((mouseY <= 720) && (mouseY >= 700)))
    iRad++;
  if (((mouseX <= 220) && (mouseX >= 200)) && ((mouseY <= 740) && (mouseY >= 720)))
    iRad--;
  if (((mouseX <= 340) && (mouseX >= 320)) && ((mouseY <= 720) && (mouseY >= 700)))
    pi_A++;
  if (((mouseX <= 340) && (mouseX >= 320)) && ((mouseY <= 740) && (mouseY >= 720)))
    pi_A--;
  if (((mouseX <= 460) && (mouseX >= 440)) && ((mouseY <= 720) && (mouseY >= 700)))
    pi_C++;
  if (((mouseX <= 460) && (mouseX >= 440)) && ((mouseY <= 740) && (mouseY >= 720)))
    pi_C--; 
  if (((mouseX <= 580) && (mouseX >= 560)) && ((mouseY <= 720) && (mouseY >= 700)))
    pi_D++;
  if (((mouseX <= 580) && (mouseX >= 560)) && ((mouseY <= 740) && (mouseY >= 720)) && (pi_D > 1))
    pi_D--;
  if (((mouseX <= 700) && (mouseX >= 680)) && ((mouseY <= 720) && (mouseY >= 700)))
    pi_B+= .25;
  if (((mouseX <= 700) && (mouseX >= 680)) && ((mouseY <= 740) && (mouseY >= 720)))
    pi_B-= .25;
}

// enables the program to be paused.
void mousePressed ()
{
  if (mouseButton == RIGHT)
  {
   pause = !pause;
   if (pause)
   {
     noLoop ();
   }
   else
   {
     loop();
   }
 }
}

// titlepage function
void titlep () 
{
  noCursor ();

  fill (0, random (255)); //redraws the background for each frame of the titlescreen 
  rect (0, 0, 800, 800);

  fill (255, random (255));      // flashing titletext  
  textFont(bfont);              // title font
  text("Spirograph", 400, 140); // title name

  textFont (sfont);
  fill (255);
  text("written by Christopher Sparrow", 400, 420);
  text("change values to generate different patterns", 400, 710);
  text("mouseclick to start", 400, 750);
  if (frameCount % 1 <= 0)
  {
    for (float i = -100; i < 900; i= i + 0.01)
    {   
      circle (i, 600);
      i++;
    }
  }
}

// primary program loop
void draw ()
{

  if (mouseButton == LEFT) //once mousebutton is pressed titlescreen is complete
  {                        // run the main code
    title = true; 
  }
  if (!title)
  {
    titlep ();
    frameRate (20);
  }
  else                      //maincode
  {
    frameRate (60);         //adjust framerate
    bgnd();                 //call background function
    cursor (CROSS);         //update cursor
    spiro ();               //start spiro
    buttons ();             //add the buttons
  }
 }
 



