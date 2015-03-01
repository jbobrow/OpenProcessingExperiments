
//float a,b;
float x,y;

void setup()
{
size(600,600); 
background(255);
x=0;
y=0;
//a=300;
//b=300;
}
void draw()
{
//stroke(255,0,0)  
//strokeWeight(1);
ellipse(x,y,x,y);
x = x + random(0.5,2);
y = y + random(0.3,2);
//rect(a,b,a,b);
//a = a + random(0.7,1.5);
//b = b + random(0.6,1.4);
if(y > height)
{
//fill(random(255),random(255),random(255),random(255));  
strokeWeight(random(5));  
stroke(random(255),random(255),random(255),random(255));  
x=random(0,width);
y=random(0,height);
}
}
