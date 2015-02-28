
void setup()
{
  //taille de l'image
  size(600,600);
  background(0);
  smooth();
}
void draw()
{
  //arc de cercle en bas
 arc(300,300,120,200,0,PI);
 stroke(0);
 strokeWeight(14);
  arc(300,300,130,180,0,PI);
 strokeWeight(12);
  arc(300,300,140,160,0,PI);
  strokeWeight(10);
  arc(300,300,150,140,0,PI);
  strokeWeight(8);
  arc(300,300,160,120,0,PI);
  strokeWeight(6);
  arc(300,300,170,100,0,PI);
  strokeWeight(4);
  arc(300,300,180,80,0,PI);
  strokeWeight(2);
  arc(300,300,190,60,0,PI);
  arc(300,300,200,40,0,PI);
  //ouverture matrice
  pushMatrix();
  //faire descendre l'arc
  translate(600,690);
  //rotation a 180°
  rotate(PI);
  //arc de cercle en haut
  arc(300,420,200,200,0,PI);
   stroke(0);
   strokeWeight(14);
    arc(300,430,180,180,0,PI);
 strokeWeight(12);
  arc(300,440,160,160,0,PI);
  strokeWeight(10);
  arc(300,450,140,140,0,PI);
  strokeWeight(8);
  arc(300,460,120,120,0,PI);
  strokeWeight(6);
  arc(300,470,100,100,0,PI);
 strokeWeight(4);
  arc(300,480,80,80,0,PI);
  strokeWeight(2);
  arc(300,490,60,60,0,PI);
  arc(300,500,40,40,0,PI);
//fermture de la matrice
  popMatrix();
  noLoop();
}


