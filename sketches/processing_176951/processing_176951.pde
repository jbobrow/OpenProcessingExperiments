
/* Project 3
I draw the balloon for the very first assignment, and I wanted to 
improve it ever since. Project3 provided a great opportunity to
create something interactive with it. 
On the opening screen, you'll see the black and white view of 
Paris (photo taken by me) with my balloon flying over the 
rooftops. 
You can move the balloon anywhere on the canvas by dragging it 
with the mouse. 
Use the keyboard to add some elements: press 'm' or 'M' to 
multiply the balloons, 't'/'T' to add a postcard text, 
'b'/'B' to add birds, or 'a'/'A' to add all. 
Press 's'/'S' to play a sound (a portion of 'La vie en rose' by 
Louis Armstrong).
Press 'o'/'O' to set the balloon back to its original place. 
The order is very important, for making the balloon move like 
this was tricky.   
Save a screenshot with 'p'/'P'. 
*/

//Importing minim
import ddf.minim.*;

//Variables, image, music
Minim minim;
AudioSample sound;
PImage background;
PFont lucida;
float x=500;
float y=300;

//Setup
void setup () {
  size (1000, 720); 
  minim = new Minim (this);
  sound = minim.loadSample ("music.mp3");
  lucida = loadFont ("Lucida.vlw");
  background = loadImage ("background3.jpg");
}

