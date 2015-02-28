
 
 
float phi =  0; 
float amplitude = 100; 
float frequency = 1.0/302; 
int numPoints = 200; 
 
void setup() {
  size(800, 800);
  noFill();
  noCursor();
  strokeWeight(2);
  stroke (0);

}
 
 
void draw() {
  background(255,234,235);
  translate(0, height/2);
  float x = 0;
  float y = 0;
  float angle = width/numPoints;
  beginShape();
  for (int i = 0; i < numPoints; i++) {
         x = 3*(angle*i);
         y = sin(1000*(x*frequency+phi))* amplitude;
    vertex(x, y);
  }
  endShape();
    
  phi -= 5.9;
}


