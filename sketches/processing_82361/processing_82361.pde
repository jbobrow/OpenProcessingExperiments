
void setup()

{
size(200,200);
background(220);
}


void draw()
{
int Monpetitpanier;
Monpetitpanier = 100;

fill(127);

ellipse(100,Monpetitpanier,90,90);
println(Monpetitpanier);

Monpetitpanier = Monpetitpanier +10;
ellipse(Monpetitpanier,100,90,90);

int MapositionX;
MapositionX = 90;

int MapositionY;
MapositionY = 55;

int Macouleur;
Macouleur = mouseX;

fill(Macouleur);
ellipse(MapositionX,MapositionY,Monpetitpanier,74);


}


