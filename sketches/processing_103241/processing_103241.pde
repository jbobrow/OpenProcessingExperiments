
//Sophia Hussain    
//  7/8/13
// Mouse Draw Game:basic drawing app 

void setup () {
  background(0); // set background color to black
  size (400, 400); // set background size to 400 by 400 pixels
  strokeWeight(3); // set stroke weight to 3
  stroke(255);
}

void draw() {
  if (mousePressed == true) 
    line (pmouseX, pmouseY, mouseX, mouseY);  // draw a point at mouse location

  // code that prints out the values of mouseX and mouseY to the console.
  println("mouseX: " + mouseX + " , mouseY: " + mouseY);
}