//Draw
void draw () {
  
  //Background
  image (background, 0, 0);
  
  //Balloon
  stroke (#EA3434);
  fill (#EA3434);
  ellipse (x, y, 130, 130);
  stroke (#FFFFFF);
  fill (#FFFFFF);
  ellipse (x, y, 110, 130);
  stroke (#EA3434);
  fill (#EA3434);
  ellipse (x, y, 85, 130);
  stroke (#FFFFFF);
  fill (#FFFFFF);
  ellipse (x, y, 55, 130);
  stroke (#EA3434);
  fill (#EA3434);
  ellipse (x, y, 20, 130);
  stroke (#3B1103);
  fill (#3B1103);
  rect (x-25, y+90, 50, 40);
  line (x-40, y+50, x-25, y+90);
  line (x+40, y+50, x+25, y+90);
  ellipse (x, y+130, 50, 10);
  fill (#935632);
  ellipse (x, y+90, 50, 10);
  stroke (#937D32);
  fill (#937D32);
  line (x-15, y+95, x-15, y+110);
  triangle (x-18, y+105, x-12, y+105, x-15, y+115); 
  ellipse (x-15, y+120, 13, 18);
  
  //Keyboard input
  //Birds 
  if (key == 'b' || key == 'B') { 
    noFill ();
    stroke (#030303);
    strokeWeight (1.25);
    arc (80, 50, 10, 5, 3.14, 6.28);
    arc (90, 50, 10, 5, 3.14, 6.28);
    strokeWeight (1.75);
    arc (100, 100, 10, 6, 3.14, 6.28);
    arc (110, 100, 10, 8, 3.14, 6.28);
    strokeWeight (1.5);
    arc (60, 80, 10, 5, 3.14, 6.28);
    arc (68, 80, 10, 7, 3.14, 6.28);
  } 
  
 //Postcard text: Greetings from Paris
  if (key == 't' || key == 'T') {    
    textAlign (CENTER);
    textFont (lucida);
    fill (#000000);
    text ("Greetings from Paris", width/2+2, 102);
    fill (#FFFFFF);
    text ("Greetings from Paris", width/2, 100);
  }   
  
  //Multiply balloon
  if (key == 'm' || key == 'M') {
    //1
    scale (0.5);
    translate (1000, 400);
    stroke (#3B8301);
    fill (#3B8301);
    ellipse (500, 200, 130, 130);
    stroke (#FFE203);
    fill (#FFE203);
    ellipse (500, 200, 110, 130);
    stroke (#3B8301);
    fill (#3B8301);
    ellipse (500, 200, 85, 130);
    stroke (#FFE203);
    fill (#FFE203);
    ellipse (500, 200, 55, 130);
    stroke (#3B8301);
    fill (#3B8301);
    ellipse (500, 200, 20, 130);
    stroke (#3B1103);
    fill (#3B1103);
    rect (500-25, 200+90, 50, 40);
    line (500-40, 200+50, 500-25, 200+90);
    line (500+40, 200+50, 500+25, 200+90);
    ellipse (500, 200+130, 50, 10);
    fill (#935632);
    ellipse (500, 200+90, 50, 10);
    stroke (#937D32);
    fill (#937D32);
    line (500-15, 200+95, 500-15, 200+110);
    triangle (500-18, 200+105, 500-12, 200+105, 500-15, 200+115); 
    ellipse (500-15, 200+120, 13, 18);
    
    //2
    scale (0.75);
    translate (600, -500);
    stroke (#00308E);
    fill (#00308E);
    ellipse (500, 200, 130, 130);
    stroke (#FFFFFF);
    fill (#FFFFFF);
    ellipse (500, 200, 110, 130);
    stroke (#00308E);
    fill (#00308E);
    ellipse (500, 200, 85, 130);
    stroke (#FFFFFF);
    fill (#FFFFFF);
    ellipse (500, 200, 55, 130);
    stroke (#00308E);
    fill (#00308E);
    ellipse (500, 200, 20, 130);
    stroke (#3B1103);
    fill (#3B1103);
    rect (500-25, 200+90, 50, 40);
    line (500-40, 200+50, 500-25, 200+90);
    line (500+40, 200+50, 500+25, 200+90);
    ellipse (500, 200+130, 50, 10);
    fill (#935632);
    ellipse (500, 200+90, 50, 10);
    stroke (#937D32);
    fill (#937D32);
    line (500-15, 200+95, 500-15, 200+110);
    triangle (500-18, 200+105, 500-12, 200+105, 500-15, 200+115); 
    ellipse (500-15, 200+120, 13, 18);
  }
  
  if (key == 'a' || key == 'A') { 
    //Birds
    noFill ();
    stroke (#030303);
    strokeWeight (1.25);
    arc (80, 50, 10, 5, 3.14, 6.28);
    arc (90, 50, 10, 5, 3.14, 6.28);
    strokeWeight (1.75);
    arc (100, 100, 10, 6, 3.14, 6.28);
    arc (110, 100, 10, 8, 3.14, 6.28);
    strokeWeight (1.5);
    arc (60, 80, 10, 5, 3.14, 6.28);
    arc (68, 80, 10, 7, 3.14, 6.28);
 
    //Greetings from Paris
    textAlign (CENTER);
    textFont (lucida);
    fill (#000000);
    text ("Greetings from Paris", width/2+2, 102);
    fill (#FFFFFF);
    text ("Greetings from Paris", width/2, 100);
  
    //Multiply balloon
    //1
    scale (0.5);
    translate (1000, 400);
    stroke (#3B8301);
    fill (#3B8301);
    ellipse (500, 200, 130, 130);
    stroke (#FFE203);
    fill (#FFE203);
    ellipse (500, 200, 110, 130);
    stroke (#3B8301);
    fill (#3B8301);
    ellipse (500, 200, 85, 130);
    stroke (#FFE203);
    fill (#FFE203);
    ellipse (500, 200, 55, 130);
    stroke (#3B8301);
    fill (#3B8301);
    ellipse (500, 200, 20, 130);
    stroke (#3B1103);
    fill (#3B1103);
    rect (500-25, 200+90, 50, 40);
    line (500-40, 200+50, 500-25, 200+90);
    line (500+40, 200+50, 500+25, 200+90);
    ellipse (500, 200+130, 50, 10);
    fill (#935632);
    ellipse (500, 200+90, 50, 10);
    stroke (#937D32);
    fill (#937D32);
    line (500-15, 200+95, 500-15, 200+110);
    triangle (500-18, 200+105, 500-12, 200+105, 500-15, 200+115); 
    ellipse (500-15, 200+120, 13, 18);
    
    //2
    scale (0.75);
    translate (600, -500);
    stroke (#00308E);
    fill (#00308E);
    ellipse (500, 200, 130, 130);
    stroke (#FFFFFF);
    fill (#FFFFFF);
    ellipse (500, 200, 110, 130);
    stroke (#00308E);
    fill (#00308E);
    ellipse (500, 200, 85, 130);
    stroke (#FFFFFF);
    fill (#FFFFFF);
    ellipse (500, 200, 55, 130);
    stroke (#00308E);
    fill (#00308E);
    ellipse (500, 200, 20, 130);
    stroke (#3B1103);
    fill (#3B1103);
    rect (500-25, 200+90, 50, 40);
    line (500-40, 200+50, 500-25, 200+90);
    line (500+40, 200+50, 500+25, 200+90);
    ellipse (500, 200+130, 50, 10);
    fill (#935632);
    ellipse (500, 200+90, 50, 10);
    stroke (#937D32);
    fill (#937D32);
    line (500-15, 200+95, 500-15, 200+110);
    triangle (500-18, 200+105, 500-12, 200+105, 500-15, 200+115); 
    ellipse (500-15, 200+120, 13, 18);
  }
}

//Mouse input: Dragging the balloon
void mouseDragged () {
    x = mouseX;
    y = mouseY;
 }

//Other keyboard input
void keyPressed () {
  //Screenshot
  if (key == 'p' || key == 'P') saveFrame ("pic_###.png");
  
  //Setting back the balloon to its original point
  if (key == 'o' || key == 'O') {
    x = 500;
    y = 300;
  }
   
  //Palying music
  if (key == 's' || key == 'S') sound.trigger ();
}

