
void setup() {
  size(900,900);
  background(random(255),random(255),random(255), random(255));
}

void draw() {
  noStroke();
  fill(random(255),random(255),random(255),random(255));
  stroke(0);
  rect(random(900),random(900),random(900),random(900));

  noStroke();
  fill(0, random(255),255);
  ellipse(200,200,50,50);

  noStroke();
  fill(random(255),random(255),random(255),random(255));
  triangle(random(900),random(900),random(900),random(900),random(900),random(900));
  
  noStroke();
  fill(0, random(255),255);
  ellipse(random(700),random(800),random(255),random(255));
}  

