
class Billy { //Classe Billy
  //Variables utilisés pour la classe Billy
  float posX, posY, w, h, largeurCorps, r, g, b, vitesse;

  //Le constructeur de Billy
  Billy () {
    posX=128; //position X
    posY=128; // position Y
    w=50; // longueur
    h=50;//hauteur
    largeurCorps=45;//largeur du corps de billy
    r=random(0,255);//affiche aléatoirement une couleur rouge de 0 à 255
    g=random(0,255);//affiche aléatoirement une couleur verte de 0 à 255
    b=random(0,255);//affiche aléatoirement une couleur bleu de 0 à 255
    vitesse= 0.1;// Vitesse de respiration de Billy
  }

  void jiggleBilly(){ //fonction du jigge de Billy
    if(mousePressed && mouseX < width && mouseY < height){//Si le bouton gauche de la souris est maintenu appuyé et que la souris en X et Y ne dépasse pas le cadre du projet... 
      posX = posX + random(-8,8);//...faites que Billy se déplace aléatoirement de droite à gauche d'une vitesse de -8 à 8.
      posY = posY + random(-8,8);//...faites que Billy se déplace aléatoirement de haut en bas d'une vitesse de -8 à 8.

      //On restreint Billy en l'empêchant de sortir du cadre du projet.
      posX = constrain(posX, 0, width-35);//
      posY = constrain (posY, 0, height-35);
    }
  }

  void respiration(){//Création d'une fonction qui permet à Billy de respirer
    largeurCorps = largeurCorps + vitesse; // Incrémente la largeur du corps de Billy d'une vitesse de 0.1
    h = h + vitesse;// Incrémente la hauteur de la bouche de Billy d'une vitesse de 0.1
    w = w + vitesse;// Incrémente la longueur du corps de Billy d'une vitesse de 0.1
    /*Si la largeur du corps de Billy devient plus grande que 48, et ou que la largeur du corps de Billy devient plus petite que 45, ou q
     e si la hauteur de la bouche de Billy devient plus grande que 51, et ou que la hauteur de la bouche de Billy devient plus petite que 50, et que si la longueur du corps de Billy devient plus grande que 51, et ou que la largeur du corps de Billy devient plus petite que 50... */
    if(largeurCorps > 48 || largeurCorps < 45 && h > 51 || h < 50 && w > 51 || w <50) {
      vitesse = vitesse * -1; // ...alors inverse la vitesse de -1 pour donner l'effet d'inspiration/expiration de Billy
    } 
  }

