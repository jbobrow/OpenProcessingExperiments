

/**
Auteur      : Reda Radi
<br />
Descriptif  : Engin Génératif qui utilise le flux video et audio de la webcam 
<br />
<br />
<a rel="license" href="http://creativecommons.org/licenses/by/2.5/ca/"><img alt="Creative Commons License" style="border-width:0" src="http://creativecommons.org/images/public/somerights20.png" /></a>
*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                              //
//         XXXXXXXXXXXXX        //  
//         XX   XXX   XX        //  
//         XX   XXX   XX        //  Auteur  : Radi Reda
//         XXXXXXXXXXXXX        //  Date    : 09/10/2011
//           XXXXXXXXX          //  License : Creative Commons Attribution-Noncommercial-Share Alike 2.5 Canada Version 1
//          XX  XXX  XX         //  Resume  : Engin Génératif qui utilise le flux video et audio de la webcam 
//         XXX  XXX  XXX        //  
//        XXX   XXX   XXX       //                      
//                              //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////
// Librairies //
////////////////

import processing.opengl.*; // inportation de la librarie OpenGL
import processing.video.*; // importation de la librairie Video
import ddf.minim.*; // importation de la librairie Audio

////////////////////////
// Variables Globales //
////////////////////////

int l = 900; // largeur du sketch // 1124
int h = 746; // hauteur du sketch
Capture video; // déclaration de ma vidéo
int[][] values; // déclaration tableau 2 dimension
Minim son; // variable de stockage de l'input audio
AudioInput in; // variable de gestion de l'input audio

////////////////////////////
// Creation de la Fenetre //
////////////////////////////

void setup () 
{

  size(l,h,OPENGL); // taille et mode de la fenetre
  hint(ENABLE_OPENGL_4X_SMOOTH); // antialliasing 
  hint(DISABLE_OPENGL_ERROR_REPORT); // Speeds up the OPENGL renderer setting by not checking for errors while running.
  //frameRate(30); // nombre d'images par seconde
  //noCursor();// pas de curseur
  colorMode(HSB); // mode de couleur Hue, Saturation, Brightness
  video = new Capture(this, 300, 300, 15); // paramétrage de la taille et le frame rate de la vidéo
  values = new int[video.width][video.height]; // tableau à la taille de la vidéo pour stocker les positions des pixels 
  son = new Minim(this); // déclaration de la variable de stockage du son
  son.debugOn(); 
  in = son.getLineIn(Minim.STEREO, 512); // assignation de l'input audio à l'objet sonore
  
}

////////////////////////////////
// Fonction de Dessin en Loop //
////////////////////////////////

void draw () 
{
    background(255); // couleur de l'arriére plan

   //////////////////////// 
   // gestion de l'audio //
   ////////////////////////
 
  for(int i = 0; i < in.bufferSize() - 1; i++)
  { 
    fill(abs(in.left.get(i)*500),100,240,50); // variation de la couleur de la scéne grâce au changement de'amplitude du son dans le canal gauche
    rect(0,0,l,h); // dessin d'un qui couvre toute la scéne     
  }
    translate(width/2,height/2,0); // redéfinition du centre de la scéne 
 
/*
    ////////////////////////
    // dessine axes X,Y,Z //
    ////////////////////////
    
    stroke(255,0,0);
    line(-100, 0, 0, 100, 0, 0); // axe X
    stroke(0,255,0);
    line(0, -100, 0, 0, 100, 0); // axe Y
    stroke(0,0,255);
    line(0, 0, -100, 0, 0, 100); // axe Z
    noStroke();
*/  
    //println("images par seconde "+": "+frameRate); // impréssion du frame rate 
    //println("postion X de la souris "+": "+mouseX+" "+"position Y de la souris "+": "+mouseY); // impréssion de la position de la souris
     


    /////////////////////////
    // gestion de la video //
    /////////////////////////   
 
   if (video.available()) // si la vidéo est disponible
   {
     video.read(); // lire la vidéo
     video.loadPixels(); // charger l'ensemble des pixels du vidéo dans un tableau
   } 



  for (int y = 0; y < video.height; y++)
  {
    for (int x = 0; x < video.width; x++)
    {
      values[x][y] =  video.get(x, y) & 0xFF;
    }
  }   
  
   for (int y = 0; y < video.height; y++)
   {
    for (int x = 0; x < video.width; x++)
    {    
      
     // haut droit
       
     pushMatrix();
     translate(0,-200,0);
     rotateX(radians(-90));
     stroke(values[x][y]);
     point(x,-y, values[x][y]);
     popMatrix();
  
      // haute gauche
           
      pushMatrix();
      translate(0,-200,0);
      rotateX(radians(90));
      rotateY(radians(-180));
      stroke(values[x][y]);
      point(x,y, values[x][y]);
      popMatrix();
     
      // bas droit
      
      pushMatrix();
      translate(0,200,0);
      rotateX(radians(90));
      stroke(values[x][y]);
      point(x,y,values[x][y]);
      popMatrix();

     // bas gauche  
  
      pushMatrix();
      translate(0,200,0);
      rotateX(radians(-90));
      rotateY(radians(-180));
      stroke(values[x][y]);
      point(x,-y, values[x][y]);
      popMatrix();
      
    }
   }

  
  
 } 


void stop()
{
  in.close(); // ferme le canal audio
  son.stop(); // arrete de stocker dans un espace memoire le flux sonore
  
  super.stop();
}

void mousePressed()
{
 sauvegardeImg("seconde","tiff");
}

