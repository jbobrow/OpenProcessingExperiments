

void setup()
{
size (300,500);
background(255);
noStroke();
fill(0);

}


void draw ()
{
 // scale (1.2);
  

for (int a=0;a<height;a=a+20)
{
  
for (int x=0;x<width; x=x+15)
{
rect (0+x,0+a,5,10);
rect (5+x,5+a,5,15);
rect (10+x,10+a,5,5);  
}

}
}



  


