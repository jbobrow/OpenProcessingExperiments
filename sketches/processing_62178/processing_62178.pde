
float x1;
float y1;
float x2;
float y2;
float randomStrokeWeight;
float randomFill;
float randomStroke;
 
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
   
  randomStrokeWeight = random(1,8);  
  strokeWeight(randomStrokeWeight);  
  randomFill = random(1,8);
  fill(x1,y2,x2);
  randomStroke = random(1,255);
  stroke(randomStroke);
  
  rect(x1, y1, x2, y2);                        
}



