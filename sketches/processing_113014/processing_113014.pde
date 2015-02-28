
void setup() {
  size(600, 600);
  smooth();
  noStroke();
}
 
void draw() {
  background(0);
  fill(255);
  rect(80, 200, 200, 200);

  ellipse(450, 300, 200, 200);
 
  if ( ( mouseX > 80) && ( mouseX < 280)) {
   fill(255);
    stroke(random(255),random(255),random(255));
    strokeWeight(10);   
    rect(80, 200, 200, 200);
        noStroke(); 
    ellipse(450, 300, 200, 200);
  }
  if ( ( mouseX > 350 ) && ( mouseX < 550 )) {
    rect(80, 200, 200, 200);
        fill(random(255),random(255),random(255));
    ellipse(450, 300, 100, 100);
  }
}



