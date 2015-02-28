
//Gil Gerstel
//July 8th 2013
// basic drawing app 
// References: Sample code from Digital Media Academy

void setup () {
  //frameRate(12); change frame rate to demo update speed 
  size (400, 400); // set background size to 400 by 400 pixels
  strokeWeight(10); // set stroke weight to 3
}

void draw() {
   background(255,54,242); // set background color to white
  if (mousePressed == true)
  line (pmouseX, pmouseY, mouseX, mouseY);  // draw a circle at mouse location

  // code that prints out the values of mouseX and mouseY to the console.
  println("mouseX: " + mouseX + " , mouseY: " + mouseY);
}
