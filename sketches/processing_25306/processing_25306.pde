
/*###########################################
CLASSE QUI CONSTRUIT LES AUTOMOBILES
#############################################*/


class Automobile {
  //attribut
  float x;
  float y;
  float largeur = 27;
  float hauteur = 47;
   
//constructeur
  Automobile(float x, float y){
  this.x = x;
  this.y = y; 
  //this.vitesse = vitesse;
    
  }
  
  void draw()   {
   fill(255);

  rect(x,y,largeur,hauteur);

  fill(0);
  rect( x+largeur/2-14 , y+4 , 28 , 10 );
  rect( x+largeur/2-14 , y+32 , 28 , 10 );
  rect( x+largeur/2-13 , y+15 , 2 , 7 );
  rect( x+largeur/2-13 , y+24 , 2 , 7 );
  rect( x+largeur/2+11 , y+15 , 2 , 7 );
  rect( x+largeur/2+11 , y+24 , 2 , 7 );
  fill(255);
  ellipse( x+13, y+47, 28, 6 );
  ellipse( x+13, y, 28, 6 );
  //x = constrain(x +90, 100, 350);
  }
}



