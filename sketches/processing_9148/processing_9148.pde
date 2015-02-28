
void setup()
{
  size(600,600,P3D);
  noFill();
//frameRate(23);
} 


void draw()
{ 
  
  float n=noise(float(frameCount)/1200); 
 // noiseDetail(2,1.0);
  stroke(#BDBDBD); 
  background(255); 
  translate(mouseX,mouseY); 
  camera(mouseX,mouseY,mouseX,70,50,100,-1.0,0.0,1.0);
  
    for(int i=0;i<300;i+=3)
    { 
      rotate(n*2); 
      box(i); 
    }

} 


