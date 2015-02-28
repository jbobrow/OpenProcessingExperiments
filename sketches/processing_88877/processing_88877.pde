
void setup() {

  size (600, 550);
  frameRate(2);

}

void draw() {

  background (#08080A);
  stroke(#FFD04D);
  strokeWeight(random(5, 28)); //the stroke weight varies between 5 & 29 pixels
  fill(#131293);
  rect (260, 120, 20,30);  
  rect (180,150, 180, 250);
  noFill();
  rect(180,155,180,20);
  

}
