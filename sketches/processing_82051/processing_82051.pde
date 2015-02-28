
void setup()
{size(600,600);
}


void draw()
{
background(20,mouseX,mouseX); //fond
fill(0,mouseY,0,400); //remplissage gros cercle
noStroke();
ellipse(300,300,300,300); // gros cercle

fill(0,mouseY,mouseX,200); //remplissage petits et moyens cercles
for (int posX = 50; posX < width; posX = posX+50)
{
for (int posY = 50; posY < height; posY = posY+50)
{
ellipse(posX,posY,20,20); //petits cercles
ellipse(posX,posY,50,50); // moyens cercles

}
}
}




