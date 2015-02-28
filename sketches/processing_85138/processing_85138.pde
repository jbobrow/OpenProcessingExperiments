
void setup()
{
//Déterminons la taille de la feuille pour commencer
size(400,400);
//peindre le fond de la fenetre ON PEUX COPIER UN CODE COULEUR DANS TOOL ONGLET COLOR
background(#37BBC1);
}
void draw()
{
//bloquer la boucle
noLoop();

//position  et diametre
noStroke();
fill(#FFFFFF);
ellipse(200,200,400,400);
fill(#37BBC1);
//centrer la forme ds l'interface
ellipse(width/2,height/2,90,90);

stroke(21);
noFill();
ellipse(25,25,50,50);
ellipse(25,75,50,50);

//repetition for=quand les condition suivante son la)

for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,25,50,50);}

//continuer a rajouter sur la vertical 
for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,75,50,50);}

for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,125,50,50);}

for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,175,50,50);}

for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,225,50,50);}

for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,275,50,50);}

for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,325,50,50);}

for(int posx = 25;posx<=475; posx = posx+50)
{ellipse(posx,375,50,50);}

//meme resultat pas meme techniqu de repetition
for(int posy = 25;posy<=475; posy = posy+20)
for(int posx = 25;posx<=475; posx = posx+50)
{
  noStroke();
  fill(0);
  ellipse(posx,posy,20,20);
  stroke(0);
  noFill();
  rect(posx,posy,60,10);
}


}
