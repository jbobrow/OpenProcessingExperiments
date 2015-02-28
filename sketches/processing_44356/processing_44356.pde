
// blondeausophie@gmail.com
// Syntaxe Processing version 1.5.1
// vendredi, 23 septembre 2011

/*Inspirations:
http://www.mattrunks.com/video/universaleverything/mtv_surprise_x_1000_jewels_and_oil.png
http://www.flickr.com/photos/pcolacino/3114670950/
http://farm5.static.flickr.com/4143/5395438075_2ef5151ed9.jpg

http://openprocessing.org/visuals/?visualID=3897
*/
import controlP5.*;
public ControlP5 controlleur;


/*-----Déclaration des variable -----*/
public float positionX,positionY;
//Variables innitiales
public int grosseur=2;
public int intervalle=grosseur*30;
public int couleur=255;

void setup() 
{  
  //Déclaration de la grandeur de la scène
  size(450,400);
  background(0);
  smooth();
  fill(255);
  
  /*---Control P5 slider---*/
  controlleur = new ControlP5(this);
  controlleur.addSlider("grosseur",1, 10, 2,10, 10, 200, 10);  
  controlleur.addSlider("couleur",0, 255, 255,10, 20, 200, 10);  
}

void draw() {
  //S'assurer que l'intervalle modifie avec la grosseur courante
  intervalle=grosseur*30;
  fill(0);
  noStroke();
  noFill();
  //Modulo du framecount qui permet de sortir une frame sur 4(ralentir le ratio)
  if(frameCount%4==0)
  {
    for(int i=1; i<2; i++)
    {
      //Création du background random
      fill(random(255),random(255),random(255),random(95,100));
      rect(random(width),random(height),random(width/2),random(height/2));
      fill(random(255),random(255),random(255),random(10,30));
      rect(0,0,width,height);

    }
  }
  
//Créer les ellipses avec une fonction paramètrable
createEllipse(intervalle,grosseur,couleur);
}

void createEllipse(int intervalle,int grosseur,int couleur)
{
  //S'assure d'étendre les cercles sur la grandeur et largeur du size en fonction de l'intervalle et la grosseur
  for(int w=0;w<width+(grosseur*2);w+=intervalle)
    {
      for(int h=0;h<height+(grosseur*2);h+=intervalle)
      {
        fill(couleur,couleur,couleur,random(5,10));
        
        //map(value, low1, high1, low2, high2)
        //Va chercher la variance des cercles, en allant chercher la position de la souris ,lui assigne 0 comme minimum, et hauteur ou largeur du stage en fonction de x ou y, tout en mettant une limite de 0 à 100
        positionX = map(mouseX,0,width,0,100);
        positionY = map(mouseY,0,height,0,100);
        
       //Crée les cercles en fonction de la grosseur et de la position
        ellipse(w,h,(grosseur*positionX/2), (grosseur*positionY/2));
      }
    }
}
 

