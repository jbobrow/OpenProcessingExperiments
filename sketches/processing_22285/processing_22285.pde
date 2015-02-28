

float x = 0.0;
float y = 0.0;
 
void setup(){
  size (200, 200);
  fill (100, 160, 140);
  noStroke();
  smooth();
  background(255);
}
 
void draw(){
  frameRate(60);
  x += 3;
  y = -x + 200;
  stroke(70, 50, 50, y);
  noFill();
  ellipse(70, 70, x, x);
  if (x > 360){
    x = 0;
  
  
  }
}
                
