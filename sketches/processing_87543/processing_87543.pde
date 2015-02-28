
float x;
float y;
float stopy;
float cptBouge;

void setup()
{
  size(400,400);
  frameRate(30);
  smooth();
  noStroke();
  x=width/2;
  y=height/2;
  stopy=1;
  cptBouge=1;
}

void draw()
{
  background(144);
  
  y+=sin(radians(cptBouge*5));
  cptBouge++;
  stopy-=sin(radians(cptBouge*5));
  
  float [] tableau = {x-147, y-39, x-37, y-39, x-22, y-39, x+38, y-40, x+53, y-45, x+51, y-84, x+45, y-108, x+39, y-64, x+16, y-63, x+1, y-108.0, x-14.0, y-64.0, x-35.0, y-64.0, x-44.0, y-109.0, x-50.0, y-47.0, x-35.0, y-39.0, x-7.0, y-38.0};
  
  fill(125,175); //Remplissage de l'ombre
  ellipse(x+0, y+115+stopy, 80-stopy, 20); //Création de l'ombre
  
  for(int i=0; i<=100; i++) //For pour dégradé de couleur
  {
      fill(245,165+i*0.5,5);
      quad(x-80+i*0.20, y-70+i*0.65, x-90+i*0.20, y-70+i*0.65, x-50-i*0.20, y+60-i*0.65, x-40-i*0.20, y+60-i*0.65); //Création du baton.
  }
  
  for(int i=0; i<=48; i++) //For pour dégradé de couleur
  {
    fill(0+i*5,245-i*4,15+i*4);
    ellipse(x-90,y-80,48-i,48-i); //Glob de couleur vert et rose
  } 
  
  for(int i=0; i<=120; i++) //For pour dégradé de couleur
  {
    fill(215+i);
    ellipse(x+0,y+0,120-i,120-i); //oeil
  }

  for(int i=0; i<=100; i++) //For pour dégradé de couleur
  {
    fill(195+i*1.5,115+i*2.5,0+i);
    ellipse(x+0,y+0,100-i,100-i); //couleur oeil
  }
  
  for(int i=0; i<=60; i++) //For pour dégradé de couleur
  {
    fill(0+i*3);
    ellipse(x+0,y+0,60-i,60-i); //noir oeil
  }

  fill(235);
  ellipse(x+9,y+10,16,16);  //point blanc
  fill(255,255,255,175);
  ellipse(x+20,y-15,40,40);  //point blanc alpha
  
  beginShape();
  for(int i=0; i<=31; i+=2) //For pour la création de la couronne à partir d'un tableau de données.
  {
    fill(245,190,15);
    curveVertex(tableau[i], tableau[i+1]);
  }
  endShape();
  
  for(int i=0; i<=49; i++) //For pour dégradé de couleur
  {
    fill(245,169+i,15,255);
    ellipse(x+0,y-90,49-i,49-i); //Boule Milieu Couronne
  }
  
  for(int i=0; i<=18; i++) //For pour dégradé de couleur
  {
    fill(245,169+i,15);
    ellipse(x-50,y-95,18-i,18-i); //1 boule or gauche
  }
  for(int i=0; i<=18; i++) //For pour dégradé de couleur
  {
    fill(245,169+i,15);
    ellipse(x-40,y-95,18-i,18-i); //1 boule or gauche
  }
  for(int i=0; i<=18; i++) //For pour dégradé de couleur
  {
    fill(245,169+i,15);
    ellipse(x-45,y-105,18-i,18-i); //1 boule or gauche
  }
  
  for(int i=0; i<=18; i++) //For pour dégradé de couleur
  {
    fill(245,169+i,15);
    ellipse(x+50,y-95,18-i,18-i); //1 boule or droite
  }
  for(int i=0; i<=18; i++) //For pour dégradé de couleur
  {
    fill(245,169+i,15);
    ellipse(x+40,y-95,18-i,18-i); //1 boule or droite
  }
  for(int i=0; i<=18; i++) //For pour dégradé de couleur
  {
    fill(245,169+i,15);
    ellipse(x+45,y-105,18-i,18-i); //1 boule or droite
  } 
}
