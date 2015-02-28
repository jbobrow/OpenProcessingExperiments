
void setup() {  
  size(2500, 600);// taille de la fenetre d'affichage
  background(#CECECE);  // couleur du background(= le fond)
  colorMode(HSB);   //luminosite
  }
void draw(){ //fonction dessin 
  //lignes horizontales
 line(500,10,2000,10);
 fill(#FD6C9E);
 text (" Joueur 1 ",580,53);
 text (" Joueur 2 ",800,53);
 line(500,60,2000,60);
 text ( " AS ", 515,90);
 line(500,110,2000,110);
 text ( " Deux ", 508,140);
 line(500,160,2000,160);
 text ( " Trois ",509,190);
 line(500,210,2000,210);
 text ( " Quatre ",504,240);
 line(500,260,2000,260);
 text ( " Cinq ", 509,290);
 line(500,310,2000,310);
 text ( " Six ", 513,340);
 line(500,360,2000,360);
 text ( " TOTAL ",505,390);
 line(500,410,2000,410);
 
 
 //lignes verticales
 
 line(500,10,500,410);
 line(550,10,550,410);
 line(750,10,750,410);
 line(2350,10,2350,410);
 }
