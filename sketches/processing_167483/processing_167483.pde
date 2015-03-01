
void setup() 
{
size(400,400);
background(255);
noStroke ();
}
 
 
void draw ()  
{
for (int a =10; a<390; a+=20)//setting value for a
{
for (int b =10; b<390; b+=20) //setting value for b
{
fill (a,b,100,200);//set colour of rectangles with a gradient
rect(a,b,a/10,b/10);
}
}
}



