
// snow on the mountains

var counter;

void setup() {
  width = 640;
  height = 480; 
}

void draw() {
  background(25);
  rectMode(CENTER);
  colorMode(HSB, 100, 100, 100, 100);
  noStroke();
  for(int i=0; i<19; i++) {
      pushMatrix();
      // rotate(noise(counter,i)*map(mouseX, 0, width, -0.25*i, 0.25*i));
        translate(width/2, height/2);
      pushMatrix();
        rotate(-counter*i*0.001);
      fill(i, 80, 100, 50);
      rect(0, 0, width/i, width/i);
      popMatrix();
      popMatrix();
  }

  stroke(100);
  strokeWeight(1);
  noFill();
  var triangleRadius = 200;
  pushMatrix();
    translate(width/2, height/2);
  pushMatrix()
    rotate(counter*0.01); 
  triangle(0, 0-triangleRadius, 0-triangleRadius, 0+triangleRadius/2, 0+triangleRadius, 0+triangleRadius/2);
    rotate(counter*0.011); 
  triangle(0, 0-triangleRadius, 0-triangleRadius, 0+triangleRadius/2, 0+triangleRadius, 0+triangleRadius/2);
  rotate(counter*0.012); 
  triangle(0, 0-triangleRadius, 0-triangleRadius, 0+triangleRadius/2, 0+triangleRadius, 0+triangleRadius/2);
  popMatrix();
popMatrix();
  counter++;
}
