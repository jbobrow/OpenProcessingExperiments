
/************************************
Evelyne Dufresne
EDM4600-50
TP2-Tapisserie

2011-02-25
*************************************/

// Déclaration des variables
PVector vRandomTemp,vRandomTemp2; // vecteurs temporaire
PVector vRandom1,vRandom2,vRandom3,vRandom4; // vecteurs random 
PVector vPt0Pt1,vPt0Pt2,vPt0Pt3,vPt0Pt4;// vecteur reliant les points voisins au point central
float x1,x2,x3,x4;//coordonées en X des points entourant x0
float y1,y2,y3,y4;//coordonées en Y des points entourant y0
float prodScalaire01,prodScalaire02,prodScalaire03,prodScalaire04;// Produit scalaire de chaque points
float fR1, fR2, fX0; // variables sevant à effectuer l'interpolation au point X0

PImage textureUtilise;//texture courante
PImage[] imgTAB = new PImage[6];//tableau contenant l'ensemble des images

void setup()
{
  size(300,300,P3D); // Dimensions de la fenêtre
  smooth();
  
  //Loader les images dans le tableau
  imgTAB[0] = loadImage("texture01.jpg");
  imgTAB[1] = loadImage("texture02.jpg");
  imgTAB[2] = loadImage("texture03.jpg");
  imgTAB[3] = loadImage("texture04.jpg");
  imgTAB[4] = loadImage("texture05.jpg");
  imgTAB[5] = loadImage("texture06.jpg");
  
  textureUtilise = imgTAB[0]; //Texture attribuée par défaut
 
}

void draw()
{
  // Texture a appliquer
    keyPressed();

//Afficher chaque point du Canevas  
  for(int i=0; i<300; i++)
  {
    for(int j=0; j<300; j++)
    {
     // calcul de la valeur du bruit au point i,j
     fX0 = valeurBruit(i,j,mouseX,mouseY);
     
     //Affichage du point
     color cx = textureUtilise.get(floor((i+random(0.65,1)*mouseX)%400),floor((j+random(0.65,1)*mouseY)%400));//Trouver la couleur d'un pixel dans la région de la souris
     
     float facteur=100;
     stroke(red(cx)+floor(facteur*fX0),green(cx)+floor(facteur*fX0),blue(cx)+floor(facteur*fX0));//couleur donnée au pixel en considérant la texture et le bruit calculé en ce point
     point(i,j,floor(random(20)));//dessiner le point. La valeur en Z permet des transitions plus douces entre les textures.
  
    }
  }
}

/*------------------------------------------------------------
Fonction retournant un vecteur quelconque pour un point donné
--------------------------------------------------------------*/
PVector vecteurRandom(float x1, float y1, float x2, float y2)
{
  float rand2= random(150);
 //Générer un point quelconque aux alentours de la souris
  float PtRandomX = random(x2-rand2,x2+rand2);
  float PtRandomY = random(y2-rand2,y2+rand2);
  float vLongueur;
  
  //Calcul de la longueur du vecteur
  vLongueur = sqrt(pow(PtRandomX - x1,2)+pow(PtRandomY - y1,2));
  
 //Calcul du vecteur normalisé
  vRandomTemp = new PVector((PtRandomX - x1)/vLongueur, (PtRandomY - y1)/vLongueur);
  
  return vRandomTemp;
}

/*----------------------------------------------------------------
Fonction retournant un vecteur reliant le voisin au point central
------------------------------------------------------------------*/
PVector vecteurP0(float x1, float y1, float x2, float y2)
{
  float vLongueur;
  
  //Calcul de la longueur du vecteur
  vLongueur = sqrt(pow(x2 - x1,2)+pow(y2 - y1,2));
  //Calcul du vecteur normalisé
  vRandomTemp2 = new PVector((x2-x1)/vLongueur, (y2-y1)/vLongueur);
  
  return vRandomTemp2;
}

/*------------------------------------------------------------
    Fonction retournant le produit scalaire de 2 vecteurs
--------------------------------------------------------------*/
float prodScalaire(PVector v1, PVector v2)
{
  float resultat;
  //Calculer le produit scalaire
  resultat= (v1.x * v2.x) + (v1.y * v2.y);

  return resultat;

}
/*-------------------------------------------------------------
        Trouve la valeur du bruit en x0
---------------------------------------------------------------*/
float valeurBruit(int i, int j, int x, int y)
{
      //définition des coordonnées en X des points entourant x0
      x1=i-1;
      x2=i+1;
      x3=i-1;
      x4=i+1;
      //définition des coordonnées en Y des points entourant y0
      y1=j-1;
      y2=j-1;
      y3=j+1;
      y4=j+1;
     
     //Association d'un vecteur random associé à chaque point 
     vRandom1 = vecteurRandom(x1,y1, x, y);
     vRandom2 = vecteurRandom(x2,y2,  x, y);
     vRandom3 = vecteurRandom(x3,y3,  x, y);
     vRandom4 = vecteurRandom(x4,y4,  x, y);
     
     //Calcul des vecteurs points voisins-point central
     vPt0Pt1 = vecteurP0( i, j, x1, y1);
     vPt0Pt2 = vecteurP0( i, j, x2, y2);
     vPt0Pt3 = vecteurP0( i, j, x3, y3);
     vPt0Pt4 = vecteurP0( i, j, x4, y4);
     
     //Calcul du produit scalaire donnant la valeur du bruit perlin estimé en chaque point.
     prodScalaire01 = prodScalaire(vRandom1, vPt0Pt1);
     prodScalaire02 = prodScalaire(vRandom2, vPt0Pt2);
     prodScalaire03 = prodScalaire(vRandom3, vPt0Pt3);
     prodScalaire04 = prodScalaire(vRandom4, vPt0Pt4);
     
     //Interpolation bilinéaire du bruit perlin au point (x0,y0)
      // estimation inférieure
     fR1 = ((x4-i)/(x4-x3))*prodScalaire03 +((i-x3)/(x4-x3))*prodScalaire04;
     // estimation supérieur
     fR2 = ((x4-i)/(x4-x3))*prodScalaire01 +((i-x3)/(x4-x3))*prodScalaire02;
     //estimation en x0
     fX0 = ((y1-j)/(y1-y3))*fR1+((j-y3)/(y1-y3))*fR2;
     
     return fX0;
}

/*-----------------------------------------
Changement d'image en utilisant le clavier
-------------------------------------------*/
void keyPressed()
{
  //Changer de texture en fonction de la touche pesée (Touches 1 à 6 inclusivement.  
  switch(keyCode)
     {
       case(49):
         textureUtilise = imgTAB[0];
         break;
       case(50):
         textureUtilise = imgTAB[1];
         break;
       case(51):
         textureUtilise = imgTAB[2];
         break;
       case(52):
         textureUtilise = imgTAB[3];
         break;
       case(53):
         textureUtilise = imgTAB[4];
         break;   
       case(54):
         textureUtilise = imgTAB[5];
         break;            
   }
}


