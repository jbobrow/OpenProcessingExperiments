

void setup ()
{
//la taille de mon sketch, le fond et le smooth
size(500,500);
background (255);
noFill();
smooth();

}



//je crée une fonction draw
void draw ()
{

//je crée une boucle for
for (int posX=25; posX<width; posX =posX+50)
{ 
for (int posY=25; posY <height; posY= posY+50)
{ ellipse(posX,posY,50,50); 
  ellipse(posX-25,posY-25,50,50); 
  ellipse(posX,posY,125,125);
  ellipse(posX,posY,150,150);
 }
}



}

