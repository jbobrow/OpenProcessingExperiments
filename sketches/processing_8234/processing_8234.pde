
//variable définissant le format de la fenêtre . 
int sX=800;
int sY=600;

void setup(){
  size(sX,sY);
  background(255);
  noCursor();
  frameRate(30); 
}

//définition d'une variable qui servira à la modification du diamètre des ronds
int diametre=80;
//définition d'une variable qui servira à la modification du nb d'éléments!
int masseVisuelle=10;

void draw(){
  //on transforme la forme du curseur en croix
  cursor(CROSS);
  //antialiasing
  smooth();
  //presser la touche S pour sauvegarder
  if (keyPressed){
    if (key == 's' || key == 'S') {
      saveFrame();
      background(255);
    }
  }
  //presser la touche + pour augmenter la taille des ellipses
  if (keyPressed){
    if (key == '+') {
      diametre=diametre+5;
    }
  }
  //presser la touche - pour diminuer la taille des ellipses
  if (keyPressed){
    if (key == '-') {
      diametre=diametre-5;
    }
  }

  if (mousePressed == true) {
    masseVisuelle=10;
    //définition des boucles 
    for(float i=random(0,diametre); i<diametre; i=i+masseVisuelle){
      for(float j=random(0,diametre); j<diametre; j=j+masseVisuelle) {
        //épaisseur du contour
        strokeWeight(0.3);
        //couleur du contour!
        //couleur des ellipses en fonction de mouseY
        fill(mouseY*255/sY);
        //gestion du bug de sortie de fenêtre du curseur
        if(mouseY<0){
          fill(0);
          stroke(50);
        }
        //presser la touche * pour rendre les ellipses transparentes blanches
        if (keyPressed){
          if (key == '*') {
            fill(mouseY*255/sY,0);
            stroke(255,70);
          }
        }else{
        stroke(0,100);
        }
         //presser la touche / pour rendre les ellipses transparentes noires
        if (keyPressed){
          if (key == '/') {
            fill(mouseY*255/sY,0);
            stroke(0,60);
          }
        }else{
        stroke(0,100);
        }


        //presser la touche . rend les ellipses invisibles
        if (keyPressed){
          if (key == '.') {
            fill(mouseY*255/sY,0);
            stroke(0,0);

          }
        }
       
        //on dessine l'ellipse
        ellipse(mouseX-50+i,mouseY-50+j, random(0,i),random(0,i));
        
        //presser la touche . dessine des points
        if (keyPressed){
          if (key == '.') {
            //je change l'indice de masseVisuelle pour avoir plus de points  
            masseVisuelle=2;
            stroke(0,100);
            //épaisseur et couleur du point
            strokeWeight(1);
            //on dessine les points
            point(mouseX-random(0,200)+i,mouseY-random(0,200)+j); 
          }
        }

      }
    }
  }
}











