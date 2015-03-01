
float phi =  0;
float amplitude = 2000;
float frequency = 1.0/302;
int numPoints = 200;
  
void setup() {
  size(800, 800);
  noFill();
  noCursor();;
 
}
  
  
void draw() {
  background(0);
  stroke(255);
  strokeWeight(3);
  translate(0, height/2);
  float x = 0;
  float y = 0;
  float angle = width/numPoints;
  beginShape();
  for (int i = 0; i < numPoints; i++) {
         x = 3*(angle*i);
         y = tan(1000*(x*frequency+phi))* (amplitude)*10;
    vertex(x, y);
  }
  endShape();
     
  phi -= 5.9;
}

