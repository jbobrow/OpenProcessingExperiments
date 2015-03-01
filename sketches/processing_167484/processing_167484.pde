
void setup()
{
size(400,400);
smooth();
background(0);
}

void draw ()  
{
for (int a =0; a<=width; a+=20)//setting value for a
{
for (int b =0; b<=height; b+=20)//setting value for b
{
stroke(a,b,150,10);//set colour of lines
strokeWeight(1.5);
line(a*4,b*4,30,30);
}   
}
}



