
void setup(){
  size(400, 400);
  background(255);
  smooth();
  frameRate(10);
}

void draw() {
  float corner = random(200);
  noFill();
  rect(random(400), random(400), corner, corner);
  strokeWeight(2);
  stroke(random(255), random(255), random(255));

}

void mousePressed () 
{ 
  background(255);  
  redraw();    
}

