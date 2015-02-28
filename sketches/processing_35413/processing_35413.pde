
void setup () {
  size(300, 300);
  background(200);
  
  //creating interior walls 
  fill(245, 205, 94); 
  rect(0, 0, 40, 300);
  rect(260, 0, 40, 300);
  
  //another color for interior walls that run in perspective
  fill(245, 247, 117); 
  quad(40, 0, 40, 300, 80, 220, 80, 80); //perspective walls
  quad(260, 0, 260, 300, 220, 220, 220, 80);
}

 
void draw() {
  //controls the sky outside the arched doorway with the rise and set of the moon
  strokeWeight(1);
  stroke(0);
  fill(0, mouseY, 255);
  arc(150, 220, 100, 279, -PI, 0);

  //size and color of the moon, moves with the y-axis to mimic setting and rising
  fill(height, mouseY, height);
  noStroke();
  ellipse(150, mouseY, 18, 18); 

  // floor shape
  fill(255);
  quad(40, 300, 260, 300, 220, 220, 80, 220); 
  
  // barrel vaulted ceiling same as background and furthest wall
  strokeWeight(1);
  stroke(0);
  fill(200);
  quad(40, 0, 260, 0, 220, 80, 80, 80);
  arc(150, 80, 140, 100, -PI, 0); 

  //reflection on the floor moves with the mouseY
  noStroke();
  fill(height, mouseY, height);
  arc(150, 220, 100, mouseY, 0, PI); 
}


