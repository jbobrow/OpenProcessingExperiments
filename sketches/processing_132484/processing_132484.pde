
int base=20;// dikte platform
int x, y, gameScore=0;
int changeX=-30;// snelheid ball horizontaal
int changeY=-15;// snelheid ball verticaal
int gameOver=0;
void setup()
{
  size(750, 650);//groote oppervlakte
  y=height-base; //platform
}
void draw()
{
  if (gameOver==0)
  {
    background(25, 30, 40); //achtergrond kleur start
    text("SCORE:"+gameScore+"0", width/60, height/50); //Plaatsen score + telling
    rect(mouseX, height-base, 200, base); // breedte platform+beweging met mous
    fill(70, 200, 20); //kleur groen
    ellipse(x, y, 10, 10); // de ball
    x=x+changeX;// code beweging ball horziontaal
    y=y+changeY;// code beweging ball verticaal
    if (x<0 | x>width) //
    {
      changeX=-changeX;
    }
    if (y<0)
    {
      changeY=-changeY;
    }
    if (y>height-base)// platform beweging horizontaal is 0
    {
      if (x>mouseX && x<mouseX+300) //de ball terug stuitert van platform
      {
        changeY=-changeY; // de bal terug stuiteren
        gameScore++;
      }
      else
      {
        gameOverbinnen();
      }
    }
  }
  else
  {
    background(255, 0, 0);// achtergrond kleur wanneer verloren
    text("You just lost the game", width/2, height/2);// tekst+plaatsing
    text("CLICK TO RESTART", width/2, height/2+20);// tekst+plaatsing
  }
}
void gameOverbinnen()
{
  gameOver=1;
}
void mouseClicked()// wanneer je klikt wordt alles reset
{
  changeY=-changeY;
  gameScore=0;
  gameOver=0;
}

