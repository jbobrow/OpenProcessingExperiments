
void setup() {
  
  size(500, 500);
  frameRate(2);
}

void draw() {

  background(220);
  noFill();
  stroke(139, 149, 141);
  strokeWeight(1);
  rect(50, 50, width-100, height-100);
  
  float h = random(100, 400);
  line(90, h, width-90, h);
  ellipseMode(CENTER);
  ellipse(random(90, 410), h, 20, 20);
  ellipse(random(90, 410), h, 75, 75);
  ellipse(random(90, 410), h, 35, 35);
  ellipse(random(90, 410), h, 35, 35);
}

void keyPressed() {
 
  saveFrame ("objekt-####.png");
  println (frameCount);   
}


