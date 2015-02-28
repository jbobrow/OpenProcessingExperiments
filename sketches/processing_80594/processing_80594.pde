

void setup ()
{
//la taille de mon sketch, le fond et le smooth
size(500,500);
background (250);
fill(5);
smooth();

}



//je crée une fonction draw
void draw ()
{

//je crée une boucle for
for (int posX=25; posX<width; posX =posX+50)
{ 
for (int posY=25; posY <height; posY= posY+50)
{ ellipse(posX,posY,50,50); }
}



}

