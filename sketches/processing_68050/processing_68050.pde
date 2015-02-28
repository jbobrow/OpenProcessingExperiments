
float a=0;
float b=0;
float c=0;

void setup()
{
size(700,700);
background(15);


}

void draw()
{
strokeWeight(3);
fill(250,58,93);

smooth();
arc (100,300,150,150,a,PI/4+a);
 a=a+0.3;

fill(98,64,242); 
smooth();
arc (280,300,90,90,b,PI/4+b);
 b=b+0.2;  
 
fill(65,234,40); 
smooth();
arc (400,300,50,50,c,PI/4+c);
 c=c+0.1;
}

