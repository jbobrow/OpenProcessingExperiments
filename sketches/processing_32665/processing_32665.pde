
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
float h = 500;
float t = 0;
  
void draw()
{
      
if(z>500){z=0;}
if(j<500){j=500;}
if(h<0){h=500;}
if(t>500){t=0;}

for(int i = 0; i < 20; i++){
  float x = random(0,500);
float y = random(0,500);
fill(noise(x/100.0,y/100.0)*255,0,255-noise(x/200.0,y/200.0)*255,100); 
  
ellipse(j,z,k,k); //top right corner
ellipse(z,z,k,k); //top left corner
ellipse(j,j,k,k); //lower right corner
ellipse(z,j,k,k); //lower left corner
ellipse(random(0,500),250,k,k); //middle right
ellipse(250,random(0,500),k,k); //middle south 
ellipse(250,random(0,500),k,k); //middle north
ellipse(random(0,500),250,k,k); //middle left

t = t+0.09;
h = h-0.09;

z = z+0.09;
j = y-0.09;

if(z>500){k=k+5;}
if(k>70){k=5;}

} 

}    

