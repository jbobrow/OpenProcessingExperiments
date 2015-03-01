
int blue = 0;
int red = 0;
int green= 0;
int yellow = 255;
int magenta = 0;
void setup() 
{
size(250, 250);
background(255); //set background white
}
void draw() 
{
stroke(0, 0, 0);
fill(0, 0, blue);
ellipse(200, 200, 55, 55);
blue++;
stroke(0, 0, 0);
fill(red, 0, 0);
rect(10, 80, 50, 50);
red++;
fill(0, green, 0);
triangle(30, 75, 58, 20, 86, 75);
green++;
fill(255, yellow, magenta);
rect(80, 80, 100, 100);
yellow--;
magenta++;
} 
