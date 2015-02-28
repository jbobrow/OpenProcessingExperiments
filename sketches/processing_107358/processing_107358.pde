
/*--------------------------------------------------------------------------------------------------------------------------------------------------
"Générateur de "lignes" de lignes colorées"
Réalisé par Kanapech

Version 0.01 - Samedi 03/08/2013 - 02h14 - Programme de base
----------------------------------------------------------------------------------------------------------------------------------------------------
Ce petit programme génère des "lignes" de lignes colorés et produit des images en boucle (.png).
--------------------------------------------------------------------------------------------------------------------------------------------------*/

float a = random (20, 80); // Nombre aléatoire : Probabilité 1
float b = random (20, 80); // Nombre aléatoire : Probabilité 2
float j = 0; //Voir void draw()
float k = 10; //Nombre de "divisions" de l'image. Voir void draw()
float x = 0; // Position sur l'axe X
float col1 = random(255); // Teinte aléatoire 1
float col2 = random(255); // Teinte aléatoire 2
int nombreimg = 1; // Numéro de la première image
int nombreimglimit = 10; // Nombre d'images à générer et numéro de la dernière image

// ------------------------------------------------------------------------------------------

void setup() {

  frameRate(500);
  size(300, 300);
  background(0);
  colorMode(HSB); // Mode de couleur HSB : Hue (Teinte), Saturation, Brightness (Luminosité)
}

// ------------------------------------------------------------------------------------------

void draw() {

  line(x, j, x, (j-3)+(height/k)); // Ligne : x1, y1, x2, (y2-correction y)+(hauteur/nombre de divisions)
  x+= 2; // Vitesse de déplacement
  strokeWeight(3); // Epaisseur de la ligne

  if (random(100)> a) { // Première probabilité
    if (random(100)> b) { // Si première proba vraie : seconde probabilité
      stroke(col1, 255, 255); // Si première et seconde proba vraies : couleur de la ligne (teinte aléatoire 1, saturation max, luminosité max)
    }
    else {
      stroke(col2, 255, 255); // Si première proba vraie mais deuxième fausse : couleur de la ligne (teinte aléatoire 2, saturation max, luminosité max)
    }
  }
  else {
    stroke(col1, 255, 200);// Si deux proba fausses
  }

  if (x == width) { // Si position x de la ligne = largeur
    //background(0);
    col1 = random(255); // Changement teinte aléatoire 1
    col2 = random(255); // Changement teinte aléatoire 2
    x = 0; // Remise à zéro de x
    a = random (20, 80); // Changement nombre a (proba 1)
    b = random (20, 80); // Changement nombre b (proba 2)
    j += (j+height/k)-j; // Nouvelle "ligne" de lignes (décalage y)
  }


  if (j == height) { // Si la "ligne" de lignes est arrivée en bas de l'image
    saveFrame("img"+nombreimg+".png"); // Sauvergarde de l'image (img-numéro_de_l'image.png
    j = 0; // Une nouvelle "ligne" de lignes se positionne tout en haut de l'image
    background(0); // On efface tout !!!
    nombreimg ++; // On rajoute 1 au compteur d'image, pour que l'image suivante soit numéroté avec le numéro suivant
  }

  if (nombreimg == nombreimglimit+1) { // Si le numéro de l'image actuelle est égale à la limite d'images à générer + 1 (afin de terminer la dernière image)
    noLoop(); // Fin de la boucle
    exit(); // Fermeture du programme. Taaadaaaam :) !
  }
}



