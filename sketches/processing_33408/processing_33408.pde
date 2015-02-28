
void setup() {
  smooth();
  size(255, 255);
  //  frameRate(1);
}

void draw() {

  //making background color change with mouse position
  background(mouseX/2 + mouseY/2, 155, 155);
  //making fill color of ellipse change with mouse position as opposite color
  fill(255-(mouseX/2 + mouseY/2), 155, 155);

  println(mouseX + ", " + mouseY);



  //strokeWeight(2);
  //drawing a line from current pointer location to the last recorded pointer location
  line(mouseX, mouseY, pmouseX, pmouseY);

  //if mouse is pressed and the button being pressed is the left one, do this stuff
  if (mousePressed && mouseButton == LEFT) {
    //make yellow/orange if moving right
    if ((mouseX - pmouseX) > 0) {
      background(#ffaa00);
    }
    //make background white if not moving
    else if (mouseX - pmouseX == 0) {
      background(#ffffff);
    }
    //make background blue if moving to the left
    else {
      background(#009999);
    }
  }

  //prints an ellipse at the mouse position of mouseX width and mouseY height
  ellipse(mouseX, mouseY, width-mouseX, height-mouseY);
}

void mouseDragged() {
  strokeWeight(5);
}

void mouseReleased() {
   strokeWeight(2); 
}


