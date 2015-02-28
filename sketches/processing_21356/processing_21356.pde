
    /*****************************************
    Auteur: Dan Rousseau
    TP2 - Tapisserie visuelle interactive
    
    -- Instructions --
    Sans action: Dessin automatique
    Clique-gauche: Dessin manuel
    Clique-droit: Change aléatoirement la dimension des carrés
    Touche Effacer: Efface tous les carrés
    Touches 0 à 9: Sélectionne précisément une autre image
    Touche Espace: Sélectionne l'image suivante
  *****************************************/
  
  //************ Déclaration et assignation des variables ***********//
  int lengthArray = 10;
  PImage[] img = new PImage[lengthArray]; // Contient l'images
  color pxCouleur; // Couleur du pixel sélectionné
  int indexArray,dimension,vitesse,x,y,posX,posY; //Index de l'array img, Dimension du rect(), vitesse de défillement, position X et Y du pixel sélectionné
  //--*****************************************************************
  
  
  //**************************** setup() ***************************//
  void setup(){
    size(400,400);
    smooth();
    noStroke();
    for(int i = 0; i < lengthArray; i++){
      img[i] = loadImage("img_" + i + ".jpg");
    }
    indexArray = 1;
    image(img[indexArray],0,0); 
    
    dimensionAleatoire(); // Changement aléatoire de la dimension;
    vitesse = 1;
    posX = posY = 0;
  }
  
  
  //**************************** draw() ***************************//
  void draw(){
    if(mousePressed){
      if(mouseButton == LEFT){
        //Dessin manuel
        x = floor(mouseX/dimension)*dimension;
        y = floor(mouseY/dimension)*dimension;
      }
    }else{
      //Dessin automatique
      x = posX;
      y = posY; 
      posX = posX + dimension;
      
      //Il ne faut pas que posX et posY dépasse les limites de la fenetre
      if(posX > width){posX = 0;posY = posY + dimension;} // Axe X
      
      if(posY > (height)){ //Axe Y
        posX = posY = 0; //si l'axe des Y est dépassé, retour au début (0,0)
        dimensionAleatoire(); // Changement aléatoire de la dimension
      }
    }
    
    pxCouleur = img[indexArray].get(x,y); // Récupérerla couleur du pixel sélectionné dans l'image
    fill(pxCouleur); // Le remplissage des formes se fait avec la couleur du pixel sélectionné
    
    if(frameCount % vitesse == 0) rect(x,y,dimension,dimension); 
  }
  
  
  //**************************** mousePressed() ***************************//
  void mousePressed(){
    if(mouseButton == RIGHT) dimensionAleatoire(); // Changement aléatoire de la dimension
  }
  
  
  //**************************** keyPressed() ***************************//
  void keyPressed(){
    if(keyCode == BACKSPACE){ // SI la touche enfoncée est l'espace
      image(img[indexArray],0,0);
      posX = posY = 0;
      dimensionAleatoire(); // Changement aléatoire de la dimension
    }
    
    //Changer d'image selon les touches(0 à 9) du clavier ----ASCII -->48 à 57 ou KeyPad --> 96 à 105
    for(int i = 0; i < lengthArray; i++){
       if(keyCode >= 48 && keyCode <= 57) indexArray = (keyCode-48); // Donner la valeur 0 à 9 selon le code ASCII
       if(keyCode >= 96 && keyCode <= 105) indexArray = (keyCode-96); // Donner la valeur 0 à 9(keyPad) selon le code ASCII
    }
    
    if(keyCode == 32){ // SI la touche enfoncée est l'espace, prendre l'image suivante dans le array d'images
      indexArray =  (indexArray < lengthArray-1) ? indexArray = indexArray + 1 : 0;
    }
  }
  
  
  //************************ dimensionAleatoire() ************************//
  void dimensionAleatoire(){
      dimension = int(random(5,25)); // La dimension du rectangle est modifiée aléatoirement
  }
  
  


