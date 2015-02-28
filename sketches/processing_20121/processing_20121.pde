
/*****************************************
  Auteur: Dan Rousseau
  TP1 - Création d'un monstre interactif
*****************************************/

//************ Déclaration et assignation des variables ***********//
float posX = 200; // Position X de la souris
float posY = 60; // Position Y de la souris
float initialPosX = 200; // Position initiale X du personnage
float initialPosY = 60; // Position initiale Y du personnage
float iWeight = 12; // Épaisseur de la corde soutenant le personnage
int diametreCorps = 100; // Diamètre du corps du personnage
float couleurPerso = 0; // Couleur du personnage
float bouchePosY = 40; //Position des deux vertex du centre de la bouche du personnage
int extYeux = 17; // Grosseur des yeux (contour noir) du personnage
int intYeux = 15;  // Grosseur des yeux (intérieur blanc) du personnage
float grossirYeux = 0; // Valeur additionné à la grosseur des yeux lorsque le personnage est étiré
float corpsEtirement = 0; // Height du corps du personnage
float rotationPerso; // Rotation du personnage
float vibration = 0; // Intensité de la vibration du personnage selon l'axe des Y
float vitesseX; //Vitesse de l'axe X de l'effet Bouncing lorsqu'on released la souris
float vitesseY; //Vitesse de l'axe Y de l'effet Bouncing lorsqu'on released la souris
//--*****************************************************************

void setup(){
  size(400,400);
  smooth();
  colorMode(HSB);
}

void draw(){
  
  background(50);
  
  //Lorsque le clique de la souris est enfoncé, mettre la position de la souris dans les variables posX et posY
  if(mousePressed){
    
    // Détecter le mouseOver sur le personnage cercle
    float distance = dist(mouseX,mouseY,posX,posY);
    if ( distance < (diametreCorps-20) ) {

        // mouseOver
        posX = int(random(mouseX-vibration,mouseX+vibration)); // Position random sur l'axe des X + ou - 5 selon au mouseX
        posY = int(random(mouseY-vibration,mouseY+vibration)); // Position random sur l'axe des X + ou - 5 selon au mouseY
    }else{
      bouncing(); // Appel de la fonction personnalisée Bouncing();
    }
  }else{
    bouncing(); // Appel de la fonction personnalisée Bouncing();
  }
  
  //Modification dynamique de certaines variables
  iWeight = constrain((350-posY)/20,2,25); // Épaisseur de la ligne soutenant le personnage et contrainte  
  corpsEtirement = map(posY,0,height,1,40); // Étirement du corps selon sa position sur l'axe des Y
  bouchePosY = 55-map(dist(posX,posY,initialPosX,initialPosY),0,height,10,50); // Position des vertex du centre de la bouche selon leur position sur l'axe des Y
  rotationPerso = atan2(posY,posX-(width/2)) - HALF_PI; // Rotation du corps selon sa position sur l'axe des X
  couleurPerso = map(dist(posX,posY,initialPosX,initialPosY),50,360,0,255); // La couleur du personnage passe de 0 à 255 en mode HSB (Blanc à rouge) selon la position Y
  vibration = map(dist(posX,posY,initialPosX,initialPosY),50,360,0,5); // Selon la position Y du personnage, ce dernier vribrera de plus en plus
 
  // Corde soutenant le personnage
  strokeWeight(iWeight);
  line(200,-10,posX,posY);
  
  pushMatrix(); // Ouverture pushMatrix ***************************************************
    translate(posX,posY); // On positionne le personnage en premier
    rotate(rotationPerso); // On fait une rotation du canevas pas la suite
    strokeWeight(5);
    fill(0,couleurPerso,255);
    ellipse(0,0,diametreCorps-(corpsEtirement/2),diametreCorps+corpsEtirement); // Corps du personnage qui s'allonge selon sa position Y
    
    //Yeux du personnage
    strokeWeight(2);
    fill(0);
    grossirYeux = corpsEtirement/2; // Faire grossir les yeux selon l'étirement du corps
    ellipse(-20,-10,extYeux+grossirYeux,extYeux+grossirYeux); // Contour noir Oeil gauche
    ellipse(20,-10,extYeux+grossirYeux,extYeux+grossirYeux); // Contour noir Oeil droite
    
    fill(255);
    ellipse(-20,-10,intYeux+grossirYeux,intYeux+grossirYeux); // Intérieur blanc Oeil gauche
    ellipse(20,-10,intYeux+grossirYeux,intYeux+grossirYeux); // Intérieur blanc Oeil droite
    
    fill(0);
    ellipse(-20,-10,2,2); // Pupille gauche
    ellipse(20,-10,2,2); // Pupille droite

    // Bouche du personnage
    beginShape();
      curveVertex(-20,27);
      curveVertex(-20,27);
      curveVertex(-8,bouchePosY);
      curveVertex(8,bouchePosY);
      curveVertex(20,27);
      curveVertex(20,27);
    endShape(CLOSE);
  popMatrix(); // Fermeture popMatrix ***************************************************  
}

void mousePressed(){
 //println("Clique x: "+ mouseX + " y " + mouseY);
}

//************ Fonction personnalisée ***********//
//Fonction qui fait le Bounce du personnage
void bouncing(){
  //Effet de bouncing
  float k = 0.05;
  float d = 0.9;
  float accelerationX = k * (initialPosX - posX);
  float accelerationY = k * (initialPosY - posY);
  vitesseX = d * (vitesseX + accelerationX);
  vitesseY = d * (vitesseY + accelerationY);   
  posX = posX + vitesseX;   
  posY = posY + vitesseY;
}


