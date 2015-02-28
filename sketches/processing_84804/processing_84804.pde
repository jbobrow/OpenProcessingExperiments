
void setup()
{
  size(500, 500);
  background(216, 17, 17);
  noStroke();
  smooth();
}

void draw()
{


  //la boucle for
  //FAIRE UNE LIGNE HORIZONTALE
  /*for(int posx=25; posx<=475; posx=posx+50)
   {
   ellipse(posx,25,50,50);*/

  //FAIRE UNE LIGNE VERTICALE
  /*for(int posy=25; posy<=475; posy=posy+50)
   {
   ellipse(25,posy,50,50);
   }*/

  //FAIRE UNE TRAME
  for (int posx=25; posx<=475; posx=posx+50)
    for (int posy=25; posy<=475; posy=posy+50)


    {  
      noFill();
      noStroke();

      fill(155, 19, 19);
      ellipse(posx, posy, 30, 30);
      fill(33, 5, 5, 50);
      ellipse(posx, posy, 50, 50);
      fill(67, 5, 5, 120);
      rect(posx, posy, 15, 15);
    }
  noLoop();
}



