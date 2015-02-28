
void setup()
{
  size(500, 500);
  background(#FFCBF1);
  noStroke();
  smooth();
}

void draw()
{      fill(#366BBF,120);     

  /*pour faire une ligne de cercles 
   j'ajpute 50 pixel à la coordonnée x
   */
  for (int posx=25; posx<= 475; posx = posx+50)

    for (int posy=25; posy<= 475; posy = posy+50)
    {
      ellipse(posx, posy, 25, 25);
      rect(posx+10,posy-5,10,10);
      // ne pas oublier que ça tourne en boucle! COULEURS!     
      fill(#E30B0B);
      ellipse(posx,posy,2,2);
      noFill();
      fill(#366BBF,120);     
    }

  noLoop();
}



