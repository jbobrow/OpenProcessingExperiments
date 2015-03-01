
int counter = 0;
void setup() 
{
size(250, 250);
background(255); //set background white
}
void draw() 
{
counter++;
stroke(0, 0, 0);
fill(0, counter, 0);
rect(20, 20, 100, 100);
}
int red = 0;
void setup() 
{
size(250, 250);
background(255); //set background white
}
void draw() 
{
red++;
stroke(0, 0, 0);
fill(red, 0, 0);
rect(20, 20, 100, 100);
}
int counter = 0;
void setup() 
{
size(250, 250);
background(255); //set background white
}
void draw() 
{
counter++;
stroke(0, 0, 0);
fill(counter, counter, counter);
rect(20, 20, 100, 100);
}
