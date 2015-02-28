
 void setup ()
{
  background(255);
  size(500, 500);
}
 
void draw ()
{
  stroke(100, 100, random(200),80);
//  fill(255, 255, 255, 50);
  noFill();
  pushMatrix();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  rotate(millis()/700.0);
  rect(0, 0, 100, 100);
  rotate(4);
  rect(0, 0, 142, 142);
  rotate(millis()/-700.0);
  rect(30, 30, 20, 20);
  rotate(millis()/-1000.0);
  rect(0, 0, 201, 201);
  rotate(millis()/-7000.0);
  rect(0, 0, 201, 201);
  rect(0, 0, 284, 284);
  rotate(millis()/700.0);
  rect(0, 0, 284, 284);
  rotate(millis()/700.0);
  rect(0, 0, 402, 402);
  rotate(millis()/700.0);
  rect(1, 20, 402, 402);
  popMatrix();
  resetMatrix();

}
void mousePressed() {
  noLoop(); 
   rectMode(CENTER);
  translate(0,0);
  fill(255);
  noStroke();
  rect(0,0,1000,1000);
}
void mouseReleased() {
  loop();
}

