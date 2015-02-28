

import controlP5.*;
ControlP5 controlP5;
int   nbrPoints = 1000;
int   cx, cy;
float taille;
float tempscycle;
float start;
float vitesse;
float niveau2 = 1;

void setup()
{
  size(600, 600);
  cx = width/2;
  cy = height/2;
  taille = (min(width, height));
  smooth();
  colorMode(HSB, 1);
  tempscycle = 10*180*500;
  controlP5 = new ControlP5(this);
  Button myButton = controlP5.addButton("skip",0,0,0,50,50);
}



void draw()
{
  if (mousePressed == true) {
    niveau2 = random(2, 4);
  }
  vitesse = (2*PI*nbrPoints) / tempscycle;
  start = -(tempscycle*8) / (float) height;
  float horloge = (millis()*.001 - start)*vitesse*(niveau2/5);//mouseX --> modification de l'affichage au clique de la souris
  background(0);
  for (int i = 0; i < nbrPoints; ++i)
  {  
    
    float r = i/(float)nbrPoints;
    float a = horloge * r; 
    float toto = i*taille/(float)nbrPoints*1;
    toto *=sin(a*horloge);
    toto *= sin(a*horloge+2);
    
    float largeurcercle = max(1, toto*.07);
    int x = (int) (cx + cos(a)*toto);
    int y = (int) (cy + sin(a)*toto);
    float couleur = r + horloge * .04;
    couleur -= int(couleur);
    fill(couleur, 100, 1-r/4);
    ellipse(x, y, largeurcercle, largeurcercle);
  }
}


