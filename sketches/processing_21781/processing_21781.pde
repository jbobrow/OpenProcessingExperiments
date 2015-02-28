
/***************************************
 Auteur: Lasfra karim                  
 TP2 - tapisserie visuelle
 Cours: EDM4600
 ****************************************/


int images = 3;// maximum d images a etre dans la composition
PImage[] img = new PImage[images];// Variable qui contient les 3 images
int index; // Variable qui contient un chiffre relie a chaque image
int taille = 8; // Dimensions des pixels de taille maximal
int colones; // Variable pour les colones
int rangee;  // Variable pour les rangees
float vibe=0; // Variable servant pour le mouvement des pixels en axe z
boolean click = false; // Variable servant pour le clic de la souris


void setup() {
  size(400, 400, P3D); // taille de la scene avec l axe des z en plus
  for(int i = 0; i < images; i++) {// boucle qui charge les images 0 a 2 (3 images)
    img[i] = loadImage("img_" + i + ".jpg");
  }
  
  index = 0;// chiffre attribue a l image
  image(img[index],0,0); // chargement de l image et placement de celle-ci
  colones = img[index].width / taille;  // Calcul le # de colones
  rangee = img[index].height / taille;  // Calcul le # de rangees
}



void draw() {
  background(0); //couleur du fond d'écran
  if (click==true && vibe<= 900) {
    vibe+=5;//vitesse de z en aval
  }
  else if(click==false) {
    if (vibe>0) {
      vibe-=5;//vitesse de z en amont
    } 
  }//Fin de la fonction servant a verifer l'état du clic
// Debut boucle des colones
  for ( int i = 0; i < colones; i++) {
    // Debut boucle des rangees
    for ( int e = 0; e < rangee; e++) {
      int x = i*taille + taille/2;  // position des pixels sur l axe des x
      int y = e*taille + taille/2;  // position des pixels sur l axe des y
      int loc = x + y*img[index].width;  // Chaque pixels prend en charge une partie de l image 
      color c = img[index].pixels[loc];  // Chaque pixels prend la couleur de l image

      if (mousePressed) {


        // Calcul la  position z avec la fonction mousePressed, le width , la variable vibe et la saturation de l image
        // Inspiration de l exemple File>Examples>3D>Image>Explode
        float z = (vibe /  float(width)) * saturation(img[index].pixels[loc]);// le depart en position des pixels de l image
        // Fin Inspiration de l exemple File>Examples>3D>Image>Explode
        pushMatrix();
        translate(x, y, z);
      }else {
        // Calcul la  position z avec la fonction mousePressed, le height , la variable vibe et la saturation de l image
        // Inspiration de l exemple File>Examples>3D>Image>Explode
        float z = (vibe /  float(height)) *  saturation(img[index].pixels[loc]);// le retour en position des pixels de l image
        // Fin Inspiration de l exemple File>Examples>3D>Image>Explode
        pushMatrix();
        translate(x, y, z);
     
      } 
      //creation et placement des carres de pixels dans la composition
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, map(constrain(mouseX,0,width),0,width,1,taille),map(constrain(mouseX,0,width),0,width,1,taille)); // le mouseX controle la taille des carres (pixels)
      popMatrix();
    }// Fin boucle des colones
  }// Fin boucle des rangees


  //Chanmgement de l'image lorsque les touches 1,2,3 sont activés 
  if (keyPressed) {
    if(key == '2') {
      index=1;//Image Florence
    }
    if(key == '1') {
      index=0;//Image Karim
    }
    if(key == '3') {
      index=2;//Image Simon
    }
  }
}






void mousePressed() {
  click=true;// verification que le click est activé et mise en oeuvre du deplacement des pixels
  println("Clique: x "+mouseX+" y "+mouseY); //imprime le click de la souris
}

void mouseReleased() {
  click=false;// verification que le click est desactivé et mise en oeuvre de la remise en état de l image
}


