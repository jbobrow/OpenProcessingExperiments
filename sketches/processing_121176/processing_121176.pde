
/* ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||Créateur de Constellation|||||||||||||||||||||
|||||||||||||||||||||||||||||PAR|||||||||||||||||||||||||||||||||
||||||||||||||||||||Marie-Noël Vanasse|||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||| Créez des constellations dans un ciel étoilé parsemé ||||||||
|||||||||||||| ||||||d'étoiles filentes ||||||||||||||||||||||||*/

//le code des étoiles filentes a été basé sur celui de Charlie McDowell
//www.openprocessing.org/sketch/41149



//DÉCLARATION DES VARIABLES 

/* tableau des postitions X et Y des étoiles qui serviront à remplir
   le fond d'étoile*/
etoile[] ciel = new etoile[5500];  //préparation du tableau qui contiendra toutes les étoiles (class etoile) sur le fond d'écran
ArrayList<constellation> creation;  // préparation du tableau qui contiendra les constellations terminées

ArrayList<float[]> currentConstellation;// préparation du tableau qui contiendra les valeurs des points X et Y pour la constellation en cours de construction

int closedDistance = 10; // variable de la distance approximative(10 pixels) pour savoir si on ferme la constellation ou on continue sa formation
// Déclaration des variables utilisées pour la Queue des étoiles filentes  

int[] filenteX = new int[30];  // préparation du tableau des positions X

int[] filenteY = new int[30];  // préparation du tableau des positions Y

int meteorite = 4; // taille initialede l'étoile filente 

float grandeurM = meteorite; // variable de la taille initiale qui se rapetissera  

   

// distance a shooting star moves each frame - varies with each new shooting star  

float delaiMeteorX, delaiMeteorY;   

//  Variable de départ de l'étoile filente pour que nous ne la voyons pas  

int departEF = -1;  

// variable des points de départ des étoiles filentes qui seront distribuées aléatoirement   

int startX, startY; 

/* création de la classe constellation qui sera utilisé dans le programme on y retrouve les mêmes informations que la fonction currentConstellation 
puisque celle-ci va se retrouver le tableau multiple de la classe constellation
*/

class constellation{// début du constructeur
  
  ArrayList<float[]> vertex;// préparation du tableau multiple du nom: vertex
  
  constellation(ArrayList<float[]> _vertex){// la fonction constellation contient un tableau multiple ayant le nom de _vertex (contient point X et Y)
    vertex = new ArrayList(_vertex);// appel du tableau multiple _vertex
  }// fin du constructeur
  
  void affichage(){// fonction de l'Affichage de constellation
    beginShape();
    for(int i = 0; i < vertex.size(); i++){ // boucle de lecture du tableau multiple vertex
      vertex(vertex.get(i)[0], vertex.get(i)[1]);   //lecture des deux tableaux contenant des valeurs X,Y.
      
      stroke(255,random(100,200));// lectures des ellipses aux points X et Y du tableau multiple
      strokeWeight(1);
      noFill();
      ellipse(vertex.get(i)[0], vertex.get(i)[1], 5, 5);
      
      noStroke();
      fill(255, random(100,255));
      ellipse(vertex.get(i)[0], vertex.get(i)[1], 4, 4);
    }
    noFill();
    stroke(255,200);
    endShape(CLOSE);// fermeture de la forme
  }// fin de la fonction
}
/*  Création de la classe etoile qui sera utilisée pour remplir le background d'étoile */

class etoile{// début du constructeur
  // déclaration des valeurs utilisées pour la construction de la classe
  float posX;
  float posY;
  int type;
  float brightness;
  float transparenceMin;
  int size;
  color coloration;
  
  etoile(int _type){ 
    type = _type;
        
        // création de deux types d'étoiles
    switch(type){   // permet de changer entre un type ou l'autre (comme la fonction else)
      case 0:
        brightness = 180;
        transparenceMin = 0;
        size = 1;
        break;// arrête la lecture de type 1
      case 1:
        brightness = 180;
        transparenceMin = 100;
        size = 2;
        break;// arrête la lecture de type 2
    }
    
    posX = random(width);
    posY = random(height);
    
    changeBrightness();
  }// fin du constructeur
  
  void changeBrightness(){// création de la fonction pour changer l'oppacité des étoiles
    coloration = color(brightness, random(transparenceMin, 255));
  }
  
  void affichage(){ // création de la fonctione affichage
    changeBrightness();
    noStroke();
    fill(coloration);
    ellipse(posX, posY, size, size);
  }
}// fin de la création de la classe etoile

void setup(){
  
  size(1000,1000);
  smooth();
  remplirRandom(5000); // fonction pour remplir le fond d'écran d'étoiles (deux types d'étoiles)
  
  creation = new ArrayList<constellation>();// création du tableau des constellations terminées
  currentConstellation = new ArrayList<float[]>();// création du tableau qui contiendra les valeurs(float) X, Y des points de la constellation en cours de formation
  
}// fin de setup

