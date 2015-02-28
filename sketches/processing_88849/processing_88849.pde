


void setup() {
  size (450, 550);
  frameRate(3); //the lower the number the slower the changes.
}


void draw() {
  background (60, 80, 200);
  strokeWeight(random(5, 30)); //the stroke weight varies between 5 & 29 pixels
  ellipse (width/2, height/2, 200,200);
  
}



