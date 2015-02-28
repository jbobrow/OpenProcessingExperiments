
void setup()
{
  size(500,500); 
  background(0); 
  smooth();  
  stroke(1,60);
}
  
float z = 0;
float j = 500;
int k = 5;
  
void draw()
{
      
if(z>250){z=0;}
if(j<250){j=500;}

for(int i = 0; i < 20; i++){
  float x = random(0,500);
float y = random(0,500);
fill(noise(x/100.0,y/100.0)*255,0,255-noise(x/200.0,y/200.0)*255,100);  
  
ellipse(j,z,k,k); //top right corner
ellipse(z,z,k,k); //top left corner
ellipse(j,j,k,k); //lower right corner
ellipse(z,j,k,k); //lower left corner
ellipse(random(0,500),z,k,k); //middle right
ellipse(j,random(0,500),k,k); //middle south 
ellipse(random(0,500),j,k,k); //middle north
ellipse(z,random(0,500),k,k); //middle left

z = z+0.09;
j = j-0.09;
if(z>250){k=k+10;}
if(k>60){k=5;}

}

} 
    

