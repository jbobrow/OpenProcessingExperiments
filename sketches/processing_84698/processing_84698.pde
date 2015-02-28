
void setup()
{
  //SIZE
  //La taille en pixel du papier de la fenêtre est largeur= 220 hauteur= 200
  size(500,500);
  
  smooth();
 
  //BACKGROUND
  //Peindre le fond de notre fenetre (#FF0000)
  background(#FF0000);
 
}

void draw()
{
  //NOStroke
  noStroke();
  
 //Ellipse
 for( int posx = 25; posx<= 475; posx = posx+50) 
 for( int posy = 25; posy<= 475; posy = posy+50) 
 { ellipse(posx,posy,40,40);} 
 
 //FILL
 fill(#3972FF,90);
 for( int posx = 25; posx<= 475; posx = posx+50) 
 for( int posy = 25; posy<= 475; posy = posy+50) 
 { ellipse(posx,posy,25,25);} 
 
 //FILL
 fill(#3972FF,80);
 for( int posx = 25; posx<= 475; posx = posx+50) 
 for( int posy = 25; posy<= 475; posy = posy+50) 
 { ellipse(posx,posy,10,10);} 
 
  //NOLOOP
  noLoop();
}


