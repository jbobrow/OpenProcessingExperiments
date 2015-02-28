
//drawing program MALVEAR

float x=0.0;
float y=256.0;
float z=0.0;

void setup()
{
size(600,600);
background(189);
}



void draw()
{
  
if(x<256 & y>0 & z<256)
{

background(37);
fill(200,y,z,100);
rect(mouseX,mouseY,30,50);
fill(0,200,199,100);
triangle(mouseX/30,mouseY/50,mouseX+x,mouseY-y,mouseX/z,mouseY+y);
x=x+.2;
y=y-.5;
z=z+.2;

fill(y,z,x);

quad(0,0,mouseX-z,mouseY/z,mouseX+y,mouseY+x,mouseX/z,mouseY-y);

fill(0,10,z,35);
quad(600,0,mouseX+y,mouseY-x,mouseX/3,mouseY-z,mouseX/z,mouseY+x);

fill(199,y,200,118);
quad(0,600,mouseX/x,mouseY*z,mouseX+y,mouseY-x,mouseX-y,mouseY/2);


fill(x,20,130,255);
ellipse(mouseX+mouseY,mouseY+mouseY,30,20);


 stroke(x,y,z);
  line(mouseX+x,mouseY/z,mouseX,mouseY);



} 

else
{
x=0;
y=256;
z=0;
}  
   
  
}
