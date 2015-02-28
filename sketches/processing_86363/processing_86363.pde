


void setup () {

  rectMode (CENTER);
  
  size (500,500);

background(#FF057A);
noStroke();
smooth();}

void draw (){


//pour faire une ligne d'ellipses, j'ajoute 50 pixels à la coordonnée x
/*
ellipse(25,25,50,50);
ellipse(75,25,50,50);
ellipse(125,25,50,50);
ellipse(475,25,50,50);
*/

/*Ci-dessous la même opération avec des variables. "for" met une condition,
ici, si la position x (nommée ici "posx") est égale à 25, que celle-ci a une
valeur inférieure ou égale à 475 (qui correspond au cadre, moins le rayon de
l'ellipse), que 
*/

for (int posx=25; posx<=475; posx=posx+50) {
  for (int posy=25; posy<=475; posy=posy+50) {
  
    fill(255);
 ellipse (posx,posy,50,50);
 fill (#2C7ABC);
 rect (posx,posy,20,20);
    }
  }
}


