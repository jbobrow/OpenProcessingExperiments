
/*
************************************
Vincent Labelle
TP2 - tapisserie
EDM 4600
Inspiration : Thomas O. Fredericks - http://www.openprocessing.org/visuals/?visualID=18329
*************************************
*/


// declaration des variables :
float colonnes = 2;
float rangees = 2;


PImage img;
PImage img2;

void setup(){
   
  size(400,400,P3D);// taille de la scene

  noStroke();
   
  img = loadImage("vinyl.png"); // importer image vinyle
  img2 = loadImage("dj.png"); // importer image DJ


  textureMode(NORMALIZED); // mode d application des textures 
   
}
void draw(){
  background(img2); // image du DJ en arriere-plan


  float largeurColonne = width/colonnes; // largeur des colonnes
  float hauteurRangee = height/rangees; // hauteur des rangees 
   

  for(int c=0;c<colonnes;c++){   // nombre de colonnes colonnes

    for(int r=0;r<rangees;r++){     //nombre de rangees rangees
     
      pushMatrix(); // commence a dessiner les elements de la boucle
      translate(c*(largeurColonne),r*(hauteurRangee)); // decale les boucles
      
       float v = atan2(mouseX-c*largeurColonne*0.02,mouseY-r*hauteurRangee*0.02); // la distorsion suit le mouvement de la souris 

      skewY(v); // tord sur l axe des X
      skewX(v); // tord sur l axe des Y
      rotate(v);
      beginShape(); // dessine la forme des vinyls
      texture(img); // applique la texture aux vinyls
      

        vertex(0,0,0,0,0);
        vertex(largeurColonne,0,0,1,0);
        vertex(largeurColonne,hauteurRangee,0,1,1);
        vertex(0,hauteurRangee,0,0,1);

            
      endShape(); // arrete de dessiner
      popMatrix(); // sors de la boucle et repars au debut
    }
  }
   
}
 
 
void mousePressed() { // permet de changer le nombre de rangees et de colonnes au clic de la souris 
 colonnes = (int)random(1,80);
 rangees = (int)random(1,80);

 
}

