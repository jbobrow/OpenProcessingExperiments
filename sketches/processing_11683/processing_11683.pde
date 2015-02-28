
// Experiment_01_City_Trails_Exercise

void setup() {
  size(450,400);
  background(0);
  smooth();
}

void draw() {

  // Body
  stroke(0);
  fill(160,218,255);
  rectMode(CENTER);
  
  ellipse(mouseX,mouseY,8,8);   
  rect(0, 330, 80, 200);
  rect(100, 400, 40, 300);
  rect(150, 400, 40, 200);
  rect(200, 400, 40, 200);
  rect(300, 400, 40, 300);
  rect(350, 400, 40, 150);
  ellipse(400, 400, 40, 370);
  smooth();
}
// Albert Cordero

