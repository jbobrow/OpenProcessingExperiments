

void setup()
{
  size(200, 200);
  background(225);
  smooth();

// GROUPE GAUCHE diagonales coin gauche.
  
  color (100);
  
  for (int posx = 0; posx <= 200 ; posx = posx + 5 )
  
  for (int posy = 100 ; posy <= 100 ; posy = posy + 5 )
  
  line (posx, posy,0,200);


// Groupe CENTRE diagonales coin gauche.
  
  color (100);
  
  for (int posx = 0; posx <= 200 ; posx = posx + 5 )
  
  for (int posy = 100 ; posy <= 100 ; posy = posy + 5 )
  
  line (posx, posy,100,200);


// GROUPE DROIT diagonales coin droit.
  
  color (100);
  
  for (int posx = 0; posx <= 200 ; posx = posx + 5 )
  
  for (int posy = 100 ; posy <= 100 ; posy = posy + 5 )
  
  line (posx, posy,200,200);





}







