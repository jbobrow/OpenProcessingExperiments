
void setup()
{size(600,600);
}


void draw()
{
background(20,mouseX,mouseX); //fond
fill(0,mouseY,mouseX,20); //remplissage gros cercle
noStroke();
ellipse(300,300,300,300); // gros cercle

{
  fill(0,mouseY,mouseX,200); //remplissage petits et moyens cercles
{
{
ellipse(300,300,20,20); //petits cercles
ellipse(300,300,50,50); // petit moyens cercles
ellipse(300,300,90,90); // moyen 
ellipse(300,300,130,130); // moyens groq cercles
ellipse(300,300,190,50); // oval cercles
}
}
}
}



