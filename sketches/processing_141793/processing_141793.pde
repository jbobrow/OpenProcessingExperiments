
void setup() {
  size(500, 500);
  background(0);
  
}
void draw() {
  fill(0, 0, 0, 5);
 pushMatrix();
  
  translate(height/2, width/2);
  noFill();
  rotate(millis()/350.0);
  stroke(255, 255, 255, 1);
  rectMode(CENTER);
  rect(0, 0, 35, 35);
  
  translate(45, 30);
  noFill();
  rotate(millis()/100.0);
  stroke(60, 220, 140, 10);
  rectMode(CENTER);
  rect(0, 0, 20, 15);

popMatrix();
resetMatrix();

pushMatrix();
  
  translate(width/2, 100);
  rotate(millis()/500.0);
  noFill();
  stroke(155, 155, 155, 5);
  triangle(0, 0, 0, 30, 30, 15);
 
 popMatrix();
resetMatrix();
  
pushMatrix();  
  
  translate(width/2, 400);
  rotate(millis()/500.0);
  noFill();
  stroke(155, 155, 155, 5);
  triangle(0, 0, 0, 30, 30, 15);

popMatrix();
resetMatrix();

pushMatrix();  
  
  translate(100, height/2);
  rotate(millis()/500.0);
  noFill();
  stroke(155, 155, 155, 5);
  triangle(0, 0, 0, 30, 30, 15);

popMatrix();
resetMatrix();

pushMatrix();  
  
  translate(400, height/2);
  rotate(millis()/500.0);
  noFill();
  stroke(155, 155, 155, 5);
  triangle(0, 0, 0, 30, 30, 15);

popMatrix();
resetMatrix();

pushMatrix();  
  
  translate(100, 100);
  rotate(millis()/250.0);
  noFill();
  stroke(75, 75, 75, 5);
  rectMode(CENTER);
  rect(0, 0, 35, 35, 10);
  
   translate(35, 15);
  noFill();
  rotate(millis()/100.0);
  stroke(60, 220, 140, 10);
  triangle(0, 0, 0, 20, 15, 15);

popMatrix();
resetMatrix();

pushMatrix();  
  
  translate(400, 100);
  rotate(millis()/250.0);
  noFill();
  stroke(75, 75, 75, 5);
  rectMode(CENTER);
  rect(0, 0, 35, 35, 10);
  
   translate(35, 15);
  noFill();
  rotate(millis()/100.0);
  stroke(60, 220, 140, 10);
  triangle(0, 0, 0, 20, 15, 15);

popMatrix();
resetMatrix();

pushMatrix();  
  
  translate(100, 400);
  rotate(millis()/250.0);
  noFill();
  stroke(75, 75, 75, 5);
  rectMode(CENTER);
  rect(0, 0, 35, 35, 10);
  
   translate(35, 15);
  noFill();
  rotate(millis()/100.0);
  stroke(60, 220, 140, 10);
  triangle(0, 0, 0, 20, 15, 15);

popMatrix();
resetMatrix();

pushMatrix();  
  
  translate(400, 400);
  rotate(millis()/250.0);
  noFill();
  stroke(75, 75, 75, 5);
  rectMode(CENTER);
  rect(0, 0, 35, 35, 10);
  
   translate(35, 15);
  noFill();
  rotate(millis()/100.0);
  stroke(60, 220, 140, 10);
  triangle(0, 0, 0, 20, 15, 15);

popMatrix();
resetMatrix();

pushMatrix();  
  
  translate(width/2, height/2);
  rotate(millis()/100.0);
  noFill();
  stroke(255, 255, 255, 10);
  line(0, 0, 100, 50);

popMatrix();
resetMatrix();
 
}
