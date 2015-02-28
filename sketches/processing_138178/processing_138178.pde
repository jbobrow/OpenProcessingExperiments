
//assignment 3
/*
We would like to create some drawing initially on a blank canvas 
of 1000 by  720 in size. The drawing will only start when 
the mouse is pressed. The length of the drawing will change as
we moved along the x axis and the thickness and the number of 
lines of the polygon will change as we moved along the y axis.
The polygon will re-draw itself multiple times as we drag 
the mouse.
*/

/*
mouse

position x:     lenght
               

Keys

4-6:            stroke colors
del, backspace: erase
s:              save
*/

//global variables

PImage beatles;
color strokeColor = color (0,10);

//setup

void setup() {
  
  size(1000,720);
  beatles = loadImage("beatles.jpg");
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
//set background to white by insing HSB code
  background(360);
  
} 


//draw

void draw() {
  
//importing the image to the canvas

 image (beatles, width/3, height/3);
  
//let the mousePressed dictate the drawing  
if(mousePressed) {
  pushMatrix();
//position the redrawing from the center of the canvas
  translate(width/2, height/2);
  
//map

// Defining  the circles' resolution, radius and angles
//as defined by the mapping
  int circleResolution = (int)map(mouseY+100, 0,  height, 1, 8);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
//style

strokeWeight(3);
stroke(strokeColor);

// making the polygon
beginShape();

  for (int n = 0; n<=circleResolution; n++) {
    float x = 0 + cos(angle * n) * radius;
    float y = 0 + sin(angle * n) * radius; 
    vertex(x, y);   
    
  }
 endShape();
 popMatrix();
}
}

//keyPressed

void keyReleased () {
  
// change the backgrond to white when delete or the
//backspace is pressed. Aslso save the drawing in screenshot1 when
// s or S is pressed
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot1.png");
  
  switch(key) {
    case '4':
      strokeColor = color(0, 10);
      break;
    case '5':
      strokeColor = color(52, 100, 71, 20);
      break;
    case '6':
      strokeColor = color(192, 100, 64, 20);
      break;
    
    
  }
  
  
}
  
  
  
  
  
  


