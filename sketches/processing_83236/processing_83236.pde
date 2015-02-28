
void setup(){
  size(500,500);
  background(0);
  
}

void draw(){
  
  //coordonnée par random 
int j = (int)random(0, 500);//coordonnée x ou y fixe
int k = (int)random(0, 250);//coordonnée x ou y "mobile"
int l = (int)random(0, 500);



  if (mousePressed && (mouseButton == LEFT) && key == 'v') {//Constructeur de lignes verticales
      
      //relance à chaque fois des coordonnées aléatoire
      j = (int)random(0, 500);
      k = (int)random(0, 250);
      l = (int)random(0, 500);

      stroke(13+j, 4+k,l);

      line(j,l,j,l+k);




    }

  if (mousePressed && (mouseButton == LEFT) && key == 'h') {//Constructeur de lignes horizontales
    j = (int)random(0, 500);
    k = (int)random(0, 250);
    l = (int)random(0, 500);
     stroke(56+l, 6+j, k);
    line (l, j, l+k, j);

  }


  if (mousePressed && (mouseButton == LEFT) && key == 'b') {//Constructeur de lignes verticales et horizontales
    j = (int)random(0, 500);
    k = (int)random(0, 250);
    l = (int)random(0, 500);
    stroke(200-j+k, 80-k, l);
    line (l, j, l+k, j);
    line (j, l, j, l+k);
  }
}





void keyPressed() {  
  if (key == 's') {//s pour sauvegarde
    saveFrame("ligne###.jpg");
  }
  if (key == ' '){//espace pour remise à 0
    background (0);
  }
}
