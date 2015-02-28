
void setup()
{
  //taille de l'image
  size(600, 600);
  background(0);
  smooth();
}
void draw()
{
   background(0);
  //variable X et Y
  fill(255,46);
  //variable X et Y
  int arcx = 300;
 int arcy =300;
  // variable W et H
  int widtha;
  int heighta;
  //variable pour le 1er arc
  heighta =200;
  widtha =300;
  
  //epaisseur
  strokeWeight(18);
  //arc de cercle 1
  arc(arcx, arcy, widtha, heighta, 0, 4/PI);
  
  //variable pour le 2eme arc
  heighta = 180;
  widtha = 180;
  //epaisseur
  strokeWeight(14);
 
 //arc de cercle 2
  arc(arcx, arcy, widtha, heighta, 0, PI);
  
  //variable pour le 3eme arc
  heighta = 160;
  widtha = 200;
  
  //epaisseur
  strokeWeight(12);
  
  //arc de cercle 3
  arc(arcx, arcy, widtha, heighta, 0, 4/PI);

//variable pour l'epaisseur du trait
int epaisseur=10;
  
  //boucle for pour les arcs suivants
  for (int i =140; i >=40; i = i -20){
  
 stroke(0);
    strokeWeight(epaisseur);
   //arc de cercle suivant
  arc(arcx, arcy, i, i, 0, PI);
    epaisseur=epaisseur-2;
 }
 
 pushMatrix();
  //faire descendre l'arc
  translate(600,590);
  //rotation a 180°
  rotate(PI);
  //variable pour le 4eme arc
   heighta =200;
  widtha =300;
//epaisseur
 strokeWeight(18);
  //arc de cercle 4
  arc(arcx, arcy, widtha, heighta, 0, 4/PI);
  
  //variable pour le 5eme arc
  heighta = 180;
  widtha = 180;
  //epaisseur
  strokeWeight(14);
  //arc de cercle 5
  arc(arcx, arcy, widtha, heighta, 0, PI);
 //variable pour le 6eme arc
  heighta = 160;
  widtha = 200;
  //epaisseur
  strokeWeight(12);
  //arc de cercle 6
  arc(arcx, arcy, widtha, heighta, 0, 4/PI);
// variable pour l'epaisseur
int epaisseur2=10;
  //boucle for pour les arcs suivants
  for (int i =140; i >=40; i = i -20){
   
 stroke(0);
    strokeWeight(epaisseur2);
   // arc de cercles suivants
   arc(arcx, arcy, i, i, 0, PI);
    epaisseur2=epaisseur2-2;
 }
   popMatrix();

 // noLoop();
}



