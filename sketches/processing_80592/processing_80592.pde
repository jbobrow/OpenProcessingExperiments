

void setup ()
{
//la taille de mon sketch, le fond et le smooth
size(500,500);
background (250);
smooth();
}



//je crée une fonction draw
void draw ()
{
fill(255,80);

//je crée une boucle for
for (int i=0; i<width; i =i+10)
{
ellipse (i,50,50,50);
ellipse (50,i,50,50);
ellipse (i,100,50,50);
ellipse (100,i,50,50);
ellipse (i,150,50,50);
ellipse (150,i,50,50);
ellipse (i,200,50,50);
ellipse (200,i,50,50);
ellipse (i,250,50,50);
ellipse (250,i,50,50);
ellipse (i,300,50,50);
ellipse (300,i,50,50);



}

noLoop();
}

