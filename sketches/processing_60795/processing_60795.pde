

  void setup() {
  size(500, 500);
  background(0);
  smooth();
 
}

void draw() {
  background(0);
  
  //center star
  translate(width/2, height/2);
  rotate( millis() * 0.001 * TWO_PI / 10);
  fill(255,255,0);
  ellipse(0, 0, 50, 50);
  
  //1 star
  pushMatrix();
  rotate( millis() * 0.02 * TWO_PI / 5);
  fill(0, 255, 200);
  ellipse(30, 30, 20, 20);
  popMatrix();
  
  // 3 star
  translate(100, 100);
  rotate( millis() * 0.0002 * TWO_PI);
  fill(0,255,0);
  ellipse(0, 0, 40, 40);
  
  // 4 star 
  rotate( millis() * 0.001 * TWO_PI /5);
  fill(0, 0, 255);
  ellipse(30, 30, 20, 20); 
}

