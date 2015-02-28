
void setup()
{  
  size(1000, 1000);  
}  
float noiseScale=0.02;
void draw() 
{
  background(0);
  for(int x=0; x < width; ) 
  {
    //float noiseVal = noise((mouseX+x)*noiseScale,x*noiseScale);
     float noiseVal = noise((mouseX+x)*noiseScale,x*noiseScale);
    stroke(noiseVal*355,0,0);
    //line(x, noiseVal*1000, x, height);
    line(x, noiseVal*900, x, height);
    //ellipse(x, mouseY+noiseVal*8, mouseX, height/4);
    x = x + 3;
  }
  
}            
