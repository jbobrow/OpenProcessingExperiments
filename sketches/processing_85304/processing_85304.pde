
void setup(){
  size(500,500);
  background(255);
}

void draw()
{

  for (int posX=25; posX < width; posX=posX+40)
  {
    for (int posY=25; posY < height; posY=posY+40)
{
  
  //troisième quadrillage de +
  //épaisseur de la ligne = 70 pixels
  strokeCap(SQUARE);
strokeWeight(50);
//j'ajoute de la transparence
stroke(#76A097,300);
//ligne verticale
line(posX,posY,posX,posY+45);
//ligne horizontale avec de la transparence
stroke(#76A097,300);
line(posX-25,posY+10,posX+15,posY+10);
  //épaisseur de la ligne = 10 pixels
  strokeCap(SQUARE);
strokeWeight(5);
//j'ajoute de la transparence
stroke(#318372,150);
//ligne verticale
line(posX,posY-15,posX,posY+15);
//ligne horizontale avec de la transparence
stroke(#318372,150);
line(posX-15,posY,posX+15,posY);

//deuxième quadrillage de +
  //épaisseur de la ligne = 10 pixels
  strokeCap(SQUARE);
strokeWeight(15);
//j'ajoute de la transparence
stroke(#1DB495,150);
//ligne verticale
line(posX-10,posY-25,posX-10,posY+5);
//ligne horizontale avec de la transparence
stroke(#1DB495,150);
line(posX-25,posY-10,posX+5,posY-10);


}
}
noLoop();
}


