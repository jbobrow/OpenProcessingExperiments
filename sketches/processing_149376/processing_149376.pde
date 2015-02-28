
void setup()
{
size(600,400);
background(150,100,240);
}

void draw()
{
fill(100,10,130,40);
rect(0,0,width,height);

noStroke();
fill(250,10,90);
rect(mouseX,mouseY,100,100);

fill(10,150,150);
ellipse(mouseX,mouseY, 90,90);

fill(200,120,90);
ellipse(mouseX,mouseY, 60,50);

fill(240,110,100);
triangle(mouseX,mouseY,mouseY,mouseX,mouseX+75,mouseY/2);
}

void mousePressed()
{
  fill(random(25),random(140),random(130));
}
