
int diam = 10;                                           // create variable
void setup() {
  size(600, 600);
  frameRate(35);                                         // set repeat rate
  smooth();
  background(125);
}
void draw() {
  stroke(0);
  strokeWeight(1);
  fill(random(255), random(255), random(255), 25);       // select random colour + low transparency
  if (mousePressed==true) {                              // draw shape when mouse pressed
    ellipse(mouseX, mouseY, diam, diam);                 // create shape around mouse placement of variable diameter

    diam+=10;                                            // add 10 to diameter each frame while mouse pressed
  }
  else {
    diam=10;                                             // reset diameter to 10 when mouse released
  }
}



