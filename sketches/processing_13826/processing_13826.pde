

void setup(){
size(400,400);
smooth();
}

void draw(){
background(204);
rect(mouseX,mouseY,20,20);

for(int a=10; a<width; a+=10)
{
if(a%20 == 0)
{
stroke(150);
line(a,400,a,a-20);
}else
{
stroke(100);
line(a,400,a,0); 
}
}

for(int b=10; b<height; b+=10)
{
if(b%20 == 0)
{
stroke(150);
line(400,b,b-20,b);
}else
{
stroke(100);
line(400,b,0,b); 
}
}
}



