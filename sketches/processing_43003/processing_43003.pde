
float sz;

void setup() {
size(300, 300);
smooth();
noStroke();
rectMode(CENTER);
}

void draw()
{ background(255);
  for(int x = 0; x < 20; x++)
  { 
    for(int y = 0; y < 20; y++)
    {
    fill(0);
   pushMatrix();
   translate(width/2, -50);
   rotate(radians(45));
   sz = 0.1;
    rect(x*15, y*15, sz*mouseX , sz*mouseY);
    popMatrix();
   
    
  }
  
  
  
  }
}
