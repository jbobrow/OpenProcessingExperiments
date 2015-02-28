
void setup()
{
  size(500,500); 
  background(0); 
  smooth();  
  noStroke();
}
  
int z = 0;
int j = 500;
int k = 5;
int x = 0;
int y = 500;
  
void draw()
{
      
if(z>250){z=0;}
if(j<250){j=500;}




for(int i = 0; i < 20; i++){
  float x = random(0,500);
float y = random(0,500);
fill(noise(x/100.0,y/100.0)*255,0,255-noise(x/200.0,y/200.0)*255,100);  

  ellipse(x,y,k,k); //top right corner
  
  x = x+20;        
  y = y-20;
  
  if(x>500){x=0;}
  if(y<0){y=500;}

}


} 
    

