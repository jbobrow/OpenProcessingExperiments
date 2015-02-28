
void setup() {
  size(320,480);
  smooth();
  background(255);
}
 
void draw() {
  float r = random(0,50);
  rectMode(CENTER);
  noStroke();
  //The faster the mouse moves, the larger the ellipse becomes. 
  //This can reflect the swiping motion on the iPhone. 
  //Increased speed is associated with increased volume.
  //The size of the ellipse can symbolise volume.
  float d = dist(pmouseX, pmouseY, mouseX, mouseY);
  //Different mouse co-ordinates are different colours.
  //The 'blending' of colours can represent the slow transition to different scales.
  //Quick movements with little blending of colours can represent quick chord changes.
  fill(mouseX, mouseY, 220);
 ellipse(pmouseX-10,pmouseY-20,(d * 4)+20, (d * 4)+20);
}

//Clicking the mouse clears the screen.  
void mousePressed() {
  background(255);
}



