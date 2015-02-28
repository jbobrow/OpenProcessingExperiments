
/* With this assignment I have modified the lecture parameters to
my own needs. I have increased the keys from 3 to 6 keys colors, 
makes for a more colourful experience and expression.
I have increased the speed at which the the lines draw, 
esp on KEY 6.

*/

/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag : draw

KEYS
1-6 ; stroke color
del, backspace : erase
s : save png

*/


//Global Variables
color strokeColor = color (3,13);

//setup
void setup () {
  size (600, 520);
  colorMode (HSB, 360, 100, 100, 100);
  noFill ();
  background(360);
  
  
}

//draw
void draw () {
  
if (mousePressed) {

    pushMatrix ();
    translate (width/2, height/2);
    //map (value, start1, stop1, start2, stop2);
    int circleResolution = (int) map (mouseY+20, 2, height, 2, 16);
    float radius = mouseX-width/2 + 15;
    float angle = TWO_PI/circleResolution;
    
    
    //style
    strokeWeight (2);
    stroke (strokeColor);
    
    beginShape ();
    for (int i=-1; i<=circleResolution; i++) {
       float x = 0 + cos(angle*i) * radius;
       float y = 0 + sin(angle*i) * radius;
       vertex (x, y);
    }
    endShape ();
    popMatrix ();
    
}
}

//keyPressed ()

void keyReleased () {
 if (key == DELETE || key == BACKSPACE) background (360);
 if (key == 's' || key == 'S') saveFrame ("screenshot.png");
 
 switch (key) {
  case '1':
     strokeColor = color (0, 10);
     break; 
  case '2':
     strokeColor = color (192, 100, 64, 15);
     break; 
  case '3':
     strokeColor = color (52, 100, 71, 15);
     break; 
   case '4':
     strokeColor = color (20, 100, 100, 15);
      break; 
   case '5':
     strokeColor = color (280, 69, 69, 15);
      break; 
   case '6':
     strokeColor = color (120, 80, 90, 15);
 }
  
}