void draw(){
  background(0);

  // boucle pour implanter des étoiles cintillantes dans le tableau
  for( int i = 0; i < ciel.length; i ++){ // boucle de lecture du tableau ciel
    ciel[i].affichage();//appel de la fonction affichage des étoiles du tableau ciel
  } //fin de la boucle des étoiles
  
  for(int i = 0; i < creation.size(); i++){// boucle de lecture du tableau création ( constellations déjà créées
    creation.get(i).affichage();// appel de l'affichage des constellation dans le tableau création
  }
  
  drawCurrentConstellation();// appel de la fonction qui sert a dessiner les constellations points par points.
  
    // boucle pour dessiner les etoiles filentes  

  for (int i = 0; i < filenteX.length-1; i++) {  // création du tableau des points X de l'étoile filente

    int grosseurTraineEF = max(0,int(grandeurM*i/filenteX.length));  

    // Pour que la trainée disparaisse, il est important de lui mettre une condition pour la changer à "noStroke"  

    if (grosseurTraineEF > 0) {  

      strokeWeight(grosseurTraineEF);  

      stroke(255,150);  

    }// fin de la condition  

    else 
      noStroke();  

    line(filenteX[i], filenteY[i], filenteX[i+1], filenteY[i+1]);  

  }// fin de la boucle For  

  grandeurM*=0.9; // rappetisse l'étoile filente au fur et à mesure qu'elle avance  

     

  // boucle de lecture du tableau des étoiles filentes 

  for (int i = 0; i < filenteX.length-1; i++) {  

    filenteX[i] = filenteX[i+1];  

    filenteY[i] = filenteY[i+1];  

  } // fin de la boucle   

     

  // rajoute un nouveau point X Y de l'étoile filente tant et aussi longtemps qu'elle n'a pas complètement disparue  

  if (departEF >= 0 && departEF < filenteX.length*10) {  

    filenteX[filenteX.length-1] = int(startX + delaiMeteorX*(departEF));  

    filenteY[filenteY.length-1] = int(startY + delaiMeteorY*(departEF));  

    departEF++;  

    if (departEF >= filenteX.length*10) {  

      departEF = -1; // fin de l'étoile filente  

    }//fin de la condition 1  

  }//fin de la condition 2  
  

  // condition pour la création aléatoire de nouvelle étoiles filentes 

  if (random(10) < 1 && departEF == -1) {  

    nouvelleEtoileFilente();  

  }//fin de la condition 
}// fin de draw

//création de la fonction remplirRandom pour la création des étoiles en fond d'écran 
void remplirRandom(int _type0){
  for(int i = 0; i < ciel.length; i++){// boucle de lecture du tableau ciel pour remplir celui-ci de deux types d'étoiles dans deux tableaux différents
    if(i < _type0){
      ciel[i] = new etoile(0);
    } else {
      ciel[i] = new etoile(1);
    }
  }
}//fin de remplirRandom
  
//création de la fonction pour créer des constellations point par point
void drawCurrentConstellation(){
  for(int i = 0; i < currentConstellation.size(); i++){//boucle de lecture du tableau de currentConstellation composés d'ellipses et de lignes aux point X,Y de la souris
    stroke(255,random(100,200));
    strokeWeight(1);
    noFill();
    ellipse(currentConstellation.get(i)[0], currentConstellation.get(i)[1], 5, 5);
    
    noStroke();
    fill(255, random(100,255));
    ellipse(currentConstellation.get(i)[0], currentConstellation.get(i)[1], 4, 4);
    
    if(currentConstellation.size() > 0 && i > 0){ // condition pour dessiner une ligne entre deux points seulement si le deuxième point est dessiné
      noFill();
      stroke(255,200);
      line(currentConstellation.get(i - 1)[0], currentConstellation.get(i - 1)[1], currentConstellation.get(i)[0], currentConstellation.get(i)[1]);
    }//fin de la condition
  }//fin de la boucle
}// fin de la fonction Drawcurrentconstellation


// Débute une nouvelle étoile filente en choisissant des points de départ aléatoirement  

 void nouvelleEtoileFilente() {  

  int endX, endY;  

  startX = (int)random(width);  

  startY = (int)random(height);  

  endX = (int)random(width);  

  endY = (int)random(height);  

  delaiMeteorX = (endX - startX)/(float)(filenteX.length);  

  delaiMeteorY = (endY - startY)/(float)(filenteY.length);  

  departEF = 0; // débute l'étoile filente qui se termine en atteignant la fin du tableau filenteX 

  grandeurM = meteorite;  

   //boucle pour remplir le tableau de points X, Y aléatoirement  

  for (int i = 0; i < filenteX.length; i++) {  

    filenteX[i] = startX;  

    filenteY[i] = startY;  

  }//fin de la boucle  

} // fin de la fonction nouvelleEtoileFilente
 
/*déclaration de la méthode moussepressed qui détremine les actions  // utilisation de la fonction currentConstellation ci-haut
lorsque l'utilisatieur cliquera sur le bouton gauche de la souris*/
void mousePressed(){ 
  if(checkNear() == false){// condition si le résulat est faux, il ajoute une nouvelle case au tableau contenant les positions X, Y  des points
    currentConstellation.add(new float[2]);
    currentConstellation.get(currentConstellation.size() - 1)[0] = mouseX;
    currentConstellation.get(currentConstellation.size() - 1)[1] = mouseY;
  }
}

// fonction qui vérifie si le clique de la souris est près du premier point et retourne une réponse vrai ou faux
boolean checkNear(){
  boolean response;
  
  if(currentConstellation.size() > 0){ // condition pour faire la lecture en tout temps
    if(dist(currentConstellation.get(0)[0], currentConstellation.get(0)[1], mouseX, mouseY) <= closedDistance){ // condition si la distance entre les points X, Y dans le tableau currentConstellation et les points X,Y de la souris est plus petit ou égale à 10 pixels(closedDistance)
      response = true;// si c'est exact, 
      creation.add(new constellation(currentConstellation));// il va créer le tableau constellation et y implanter toutes les informations du tableau currentConstellation
      currentConstellation.clear();// et il va effacer les informations qui se retrouvent dans le tableau currentConstellation
    } else {
      response = false;// sinon la  réponse fausse 
    }
  } else {
    response = false;// et il va retourner une réponse fausse (qui va faire en sorte de continuer la constellation 
  }
  
  return response;// fin de la fonction de vérification
}

