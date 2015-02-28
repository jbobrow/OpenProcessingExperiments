
void setup() {
  size (750,750);

  smooth();
  
  
  
}

void draw() 
{
    background (0,0,0);
    translate(width/2, height/2);
  
  for(int i=0; i<second(); i++)
  {
    pushMatrix();
    rectMode(CENTER);
    stroke(255,255,255);
    noFill();
    ellipse(0,0,10+i*12,10+i*12);
    popMatrix();
    
  }


for(int i=0; i<minute(); i++)
  {
    pushMatrix();
    rectMode(CENTER);
    stroke(255,255,255);
    noFill();
    rotate(radians(hour()*30)-45);
    rect(0,0,10+i*12,10+i*12);
    popMatrix();
    
  }
}
