
int i=0;

void setup()
{
size(500,500);
}

void draw() {
  background (202,225,255);
  
  for(int i=0;i<500;i=i+10)
  {
    float r=random(500);
    float j=random(500);
    float SW=random(1);
    float opacity=random(60);
    
    frameRate(10);
    
    stroke(128,0,128,opacity);
    strokeWeight(SW);
    line(500,500,j,r);
    
 
    strokeWeight(SW);
    stroke(242,242,242);
    line(0,0,r,j);
    
   
  }
  
}
