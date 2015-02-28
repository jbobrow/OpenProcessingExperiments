
/*
 *This notebook app was created by Connie Yu and Jordan Wong
 *This program is named Project Alpha
 *This program is used to write notes and doodle.
 *Press the left mouse button to start drawing on the on-screen notepad.
 *To erase your drawing, press any letter on the keyboard.
 *January 27, 2012
 */

float lineX=0;
float lineY=55;

float lineA=45;

void setup() {
  size (320, 480);  // QVGA screen
  background(245); // White
  println("Draw on-screen by clicking and dragging mouse");
  println("Press any key to erase drawing");
}

void draw() {
  smooth();

  PImage b;
  b = loadImage("pencil2.gif");  // Pencil Image Upload
  image(b, 1, 1);      // Staring point of drawing - Pencil Image

  if (mouseX < 320) {            
    cursor(b, 1, 1);       // Starting point of drawing - Mouse Cursor
  } 

  stroke(0);
  strokeWeight(2);
  line(lineX, lineY, lineX+320, lineY);          //line one
  line(lineX, lineY+30, lineX+320, lineY+30);    //line two
  line(lineX, lineY+60, lineX+320, lineY+60);    //line three
  line(lineX, lineY+90, lineX+320, lineY+90);    //line four
  line(lineX, lineY+120, lineX+320, lineY+120);  //line five
  line(lineX, lineY+150, lineX+320, lineY+150);  //line six
  line(lineX, lineY+180, lineX+320, lineY+180);  //line seven
  line(lineX, lineY+210, lineX+320, lineY+210);  //line eight
  line(lineX, lineY+240, lineX+320, lineY+240);  //line nine
  line(lineX, lineY+270, lineX+320, lineY+270);  //line ten
  line(lineX, lineY+300, lineX+320, lineY+300);  //line eleven
  line(lineX, lineY+330, lineX+320, lineY+330);  //line twelve
  line(lineX, lineY+360, lineX+320, lineY+360);  //line thirteen
  line(lineX, lineY+390, lineX+320, lineY+390);  //line fourteen

  stroke(255, 70, 70);        // Stroke color of pencil
  strokeWeight(1);
  line(lineA, 0, lineA, 480);
  line(lineA+3, 0, lineA+3, 480);

  stroke(0);
  strokeWeight(2);
  ellipseMode(CENTER);        // First hole punch
  ellipse(25, 70, 25, 25);    
  ellipseMode(CORNER);        
  fill(240);

  ellipseMode(CENTER);        // Second hole punch
  ellipse(25, 250, 25, 25);
  ellipseMode(CORNER);
  fill(255);

  ellipseMode(CENTER);        // Third hole punch
  ellipse(25, 430, 25, 25);
  ellipseMode(CORNER);
  fill(255);

  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);  // Click left-mouse button activation
  }
}

void keyPressed() {
  println ("The key pressed was: " +key);

  background(245); // White
  smooth();

  stroke(255, 70, 70);
  strokeWeight(1);                // Contour thickness of Pencil
  line(lineA, 0, lineA, 480);
  line(lineA+3, 0, lineA+3, 480);
}


