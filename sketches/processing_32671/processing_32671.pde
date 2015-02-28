
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
  
void draw()
{
      
if(z>250){z=0;}
if(j<250){j=500;}

for(int i = 0; i < 20; i++){
  float x = random(0,500);
float y = random(0,500);
fill(noise(x/100.0,y/100.0)*255,0,255-noise(x/200.0,y/200.0)*255,100);
  
ellipse(z,random(0,500),k,k); //top right corner
ellipse(j,random(0,500),k,k); //top left corner
ellipse(random(0,500),z,k,k); //lower right corner
ellipse(random(0,500),j,k,k); //lower left corner
ellipse(z,random(0,500),k,k); //middle right
ellipse(z,random(0,500),k,k); //middle south 
ellipse(j,random(0,500),k,k); //middle north
ellipse(j,random(0,500),k,k); //middle left

z = z+14;        
j = j-28;


}

} 
    

