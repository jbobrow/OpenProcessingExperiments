

void setup() { 

  size( 854, 480);  // Size of the Window 
  smooth(); // Draws all Drawings with smooth (anti-aliased) edges
  frameRate(1); // Specifies the number of frames to be displayed every second
} 

void draw() { 
background (255); // background of the drawings
axe(width/2, height/2, ceil(random(70, 200)), 80*floor(random (0, 2)), ceil(random(1, 8))); // draws the X for the face
nose(width/2, height/2-50, ceil(random(20, 100)), ceil(random(20, 100)), ceil(random(1, 8))); // The nose for the face
oh(width/2, height/2-100-ceil(random(20, 50)), ceil(random(20, 100)), ceil(random(20, 80)), ceil(random(50, 80)), ceil(random(1, 8)));  // the suprised face
} 

void axe( float x, float y, float w, float h, float weight ) {  // code for the lines and translating them to where they are suppose to be

pushMatrix(); 
translate(x, y); 
strokeWeight(weight); 
line(0-w, 0, w, h); 
line(0-w, h, w, 0); 
popMatrix(); 
} 

void nose (float x, float y, float b, float c, float weight) { // the code for the nose part 

pushMatrix(); 
pushStyle(); 
noFill(); 
strokeWeight(weight); 
ellipseMode(CENTER); 
translate(x, y); // The x parameter specifies left/right translation
  
popMatrix(); //Pushes the current transformation matrix onto the matrix stack
popStyle();  //Pops the current transformation matrix off the matrix stack

} 

void oh( float x, float y, float b, float w, float h, float weight) { 

  pushMatrix(); //Pushes the current transformation matrix onto the matrix stack

  pushStyle(); // Start a new style

   noFill(); // no color 

  strokeWeight(weight); // how bold the lines are

  translate(x, y);  // translatig the x coordinates 

  ellipseMode(CENTER); // Set ellipseMode to CENTER 

  ellipse(-b, 0, w, h); // the blinky circles

  ellipse(b, 0, w, h); // the blinky circles

  popMatrix(); //Pushes the current transformation matrix onto the matrix stack

  popStyle(); //Pops the current transformation matrix off the matrix stack


}


