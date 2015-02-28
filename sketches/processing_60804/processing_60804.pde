
void setup() {
  size(500, 500);
  smooth();
}


void draw() { 
  background(0);

  translate(width/2, height/2);   // Move coordinate system to center of sketch
  scale(0.5);
  
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 80, 80);

  pushMatrix();
  rotate(millis() * 0.001 * TWO_PI / 50.0);   
  translate(180, 0); // Move away from the center

  ellipse(0, 0, 40, 40);


  pushMatrix();
    rotate((millis() * 0.001 * TWO_PI / 10.0) * -1);    // One revolution every second
    translate(50, 0); // Move away from the center

    ellipse(0, 0, 10, 10);
  popMatrix();

  pushMatrix();
    rotate((millis() * 0.001 * TWO_PI / 10.0) );    // One revolution every second
    translate(70, 0); // Move away from the center

    ellipse(0, 0, 6, 6);
  popMatrix();
  popMatrix();
  
    pushMatrix();
  rotate((millis() * 0.001 * TWO_PI / 80.0) * -1);   
  translate(380, 0); // Move away from the center

  ellipse(0, 0, 20, 20);


  pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 5.0);    // One revolution every second
    translate(50, 0); // Move away from the center

    ellipse(0, 0, 10, 10);
  popMatrix();
  popMatrix();

  
  
}


