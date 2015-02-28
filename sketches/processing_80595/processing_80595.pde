

void setup ()
{
//la taille de mon sketch, le fond et le smooth
size(500,500);
background (5);
noFill();
stroke(255);
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
 ellipse(posX,posY,40,40); 
 ellipse(posX,posY,30,30); 
 ellipse(posX,posY,20,20);
 ellipse(posX,posY,10,10); 
 ellipse(posX-25,posY-25,50,50); 
 }
}



}

