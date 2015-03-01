
void setup() 
{
size(500, 500);
background(255);
}
void draw() 
{ 
background(255);

if (mousePressed && (mouseButton == LEFT))
{
fill(random(255), random(255), random(255));
ellipse(mouseX, mouseY, 100, 100);
} 

else if(mousePressed && (mouseButton == RIGHT))
{
fill(random(255), random(255), random(255));
rect(mouseX, mouseY, 100, 100);
}

else if(mousePressed && (mouseButton == CENTER))
{
fill(random(255), random(255), random(255));
triangle(mouseX, mouseY, mouseX + 20, mouseY - 50, mouseX + 40, mouseY);
}
}
