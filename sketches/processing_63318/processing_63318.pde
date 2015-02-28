
float x1;
float y1;
float x2;
float y2;
float randomStrokeWeight;
float r;
float g;
float b;
float ax;
 
void setup() {
  size(500,500);
  background(255);
  smooth();
}
 
void draw() {
  x1 = random(width);    
  y1 = random(height);   
  x2 = random(width);    
  y2 = random(height);  
   
  randomStrokeWeight = random(255);  
  strokeWeight(randomStrokeWeight); 
   
  r = random(0,2);     
  g = random(0,25);    
  b = random(0,100);     
  ax = random(0,255); 
   
  stroke(r, g, b, ax);  
  rect(x1, y1, x2, y2);               
}
 
void keyPressed() {
  saveFrame("yo.png");
}

