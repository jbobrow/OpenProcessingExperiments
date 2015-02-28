
void setup() {
  size (500,500);
  background (255,255,255);
  smooth();
  
  
  
}

void draw() 
{
  background (0,0,0);
  translate(width/2, height/2);
  
  fill(255,255,255);
  ellipse(0,0,418,418);
  
  fill(255,255,255);
  ellipse(0,0,400,400);
  
  fill(0,0,0);
  ellipse (0,0,20,20);
  
  for ( int i=0; i<360; i+=6)
  {
    pushMatrix();
    rotate (radians (6*second()-90));
    strokeWeight(1); 
    strokeCap(SQUARE);
    stroke(0, 0, 0);
    line(0, 0, 200, 0);
    popMatrix();
    
    pushMatrix();
    rotate (radians (6*minute()-90));
    strokeWeight(3); 
    strokeCap(SQUARE);
    stroke(0, 0, 0);
    line(0, 0, 200, 0);
    popMatrix();
    
    pushMatrix();
    rotate (radians (30*hour()-90));
    strokeWeight(6); 
    strokeCap(SQUARE);
    stroke(0, 0, 0);
    line(0, 0, 200, 0);
    popMatrix();  
  }
}