  void dessinerMonstre(){  
    //corps de Billy 
    stroke(0); // Affiche un contour noir.
    strokeWeight(1.5);  //affiche un contour plus épais.
    fill(31,118,40);  // rempli une partie du corps de Billy d'une couleur verte plus épaisse dans le but de créer une ombre.
    ellipse(posX,posY,w,largeurCorps);//Dessine un éllipse  

    noStroke(); //n'affiche pas de contours 
    fill(38,152,21); // rempli l'autre partie du corps de Billy d'une couleur verte plus pâle pour créer un dégraé de lumière entre l'éllipse précédente.
    ellipse(posX-2.5,posY,w-6,largeurCorps-5); //Dessine une autre éllipse plus petite par dessus la précédente.

    //oeil droit  
    if(mousePressed && mouseX < width && mouseY < height){//Si le bouton gauche de la souris est maintenu appuyé et que la souris en X et Y ne dépasse pas le cadre du projet... 
      noStroke(); //...alors n'affiche pas de contours 
      fill(240,223,31);  //rempli l'oeil droit en jaune
      ellipse(posX-10,posY,w/3,h/3);//dessine l'oeil droit de Billy pour cette condition.
    }
    else{//...sinon...
      noStroke();  //... n'affiche pas de contours
      fill(255);  // ... rempli les yeux en noirs
      ellipse(posX-10,posY,w/3,h/3);// dessine cet oeil droit si la condition n'a pas lieu.
    }

    //pupille droite  
    if(mousePressed && mouseX < width && mouseY < height){//Si le bouton gauche de la souris est maintenu appuyé et que la souris en X et Y ne dépasse pas le cadre du projet... 
      noStroke(); //...alors n'affiche pas de contours  
      /*...rempli la pupille droite aléatoirement soit d'une couleur rouge, bleu ou verte entre 0 et 255 à chaque cycle d'une façon aléato
       re. */
      fill(random(r),random(g),random(b)); 
      ellipse(posX-7,posY+2,w/5,w/5);//dessine une pupille pour l'oeil droit de Billy.
    }
    else{//...sinon...
      noStroke();//...alors n'affiche pas de contours   
      fill(0); //rempli d'une couleur noir 
      ellipse(posX-7,posY+2,w/5,w/5);  
    }  

    //oeil gauche  
    if(mousePressed && mouseX < width && mouseY < height){//Si le bouton gauche de la souris est maintenu appuyé et que la souris en X et Y ne dépasse pas le cadre du projet... 
      noStroke();  //...alors n'affiche pas de contours 
      fill(240,223,31); //... alors rempli l'oeil gauche d'une couleur jaune. 
      ellipse(posX+10,posY,w/3,h/3);//...dessine l'oeil gauche de Billy si la condition s'applique.
    }
    else{ //...sinon...
      noStroke(); //...alors n'affiche pas de contours  
      fill(255);  // ... rempli l'oeil d'une couleur blanche
      ellipse(posX+10,posY,w/3,h/3);//... dessine l'oeil gauche de Billy si la condition ne s'applique pas.
    }  

    //pupille gauche  
    if(mousePressed && mouseX < width && mouseY < height){//Si le bouton gauche de la souris est maintenu appuyé et que la souris en X et Y ne dépasse pas le cadre du projet... 
      noStroke();  //...alors n'affiche pas de contours 
      /*...rempli la pupille droite aléatoirement soit d'une couleur rouge, bleu ou verte entre 0 et 255 à chaque cycle d'une façon aléato
       re. */
      fill(random(r),random(g),random(b)); 
      ellipse(posX+7,posY+2,w/5,h/5);//...dessine la pupille gauche de Billy si la condition s'applique.
    }
    else{//...sinon...
      noStroke();  //...alors n'affiche pas de contours 
      fill(0); //...rempli d'une couleur noir. 
      ellipse(posX+7,posY+2,w/5,h/5);//... dessine la pupille gauche de Billy si la condition ne s'applique pas.
    }


    //bouche arrière plan 
    stroke(0); //rempli d'un contour noir 
    fill(31,118,40); //rempli d'une couleur verte foncée pour créer une ombre
    ellipse(posX,posY+17,w/2,h/2); //dessine une éllipse en arrière plan.
    //bouche avant plan
    noStroke(); // n'affiche pas de contours  
    fill(32,152,21);//remplir d'une couleur verte pâle pour créer un dégradé de couleur avec l'ellipse précédente.   
    ellipse(posX-1,posY+17,w/2-4,h/2-2); // dessine une éllipse plus petite en avant-plan. 
    //trou dans la bouche
    stroke(0); //rempli d'un contour noir 
    fill(0);  //rempli d'une couleur noir
    ellipse(posX,posY+17,w/4,h/4);//dessine le trou dans la bouche de Billy à l'aide d'une éllipse.

    //oeille droite
    fill(31,118,40);  // rempli d'une couleur verte foncée pour simuler une ombre
    bezier(posX+23,posY+11,posX+52,posY+22,posX+52,posY+22,posX+25,posY); // création d'une forme Bezier pour faire une oreille supérieure droite courbe 
    bezier(posX+23,posY-11,posX+52,posY-28,posX+52,posY-28,posX+25,posY);// création d'une forme Bezier pour faire une oreille inférieure droite courbe

    //oreille gauche
    fill(38,152,21);//rempli d'une couleur verte pâle .  
    bezier(posX-23,posY+10,posX-48,posY+22,posX-48,posY+22,posX-25,posY); // création d'une forme Bezier pour faire une oreille supérieure gauche courbe 
    bezier(posX-23,posY-10,posX-48,posY-28,posX-48,posY-28,posX-25,posY);  // création d'une forme Bezier pour faire une oreille supérieure gauche courbe   
  }

}









