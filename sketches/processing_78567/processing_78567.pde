
void setup() {
  size(500, 500);
  background(75);
  smooth();
}
void draw() {

  noStroke();
  fill(50);
  arc(width/2, height/2, 350, 350, 0, (TWO_PI*hour())/24);
  fill(75); 
  ellipse(width/2, height/2, 300, 300);
  fill(100);
  arc(width/2, height/2, 250, 250, 0, (TWO_PI*minute())/60);
  fill(75);
  ellipse(width/2, height/2, 200, 200);
  fill(150);
  arc(width/2, height/2, 150, 150, 0, (TWO_PI*second())/60);
  fill(75);
  ellipse(width/2, height/2, 100, 100);
}
