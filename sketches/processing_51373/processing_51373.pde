
  // PS1: Problem 1
  // Ryanne Hollies
  
  //emotion: surprise
  
void setup() {
 size(900, 800);
  smooth();
  
}

void draw() {
  
  //head
  background(0);
  fill(240, 200, 180);
  ellipse(width/2, height/2, 700, 700);
  
// left eye
  fill(0);
  stroke(255);
  strokeWeight(40);
  ellipse(300, height/3, 90, 120);


// right eye
  fill(0);
  stroke(255);
  strokeWeight(40);
  ellipse(550, height/3, 140, 250);
  
  //mouth
  fill(0);
  noStroke();
  ellipse(430, 600, 400, 280);
  
  //nose
  fill(240, 180, 145);
  noStroke();
  ellipse(width/2, 420, 80, 60);

}

