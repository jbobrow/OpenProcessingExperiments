
                                                   // THIS IS WHERE I DECLARE ALL MY GLOBAL VARIABLES
                                                   
int fr=60;                                         // makes the int possible
float cx,cy,cex,cey;                               // makes the float possible
float sx,sy,sv,svx,svy;                            // makes the float possible
float gac,gvy, angle;                              // makes the float possible
boolean fired;                                     // creates the fired boolean
boolean overLinkButton = false;                    // creates the link button boolean
boolean overRightButton = false;                   // creates the right button boolean
boolean overLeftButton = false;                    // creates the left button boolean
boolean overFireButton = false;                    // creates the fire button boolean
boolean overHeavensGate = false;                   // creates the heavens gate boolean
PImage img1;                                       // image foreground
PFont fnt;                                         // text font
import ddf.minim.*;                                // imports minim rules
Minim minim;                                       // sets up Minim as minim
AudioSample cannon;                                // cannon sound
AudioSample heaven;                                // impact sound


/////
//PImage img2;                                     //Not Used// image background
//int x,y;                                         //Not Used//  image scroll field
/////

void setup()                                       // SETS THE RULES FOR MY PROJECT
{            
  frameRate(fr);                                   // sets the framerate
  size(600,400,P2D);                               // sets the size of the canvas
  fired=false;
  cx=64;                                          // move to the side
  cy=183;                                         // changes the height
  angle = 0;                                      // the angle that the cannon is pointing (the cannon can turn full circle)
  sv = 600/fr;                                    // hight of shot (the higher the number the less distance travelled)
  gac = 9.8/fr;                                   // added to gyy each frame; = the amount of gavity
  gvy=0; smooth();                                // smooths out the pixilation  
  minim = new Minim(this);                                  // loads up Minim
  heaven = minim.loadSample("Hitting the Gates.mp3");       // makes the minim my chosen sound the shot hitting the gates
  cannon = minim.loadSample("cannon fire.mp3");             // makes the minim my chosen sound for the cannon
 

/////  
//  x=-1200; y=0;                                  //Not Used//  places the screen at the extreme right of the picture
//  img2 = loadImage("CloudsScrolling.jpg");       //Not Used//  setting img2 as my chosen picture
//  image(img2,x,y);                               //Not Used//  placing and sizing image using the information above
/////

  fnt=loadFont("BatmanForeverAlternate-30.vlw");   // loads the created font
  textFont(fnt,30);                                // size of the font to be used
  textAlign(CENTER, TOP);                          // where the font is alligned
  smooth();                                        // smooths all the pixaleted edges
  
/////
//noLoop();                                        //Not Used//  stops the continuous execution of the code (should be last thing in setup)
/////
}
void draw()                                        // DRAWS ONTO CANVAS ALL OF BELOW
{                 
  img1 = loadImage("CloudForeground3.jpg");        // setting img1 as my chosen picture
  image(img1,0,0);                                 // placing and sizing image
  
/////  
//img1.resize(width,height);                      //Not Used//  resizes img1 into the same as the program screen
//background (img1);                              //Not Used//  places the image as the background
/////

  fill(0);                                          // image colour
  text("Knocking on Heavens Door", 285, 20);        // the placed text followed by, length placement, width placement
  fill(255,0,0);                                    // image colour
  text("With a Cannon!!",285,50);                   // the placed text followed by, length placement, width placement
  fill(128,100,82);                                 // image colour
  text("Hits Needed??",370,370);                    // the placed text followed by, length placement, width placement
  
/////  
//  x=-1200; y=0;                                   //Not Used//  places the screen at the extreme right of the picture
//  img2 = loadImage("CloudsScrolling.jpg");        //Not Used//  setting img2 as my chosen picture
//  image(img2,x,y);                                //Not Used//  placing and sizing image using the information above
/////
  
  fill(208,50);                                     // bacground colour - the fading of after images
  rect(0,0,width,height);                           // the side, the length, = what's not in the box isn't shown
  drawButton();                                                                     // draws the buttons
  drawCannon();                                                                     // draw the cannon
  if (fired){                                                                       // if shot is fired
    drawShell();                                                                    // draw the shell
    println(nfs(sx,3,0)+nfs(sy,3,0)+nfs(svy,3,2)+nfs(gvy,300,200));                 // gvy= weight of the shot
    delay(10);                                     // this should stop the program to stop for 10 miliseconds inorder for it to have time to process. My laptop doesn't like the CPU power that the code and mp3 require
  }  
}
void drawCannon()                                  // RULES FOR CANNON
{       
  strokeWeight(20); stroke(0,0,0);                 // width of cannon ; colour of cannon
  cex = cx+60*cos(radians(angle));                 // if low makes the cannon extend as you point it up and shrink as you point it down
  cey = cy+60*sin(radians(angle));                 // if low makes the cannon shrink as you point it up and extend as you point it down
  line(cx,cy,cex,cey);                             // places cannon 
  strokeWeight(1); stroke(0);                      // makes shot bigger , thicker
} 
void drawShell()                                   // RULES FOR THE CANNON SHELL
{
  gvy=gvy+gac;                                     // formulae for gvy
  sy = sy + svy+gvy;                               // formulae for sy
  sx = sx + svx;                                   // formulae for sx
  if (sy>height) fired=false;                      // if condition is met boolean set to false
  else ellipse(sx,sy,5,5);                         // flatens it along it's width, flatens it along it's height = changes the dimensions of (circle) shot

  if(sx > 480 && sx < 542 && sy > 108 && sy <172)    // if the shell enters the co-ordinates of the heavens gate
    {
      overHeavensGate = true;                        // the bolean become true
      fired=false;                                   // the shell ceases to exist
    }  
} 

