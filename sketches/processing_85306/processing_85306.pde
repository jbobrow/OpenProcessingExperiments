
void setup (){
  size(500,500);
  background(255);
}

void draw()

{
   for (int posX=100; posX < 200; posX=posX+40)
  {
    for (int posY=100; posY < 200; posY=posY+40)
{



strokeCap(ROUND);
strokeWeight(40);
//j'ajoute de la transparence
stroke(#397E70,50);
//ligne verticale
line(posX,posY,posX,posY+30);
//ligne horizontale avec de la transparence
stroke(#4D3264,50);
line(posX-15,posY+15,posX+15,posY+15);


   strokeCap(ROUND);
strokeWeight(2);
//j'ajoute de la transparence
stroke(255);
//ligne verticale
line(posX,posY,posX,posY+30);
//ligne horizontale avec de la transparence
stroke(255);
line(posX-15,posY+15,posX+15,posY+15);
noLoop();
}
  }
}



