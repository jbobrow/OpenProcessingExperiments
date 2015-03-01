
int counter = 124;
int counter2 = 252;
void setup() 
{
size(250, 250);
background(255); //set background white
}
void draw() 
{
stroke(0, 0, 0);
fill(counter, counter2, 0);
rect(20, 20, 100, 100);
counter--;
counter2--;
}
