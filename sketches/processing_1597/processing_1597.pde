
void setup(){
  size(400, 400);
  background(0);
  smooth();
  frameRate(10);
}

void draw() {
  //background(0);
  float horizontalTL = random(200);
  float verticalTR = random(201, 400);
  float horiztonalBL = random(201, 400);
  float verticalBR = random(200);
  
  stroke(random(255), random(255), random(255));
  strokeWeight(2);
  line(0, horizontalTL, 200, horizontalTL);
  line(verticalTR, 0, verticalTR, 200);
  line(400, horiztonalBL, 200, horiztonalBL);
  line(verticalBR, 400, verticalBR, 200);
}

void mousePressed() { 
  background(0);
  redraw();    
}



