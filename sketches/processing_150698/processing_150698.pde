

// setup function -- called once when the program begins
void setup() {
  
  size(500, 500);
  background(random(250));
  rectMode(RADIUS);
}
void draw() {
 //start drawing by pressing 'Q' and move the mouse around
  if (keyPressed == true && key == 'q') {
    // draw a rectangle with a small random variation in size
    stroke(255); // set the stroke colour to a light grey
    fill (random(255), random(255), random(255)); 
    rect(mouseX, mouseY, random(6), random(6));
  
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("drawing.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(#225202);//sets background color to green
  }
}
