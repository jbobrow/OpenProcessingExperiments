
// TJ Bel

// This design is inspired by one of the examples from the Generative 
// Design textbook referenced in the lecture. (P_2_0_03)
// This design is a series of colorful polygons drawn in layers by 
// clicking or dragging the mouse. 
// I've used slightly transparent fill colors with contrasting bold, 
// thick strokes outlining the polygons. 
// By using keys 1, 2, & 3 you can draw with a wide range 
// of colors to create a unique color palette in your design. 

/*
DIRECTIONS:
Click & drag mouse on canvas to draw turquoise polygons with a dark gray 
  outline.

Press & release the '1' key to change fill to bright blue with 
  orange outline.
Press & release the '2' key to change fill to bright pink with green 
  outline.
Press & release the '3' key to change to a random fill color with yellow 
  outline.
Continue to press & release the '3' key to generate new random fill colors.

Press & release the 'delete' or 'backspace' keys to clear design and return to white background.
Press & release the 's' or 'S' keys to take a screenshot of your design.

*/

color strokeColor = color(0,10); //default stroke color
color fill = color(0,171,184); // default fill color

void setup() {
  size(800,720);
  colorMode(HSB,360,100,100,100); 
                                
  noFill();
  background(360);    //white background
                                
}

void keyReleased() {
  
  // clear screen & restore white background  
  if (key == DELETE || key == BACKSPACE) background(360);
  // save a screenshot picture
  if (key == 's' || key == 'S') saveFrame("screenshot.png"); 
  
  switch(key) {
    case '1':
      strokeColor = color(24,100, 100, 10);  
// change outline color to Bright Orange
      fill = color(229,100,100,10); 
// change fill color to Bright Blue
      break;
    case '2':
      strokeColor = color(129,81,80,10); 
// change outline color to Bright Green
      fill = color(340,97,100,10); 
// change fill color to Bright Pink
                                          
      break;
    case '3':
      strokeColor = color(56,93,100,10);  
// change outline color to Bright Yellow
      fill = color(random(width), random(height), random(100),10); 
// fill with a new random color each time key is released 
                                         
      break;                                          
  }
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    translate(width/2, height/2);
    int sides = (int)map(mouseY+100, 0,height,2,10);
    int radius = mouseX - width/2;
    float angle = TWO_PI / sides;
                                 
    strokeWeight(8);
    stroke(strokeColor);
    fill(fill);


    beginShape();
      for (int i=0; i <= sides; i++) {

        float x = .25 + radius*cos(angle*i);
        float y = .25 + radius*sin(angle*i);

        vertex(x,y);
      }
    endShape();
    popMatrix();
  }
}

