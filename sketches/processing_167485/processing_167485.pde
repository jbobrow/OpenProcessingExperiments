
void setup()
{
size(400,400);
background(255);
smooth();
}

void draw ()  
{
for (int a =0; a<=width/2; a+=20)//setting value for a
{
for (int b =0; b<=height/2; b+=20)//setting value for b
{
stroke(a,255,0,10);//set colour of lines
strokeWeight(1.5);
line(a,b*4,30,30);
}   
}
}


