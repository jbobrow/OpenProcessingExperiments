
//Sarah Anderson, seanders

void setup()
{
size(400,400);  
}

void draw()
{
//background(120);
noStroke();
fill(0,5); //can change the second number to play with the risidual image
rect(0,0,width,height);
fill(random(255),random(255),random(255));
float mx=width-mouseX;
float my=height-mouseY;
ellipse(mx,my,10,10);
ellipse(mouseX,mouseY,10,10);
ellipse(mouseX,my,10,10);
ellipse(mx,mouseY,10,10);
}
