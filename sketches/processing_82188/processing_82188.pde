
/************************************************************************
TP2 : Animation
Par Victoria Malenfant
Pour le cours EDM4610-20, Jean-François Renaud
Pour le 9 Novembre 2012
************************************************************************/

float x, y, d;
Lucioles [] tableauLucioles;
float positionX;
float positionY;

//Librairie Ani 2.2
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

void setup() 
{
  size(800, 400);
  background(0);
  smooth();
  noStroke();
  
  Ani.init(this);
  
  tableauLucioles = new Lucioles [200];
  
  for(int i = 0; i < tableauLucioles.length; i++) 
  { 
    //Remplissage initiale de mon tableau avec les positions de départ.
    positionX = random(0, width);
    positionY = random(0, height);
    tableauLucioles[i] = new Lucioles(positionX, positionY , i);
  }
  
}

void draw() 
{
  fill(0, 40);
  rect(0, 0, width, height);
  
  for(int i = 0; i < tableauLucioles.length; i++) 
  { 
   //Dessin des lucioles
   tableauLucioles[i].update(); 
   tableauLucioles[i].afficher();  
  }
  
} 



class Lucioles 
{

  float posX, posY, id, d, d2, xLuciole, yLuciole, difference;
  float r, g, b, o, v, limite;
  boolean etat;

  Lucioles( float _posX, float _posY, float _id) 
  {
    posX = _posX;
    posY = _posY;
    id = _id;
    difference = 2;
    r = random(200, 222);
    g = random(174, 242);
    b = random(0, 255);
    o = random(40, 80);
    d = 10;
    etat = false;
  }

  void update() 
  {
    float distance = dist(mouseX, mouseY, posX, posY);
    limite = random(40, 80);

    if (distance < limite) 
    {
      float radians = atan2(mouseY-posY, mouseX-posX);
      radians += PI/1.5; //Fais tourner les lucioles quand on s'approche d'elles.
      posX = constrain (cos(radians)*10 + posX, 5, width); //Pour défnir la zone de constrain.
      posY = constrain (sin(radians)*10 + posY, 5, height);
    }

    if (mousePressed) 
    {
      limite = random(40, 80);
      println(limite);
      Ani.to(this, 0.9, "posY", mouseY, Ani.BACK_OUT); //Pour que les lucioles aillent vers la souris avec Ani.
      Ani.to(this, 0.9, "posX", mouseX, Ani.BACK_OUT);
    }
    
    xLuciole = constrain(posX, d/2, width-5); //Limites où les lucioles peuvent aller.
    yLuciole = constrain(posY, d/2, height-5);
    posX = xLuciole + random(-3, 3); //Pour que les lucioles bougent tout le temps.
    posY = yLuciole + random(-3, 3);
  }

  void afficher() 
  {
    fill(r, g, b); //Dessin des petites ellipses.
    ellipse(posX, posY, d/2, d/2);
    fill(r, g, b, o);
    ellipse(posX, posY, d, d);
  }
  

}



