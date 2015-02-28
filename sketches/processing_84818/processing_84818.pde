
void setup()
{
  size(500, 500);
  background(255);
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

      stroke(91, 195, 255, 200);
      ellipse(posx, posy, 150, 150);
   

     /* stroke(33, 5, 5, 50);
      rect(posx, posy, 15, 15, 25, 25, 90, 90);*/
    }
      for (int posx=35; posx<=500; posx=posx+70)
        for (int posy=35; posy<=500; posy=posy+70)
{
          stroke(91, 195, 245, 150);
      ellipse(posx, posy, 150, 150);
    }
    
         for (int posx=10; posx<=500; posx=posx+40)
        for (int posy=10; posy<=500; posy=posy+40)
{
          stroke(91, 195, 245, 100);
      ellipse(posx, posy, 150, 150);
    }
  noLoop();
}