void drawButton()                                   // RULES FOR THE BUTTONS
{
   if (overHeavensGate == true)                    // if the gate is hit with a shell
   {
    heaven.trigger();                              // trigger the sound clip
    delay(2000);                                   // this should delay the program before
    heaven.close();                                // stop the heaven sound
   }
   rect(480, 108, 62, 64);                         // rectangle length, height - last two are dimensions of rectangle length, height

  if (overLinkButton == true)                      // if link button is hovered over 
  {
    fill(155,40,40);                               // colour button
  } else                                           // otherwise
    {
      noFill();                                    // don't fill
    }
    rect(559, 369, 35, 27);                        // rectangle length, height - last two are dimensions of rectangle length, height

  if (overRightButton == true)                      // if right button is hovered over 
  {
    fill(155,40,40);                               // colour button
  } else                                           // otherwise
    {
      noFill();                                    // don't fill
    } 
    rect(118, 369, 35, 27);                        // rectangle length, height - last two are dimensions of rectangle length, height

  if (overLeftButton == true)                      // if left button is hovered over 
  {
    fill(155,40,40);                               // colour button
  } else                                           // otherwise 
    {
      noFill();                                    // don't fill
    } 
    rect(3, 369, 35, 27);                          // rectangle length, height - last two are dimensions of rectangle length, height

  if (overFireButton == true)                      // if fire button is hovered over
  {
    fill(155,40,40);                               // colour button
  } else                                           // otherwise
    {
      noFill();                                    // don't fill
    }
    rect(51, 369, 54, 27);                         // rectangle length, height - last two are dimensions of rectangle length, height
}
  void stop()                                      // RULES FOR STOP
  {
      cannon.close();                              // stop the cannon sound
      heaven.close();                              // stop the heaven sound
      minim.stop();                                // stop minim
      super.stop();                                // stop everything
  }

void mousePressed()                                // RULES FOR WHAT HAPPENS WHEN YOU PRESS THE BUTTONS
{ 
  if (overLinkButton)                              // if you press the link button
  {                            
    link("http://www.askrealjesus.com/goldenage/warpeace/consciousnesswar.html", "_new");     // a link opens on a new page
    link("http://www.jesus-is-lord.com/2_heaven.htm", "_new");                                // a link opens on a new page
  }else 
  if (overRightButton)                             // if you press the right button
  { 
    angle++;                                       // the cannon turns right
  }else 
  if (overLeftButton)                              // if you press the left button 
  { 
    angle--;                                       // the cannon turns left
  }else 
  if (overFireButton)                              // if you press the fire button you activate the formulae below
  { 
    {
      cannon.trigger();                            // the trigger for the cannon sound effect
    }
      sx=cex;                                      // formulae for sx
      sy=cey;                                      // formulae for sy
      svx=sv*cos(radians(angle));                  // formulae for svx
      svy=sv*sin(radians(angle));                  // formulae for svy
      gvy=0;                                       // formulae for gvy
      fired=true;                                  // boolean of fired is true
  }
}

/////
//void keyPressed()                                  //Not Used// RULES FOR WHAT HAPPENS WHEN YOU PRESS THE KEYS
//{    
//   if (key=='.')x+=10;                             //Not Used//  if you press the full stop button the screen moves forward 10
//   if (key==',')x-=10;                             //Not Used//  if you press the comma button the screen moves backward 10
//  if (key==CODED)                                  //Not Used// if one of the special keys is clicked then the two are below
//    {  
//      if (keyCode==LEFT) angle--;                  //Not Used// if you press the left directional button the cannon turns left
//      else if (keyCode==RIGHT) angle++;            //Not Used// if you press the right directional button the cannon turns right
//    }
//     else if (key==' ') {                          //Not Used// when you press space bar you activate the formulae below
//      {
//        cannon.trigger();                          //Not Used// the trigger for the cannon sound effect
//      }
//     sx=cex;                                       //Not Used// formulae for sx
//      sy=cey;                                      //Not Used// formulae for sy
//      svx=sv*cos(radians(angle));                  //Not Used// formulae for svx
//      svy=sv*sin(radians(angle));                  //Not Used// formulae for svy
//      gvy=0;                                       //Not Used// formulae for gvy
//      fired=true;                                  //Not Used// boolean of fired is true
//   }
//  }
/////

void mouseMoved()                                    // RULE TO CHECK DIFFERENT METHOD
{ 
  checkButtons(); 
}
void mouseDragged()                                  // RULE TO CHECK DIFFERENT METHOD
{
  checkButtons(); 
}
void checkButtons()                                  // RULES TO CHECK IF BUTTONS HAVE BEEN SELECTED
{
  if (mouseX > 559 && mouseX < 594 && mouseY > 369 && mouseY <396) {     // if mouse is clicked in these coordinates
    overLinkButton = true;                                               // then button is true
  } else                                                                 // otherwise
    if (mouseX > 3 && mouseX < 38 && mouseY > 369 && mouseY <396) {      // if mouse is clicked in these coordinates
    overLeftButton = true;                                               // then button is true 
  } else                                                                 // otherwise
    if (mouseX > 118 && mouseX < 153 && mouseY > 369 && mouseY <396) {   // if mouse is clicked in these coordinates
    overRightButton = true;                                              // then button is true 
  } else                                                                 // otherwise
  if (mouseX > 51 && mouseX < 105 && mouseY > 369 && mouseY <396) {      // if mouse is clicked in these coordinates
    overFireButton = true;                                               // then button is true 
  } else {                                                               // otherwise
    overLinkButton = overLeftButton = overRightButton = overFireButton = false;   // the button has not been selected
 }
}                                                  // END OF THE PROGRAM



