
import netscape.javascript.*;

  //Global variables
  
  int[] xCoordinates = {(randomx()), (randomx()), (randomx()), (randomx()), (randomx()), (randomx()), (randomx()), (randomx())};  //  This is the coordinates for the circles on the x axis.  
  int[] yCoordinates = {0, 0, 0, 0, 0, 0, 0, 0};  //  This is the coordinates of the circles on the y axis. 
  float r;  //  Red varible
  float g;  //  Green variable
  float b;  //  Blue variable
  int circleDiam = 30;  //  The size of the Circles
  boolean fire = false;  //  detects if it's false  
  int points =0;  //  Points are set to zero
  int randomx() {  //  All of the circles have a randon starting point along the x axis    
  return int(random(800));  //  It is set to 800 because I don't want any of the circles to be off screen. 
  } 
  void setup() {
  
  size(800, 800);  //  This is the size of the window
  smooth();  //  This sets the edges to smooth
  frameRate(50);  //  The framerate is set to 50
  stroke(0);  //  Colour of line inbetween
  line(150,0,150,300);  //  Line dividing the page
  line(0,225,300,225);  //  Line dividing the page
  line(0,100,300,100);  //  Line dividing the page  
} 

  void draw() {
    
  r=random(255);  //  Initialises variable
  g=random(255);  //  Initialises variable
  b=random(255);  //  Initialises variable
  background(r,g,b);  //  Creates a random colour background
 
  if (mouseY>255 && mouseY<=370){  //  The background turns solid blue when the mouse cursor is over the middle of the screen
  r=25;
  g=5;
  b=255;
  background(r,g,b);  //  Background colour
  }

  ellipseMode(CENTER);  // Set ellipses to CENTER mode
  rectMode(CENTER);  //  Sets rects to CENTER mode

  stroke(0); //  Colour of line inbetween
  line(400,0,400,800);  //  Line dividing the page
  line(0,200,800,200);  //  Line dividing the page
  line(0,400,800,400);  //  Line dividing the page
  line(0,600,800,600);  //  Line dividing the page


  stroke(0);  //  Black outline  
  fill (19, 0, 242);  //  Blue fill
  rect(pmouseX,pmouseY-20,11, 50); //  Neck follows the x and y location of the mouse
 
  stroke(0);  //  Black outline  
  fill (19, 0, 242);   //  Blue fill
  rect(pmouseX,pmouseY-40, 60, 60);  //  Head follows the x and y location of the mouse
  
  stroke(0);   //  Black outline  
  fill(0, 229, 17);  //  Colour green
  arc(pmouseX-18,pmouseY-70, 11, 11, TWO_PI-PI/1, TWO_PI);  //  Right ear follows the x and y location of the mouse
  
  stroke(0);   //  Black outline  
  fill(0, 229, 17);  //  Colour green
  arc(pmouseX+18,pmouseY-70, 11, 11, TWO_PI-PI/1, TWO_PI);  //  Left ear follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill (19, 0, 242);   //  Blue fill
  rect(pmouseX,pmouseY+35, 45, 60);  //  Body follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill (19, 0, 242);   //  Blue fill
  rect(pmouseX-43,pmouseY+30, 40, 10);  // Right arm follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill (19, 0, 242);   //  Blue fill
  rect(pmouseX+42,pmouseY+30, 40, 10);  //  Left arm follows the x and y location of the mouse

  stroke(0);  //  Black outline  
  fill(250, 13, 17);  //  Colour red
  ellipse(pmouseX-15,pmouseY-50, 16, 16);  //  Right eye follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill(250, 13, 17);  //  Colour red
  ellipse(pmouseX+15,pmouseY-50, 16, 16);  //  Left eye follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill(250, 13, 17);  //  Colour red
  arc(pmouseX,pmouseY-25, 14, 20, 0, PI/1);  //  Tongue follows the x and y location of the mouse
  if (mouseButton == CENTER) {
  arc(mouseX,mouseY-25, 28, 30, 0, PI/1); //  If mouseButton is a middle click then the tongue will change size
}

  stroke(0);   //  Black outline  
  fill(0, 229, 17);  //  Colour green
  rect(pmouseX,pmouseY-35, 10, 5);  //  Nose follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill(0, 229, 17);  //  Colour green
  ellipse(pmouseX-15,pmouseY-50, 4, 4);  //  Inner right eye follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill(0, 229, 17);   //  Colour green
  ellipse(pmouseX+15,pmouseY-50, 4, 4);  //  Inner left eye follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill (19, 0, 242);   //  Blue fill
  rect(pmouseX+12,pmouseY+85, 10, 40);  // Left leg follows the x and y location of the mouse

  stroke(0);   //  Black outline   
  fill (19, 0, 242);   //  Blue fill
  rect(pmouseX-12,pmouseY+85, 10, 40);  //  Right Leg follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill(0, 229, 17);   //  Colour green
  arc(pmouseX+13,pmouseY+107, 20, 20, TWO_PI-PI/1, TWO_PI);  //  Left Foot follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill(0, 229, 17);   //  Colour green
  arc(pmouseX-12,pmouseY+107, 20, 20, TWO_PI-PI/1, TWO_PI);  //  Right Foot follows the x and y location of the mouse

  stroke(0);   //  Black outline  
  fill(250, 13, 17);  // Red right hand
  arc(pmouseX-60,pmouseY+30, 10, 10, PI/2, PI);  //  Right hand
  arc(pmouseX-60,pmouseY+30, 10, 10, PI, TWO_PI-PI/2);  //  Right hand follows the x and y location of the mouse

  stroke(0);  //  Black outline    
  fill(250, 13, 17);  //  Red left hand
  arc(pmouseX+60,pmouseY+30, 10, 10, 0, PI/2);  //  Left hand follows the x and y location of the mouse
  arc(pmouseX+60,pmouseY+30, 10, 10, TWO_PI-PI/2, TWO_PI);  //  Left hand follows the x and y location of the mouse

  String s = "ROBO JR.";  //  The text that I wrote inside the box
  fill(0);  //  Black fill
  text(s, pmouseX+9,pmouseY+43, 50, 50);  // The text box follows the x and y location of the mouse
  
  //  laser game
  FallingCircle();  //  Local Variables
  gameFinished();  //  Local variables

  //Laser
  if (fire == true)  //  If the fire is equal to true.    
  explodedCircle(mouseX);  //  The circle will explode.   
  fire = false;
}
 
  void FallingCircle() {
  stroke(0);  //  Black outline
  fill(#FEFF00);  //  Yellow circles  
  for (int i=0; i<8; i++)  // When a circle is destroyed it will increment it back up to 8.  
  ellipse(xCoordinates[i], yCoordinates[i]++, circleDiam, circleDiam);  //  This is the coordinates to where the circles will be if more is needed and diameter.    
}

  void explodedCircle(int destroyed) {
  boolean hit = false;  
  for(int i=0; i<8; i++){  //  When a circle is destroyed it will increment it back up to 8.
  
     
  if((destroyed >= (xCoordinates[i]-circleDiam)) && destroyed <= (xCoordinates[i]+circleDiam)){  //  If the the circles are destroyed another bigger circle will go over the existing circle. 
  hit = true;  //  when the laser hits a target it changes to true. 
  points++;  //  This adds points to the game if successfully hit 
  stroke(0);  //  Black outline
  fill(#F7231B);  //  Red circle when destroyed
  line(pmouseX, pmouseY-70, mouseX, yCoordinates[i]);  //  This creates a line when you fire from the top of the robots head
  ellipse(xCoordinates[i], yCoordinates[i], circleDiam, circleDiam);  //  This creates another circle around the targeted circle.  
  xCoordinates[i] = randomx();  //  This is the coordinates for the circles on the x axis which are random.
  yCoordinates[i] = 0;  //  This is the coordinates for the circles on the y axis which are at the very top of the screen. 
 }
}
  //  Misshit
  if (hit == false) { 
  line(mouseX, mouseY-70, mouseX, 0);  //  If the hit is false it will fire a straight laser to the other end of the screen from the top of the robots head. 
  }
}
  //  Mouse control
  void mousePressed() {
  fire = true;  //  When the mouse is pressed it fires a laser. 
}

  void gameFinished() {
  for (int i=0; i<8; i++) {  //  When a circle is destroyed it will increment it back up to 8.     
  if (yCoordinates[i] == 785) {  //  This tells the game when a ball is at the bottom of the screen so it can announce game over. 
  stroke(0);  //  Black outline
  background(0);  //  Black background
  textAlign(CENTER);  //  the text is set to the centre of the screen. 
  stroke(0);  //  Black outline.
  text("GAME OVER LOSER!!!", 400,400);  //  This is the text and its location which is shown at the end of the game.
  text("Points:" + points, 60, 60);  //  This shows the number of points a the end of the game and its location. 
  noLoop();  //  Didn't set a loop  
  }
 }
}





