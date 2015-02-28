
void setup() {
  size(500,500);
  smooth();
  
}

void draw() {
  background(0);
  
  /* Stars */
  randomSeed(103);
  
  for (int i = 0; i < 100; i++) {
  float x = random(0, width);  
  float y = random(0, height);  
    
  ellipse(x, y, 5, 5);
      
  }

  /* Sun-Ellipse */
  ellipseMode(CENTER);
  translate(width/2,height/2);
  fill(255,200,20);
  noStroke();
  ellipse(0,0,60,60);
  
  /* Rotation */
  rotate(millis() * 0.001 * TWO_PI / 40.0);   // Move 360 degrees in ten second
  translate(100, 100); // Move away from the center
  rotate(millis() * 0.00001 * TWO_PI); 
     
  /* Ellipse */
  fill(100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 30);
     
  /* Ellipse2 */
  fill(180);
  noStroke();
  ellipseMode(CORNER);
  ellipse(20, 20, 20, 20);
  
}


