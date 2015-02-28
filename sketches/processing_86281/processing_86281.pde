
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
 arc(300,300,200,200,0,PI);
 stroke(0);
 strokeWeight(14);
  arc(300,290,180,180,0,PI);
 strokeWeight(12);
  arc(300,280,160,160,0,PI);
  strokeWeight(10);
  arc(300,270,140,140,0,PI);
  strokeWeight(8);
  arc(300,260,120,120,0,PI);
  strokeWeight(6);
  arc(300,250,100,100,0,PI);
  strokeWeight(4);
  arc(300,240,80,80,0,PI);
  strokeWeight(2);
  arc(300,230,60,60,0,PI);
  arc(300,220,40,40,0,PI);
  //ouverture matrice
  pushMatrix();
  //faire descendre l'arc
  translate(600,690);
  //rotation a 180°
  rotate(PI);
  //arc de cercle en haut
  arc(300,400,200,200,0,PI);
   stroke(0);
   strokeWeight(14);
    arc(300,390,180,180,0,PI);
 strokeWeight(12);
  arc(300,380,160,160,0,PI);
  strokeWeight(10);
  arc(300,370,140,140,0,PI);
  strokeWeight(8);
  arc(300,360,120,120,0,PI);
  strokeWeight(6);
  arc(300,350,100,100,0,PI);
 strokeWeight(4);
  arc(300,340,80,80,0,PI);
  strokeWeight(2);
  arc(300,330,60,60,0,PI);
  arc(300,320,40,40,0,PI);
//fermture de la matrice
  popMatrix();

 
  noLoop();
}


