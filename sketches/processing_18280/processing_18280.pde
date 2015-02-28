
int a = 1;
int b = 250;
 
void setup()
{
size(250,250);
background(#09ADB4);
smooth();

}
void draw()
{  
noStroke();
 
fill(random(10,200),0,0,20);
rectMode(CENTER);
rect(a, 225, random(0,100),random(0,400));
 
fill(random(55,20),0,0,20);
rectMode(CENTER);
rect(b, 25, random(0,100),random(0,250));
 
a = a + 3;
b = b - 3;
}


