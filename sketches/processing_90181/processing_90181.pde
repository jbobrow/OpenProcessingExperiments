

void setup()
{
  size(200, 200);
  background(225);
  smooth();

// Premier groupe diagonales coin gauche.
  
  color (100);
  
  for (int posx = 0; posx <= 200 ; posx = posx + 15 )
  
  for (int posy = 100 ; posy <= 100 ; posy = posy + 30 )
  
  line (posx, posy,20,200);


// 2ème groupe diagonales coin droit.
  
  color (100);
  
  for (int posx = 0; posx <= 200 ; posx = posx + 15 )
  
  for (int posy = 100 ; posy <= 100 ; posy = posy + 30 )
  
  line (posx, posy,180,200);





}







