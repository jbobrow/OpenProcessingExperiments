
void setup()
{
size(400,400);
background(#5A3939);
smooth();
}


void draw()
{ 
background(#5A3939);
fill(62); //couleur rectangle
triangle(mouseX-50, mouseY, mouseX, mouseY-50, mouseX, mouseY);
  
 fill(150); //couleur rond
 ellipse(11,mouseY,11,12);  
}





