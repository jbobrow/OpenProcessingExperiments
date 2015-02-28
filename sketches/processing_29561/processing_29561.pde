
// Processing bods 3rd attempt, by Karl Sadler. This adds interactive body shape mapped to
// mouses horizontal position.

void setup() {
  size(600,250);
  smooth();
}

void draw() {
  background(#FFEB05);
  fill(202); // grey floor
  noStroke();
  rect(0,200, width, height);
  
  bod(100,200); // bod in function
}

void bod(int x, int y) { //set up bod as a function so I can create multiple bods later on.
  
  float l = map(mouseX, 0, width, -10,-150); // creates variable with constrains to ctrl height
  
  pushMatrix();
  translate(x, y);         //alter position
  scale(1); 

  stroke(0);
  strokeWeight(4);         //legs
  line(-5, 0, -5, 15);     //left leg
  line(5, 0, 5, 15);       //right leg

  strokeWeight(36);        //black outline
  line(0, -10, 0, l);

  strokeWeight(30);        // main body colour
  stroke(22,200,247);      // swap this colour
  line(0, -10, 0, l);

  fill(0);                 //eyes
  noStroke();
  ellipse(8, l, 4, 4);     // right eye
  ellipse(0, l, 4, 4);     //left eye
  
  popMatrix();
}


