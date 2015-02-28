
// basic drawing app 
//Alex Chow
//7/8/13

void setup () {
  //frameRate(12); change frame rate to demo update speed 
  background(0); // set background color to white
  size (400, 400); // set background size to 400 by 400 pixels
  strokeWeight(3); // set stroke weight to 3
  stroke(255);
}

void draw() {
  background(240);
  if (mousePressed == true);
  line(pmouseX, pmouseY, mouseX, mouseY);  // draw a circle at mouse location

  // code that prints out the values of mouseX and mouseY to the console.
  println("mouseX: " + mouseX + " , mouseY: " + mouseY);
}
