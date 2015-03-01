
void setup() 
{
size(400,400);
background(0);
noStroke ();
}
 
 
void draw ()  
{
for (int a =10; a<200; a+=20)//setting value for a
{
for (int b =10; b<200; b+=20) //setting value for b
{
fill (a,b,25,200);//set colour of rectangles with a gradient
rect(a,b,a*b,b*5);
}
}
}


