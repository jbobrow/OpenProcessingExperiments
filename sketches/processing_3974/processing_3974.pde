
// Used for assignment ARCH1391 David Butterworth 'Metaphor' 
// All code thanks to Jerome Saint-Clair 'Slow' unless stated otherwise 
// http://www.openprocessing.org/visuals/?visualID=3553

float x,y,a,b; 
void setup() 
{size(600,600); 
noStroke(); 
background(28,211,255); 
fill(0); 
x=y=300; 
 
}void draw() 
{for(int i=0; 
i<50;i++){a=random(x-5,x+5); 
b=random(y-5,y+5); 
if ((a*b<540000)&(a*b>0)) 
{rect(a,b,10,10);x=a;y=b;}} 
}  
 


