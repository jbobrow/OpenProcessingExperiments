
// Jason Xu
// 7/8/13
// MouseDraw.pde: Symmetrical shapes and color changes.

int counter;
void setup () {
  background(0); // set background color to black
  size (400, 400); // set background size to 400 by 400 pixels
  strokeWeight(5); // set stroke weight to 5
  stroke(255);
  counter = 0;
}

void draw() {
  if (mousePressed == true) {
    counter++;
    stroke(counter, counter+20, counter+50);
    if (counter > 200) {
      counter = mouseX;
    }
    line (pmouseX, pmouseY, mouseX, mouseY);  // draw a point at mouse location
    line(400-pmouseX, 400-pmouseY, 400-mouseX, 400-mouseY);
    line (pmouseY, pmouseX, mouseY, mouseX);
    line(400-pmouseY, 400-pmouseX, 400-mouseY, 400-mouseX);
    
  }
  // code that prints out the values of mouseX and mouseY to the console.
  //println("mouseX: " + mouseX + " , mouseY: " + mouseY);
  //println(counter);
}
