
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


  //TRAME ROND ROUGE ET CARRE FONCE
  for (int posx=25; posx<=475; posx=posx+50)
    for (int posy=25; posy<=475; posy=posy+50)
    {  

      noFill();
      noStroke();

      fill(155, 19, 19,200);
      ellipse(posx, posy, 50, 50);
      fill(33, 5, 5,50);
      rect(posx, posy, 50, 20);
    }
  noLoop();
}



