
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
 arc(200,300,200,200,0,PI);
 stroke(0);
 strokeWeight(14);
  arc(200,290,180,180,0,PI);
 strokeWeight(12);
  arc(200,280,160,160,0,PI);
  strokeWeight(10);
  arc(200,270,140,140,0,PI);
  strokeWeight(8);
  arc(200,260,120,120,0,PI);
  strokeWeight(6);
  arc(200,250,100,100,0,PI);
  strokeWeight(4);
  arc(200,240,80,80,0,PI);
  strokeWeight(2);
  arc(200,230,60,60,0,PI);
  arc(200,220,40,40,0,PI);
  //ouverture matrice
  pushMatrix();
  //faire descendre l'arc
  translate(600,690);
  //rotation a 180°
  rotate(PI);
  //arc de cercle en haut
  arc(200,400,200,200,0,PI);
   stroke(0);
   strokeWeight(14);
    arc(200,390,180,180,0,PI);
 strokeWeight(12);
  arc(200,380,160,160,0,PI);
  strokeWeight(10);
  arc(200,370,140,140,0,PI);
  strokeWeight(8);
  arc(200,360,120,120,0,PI);
  strokeWeight(6);
  arc(200,350,100,100,0,PI);
 strokeWeight(4);
  arc(200,340,80,80,0,PI);
  strokeWeight(2);
  arc(200,330,60,60,0,PI);
  arc(200,320,40,40,0,PI);
//fermture de la matrice
  popMatrix();

 
  noLoop();
}


