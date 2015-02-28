
class Coeur{

  float posX;
  float posY;
  float grosseurwDroit;
  float grosseurhDroit;
  float grosseurwGauche;
  float grosseurhGauche;
  float speed;
  float max_distance;


  Coeur(){
    posX = 128;
    posY = 128;
    speed = 1;
    grosseurwDroit = 128;
    grosseurhDroit = 128;
    grosseurwGauche = 128;
    grosseurhGauche = 128;
    max_distance = dist(0, 0, width, height);


  }

  void display(){
    fill(160,15,15);
    stroke(124,4,4);
    strokeWeight(2.5);
    bezier(posX,posY-25,grosseurwDroit+50,grosseurhDroit-65,grosseurwDroit+70,grosseurhDroit-20,posX,posY+40);
    bezier(posX,posY-25,grosseurwGauche-50,grosseurhGauche-65,grosseurwGauche-70,grosseurhGauche-20,posX,posY+40);
    noStroke();
    fill(206,8,8);
    bezier(posX-2,posY-25,grosseurwDroit+40,grosseurhDroit-60,grosseurwDroit+65,grosseurhDroit-20,posX,posY+40);
    bezier(posX,posY-25,grosseurwGauche-50,grosseurhGauche-65,grosseurwGauche-70,grosseurhGauche-20,posX,posY+40);

  } 

  void respiration(){
    if (mousePressed){
      grosseurwDroit = grosseurwDroit + speed;
      grosseurwGauche = grosseurwGauche - speed;
      if(grosseurwDroit > 130 || grosseurwDroit < 125 ){
        speed = speed * -1;
      }  

    }
  }

  void backgrounds (){
    fill(160,15,15);
    stroke(124,4,4);
    strokeWeight(2.5);

    //boucle 1 Ã  30 horizontalement
    for(int i = 0; i <= width; i += 30) {
      //boucle 1 a 30 verticalement
      for(int j = 0; j <= height; j += 30) {
        float size = dist(mouseX, mouseY, i, j);
        size = size/max_distance*15;
        //crÃ©er un cercle Ã  chaque itÃ©ration plus petit selon la position de la souris
        ellipse(i,j,size,size);
      }
    }
  }
}





