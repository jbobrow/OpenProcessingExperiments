
import netscape.javascript.*;


  float r;  //  Red varible
  float g;  //  Green variable
  float b;  //  Blue variable
  
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
  text(s, pmouseX+9,pmouseY+43, 50, 50);  // Thev text box follows the x and y location of the mouse
  
}

  void mousePressed() {
  if (mouseButton == CENTER) {  //  If the middle mouse button is pressed, “To change the tongue back to normal either click the left or right mouse button
}
} 





