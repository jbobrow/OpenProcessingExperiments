
//TABLEAU : ARRAY 2D

//par Guillaume Perreault Roy

//je me fais une belle coquille, ce sketch se limite À:
//GRAPHIQUE_ANALYSE

final int INTRODUCTION = 0;
final int WHATEVER = 1;
final int BOF = 2;
final int VOIRE = 3;
final int GRAPHIQUE_ANALYSE = 4;

// Variable pour la gestion des etats.
int etat = GRAPHIQUE_ANALYSE;

//je déclare toutes mes valeurs, j'ai mis mes initiales dedans 
//éviter les conflits quand on va merger les sketches

int gpr_j = 40;//valeur générique pour les boucles ''for''
int gpr_k = 0;//valeur générique pour les boucles ''for''
float gpr_float =0; //valeur générique pour mémoriser des floats
float gpr_float2 =0; //valeur générique pour mémoriser des floats
int gpr_analyse =0;//passe d'un mode d'analyse à l'autre
int gpr_personnes = 16;//déclare le nombre de personnes
int gpr_data = 2;//déclare le nombre de données
//Array principal
float[][] gpr_monArray = new float[gpr_personnes][gpr_data];
//Array copié et destructible, propre à des modifications sans perte des données premières
float[][] gpr_monArrayCopie = new float[gpr_personnes][gpr_data];

void setup() {

  size(400, 400);
  background (170);

  //Je remplit chaque personne d'un certain nombre de données
  //données entre 0.0 et 9.9

  for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
    for (int gpr_k = 0;gpr_k < gpr_data; gpr_k++) {
      gpr_monArray[gpr_j][gpr_k] = random(10)/10;
    }
  }
}

//Mon void draw ne sert À RIEN D'AUTRE que d'aiguiller 
//d'un void à l'autre


void draw() {

  if ( etat == INTRODUCTION ) {
    introduction();
  } 
  else if ( etat == GRAPHIQUE_ANALYSE) {
    graphique_analyse();
  }
}

// void introduction pas fait, pas grave on y va jamais!

void introduction() {
}

//TOUT ce qui se passe dans le sketch est là 

void graphique_analyse() {

  background (170);

  //Ça dessine le tableau, y'a rien là!
  stroke (150);
  for (int gpr_k = 40; gpr_k < 241; gpr_k = gpr_k+20) {
    for (int gpr_j = 40; gpr_j < 341; gpr_j = gpr_j+20) {
      line(gpr_j, 40, gpr_j, 240);
    }
    line(40, gpr_k, 340, gpr_k);
  }

  if (gpr_analyse == 0) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("On voit le premier data pour les 16 personnes, ils sont générés random", 25, 255);
    text("les valeurs vont de 0.00 à 0.99", 25, 270);

    //Dessine les lignes d'évolution des valeurs
    stroke (0);

    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArray [gpr_k][0])*200), 60+(gpr_k*20), 240 - ((gpr_monArray [gpr_k+1][0])*200));
    }
  }

  if (gpr_analyse == 1) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("Meme premier data, mais les 16 personnes sont placées en ordre ascendant", 25, 255);

    //Transfère les données de l'array Principal à l'Array copie
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      for (int gpr_k = 0;gpr_k < gpr_data; gpr_k++) {
        gpr_monArrayCopie[gpr_j][gpr_k] = gpr_monArray[gpr_j][gpr_k];
      }
    }
    //Classe les personnes par ordre croissant
    for (int gpr_j = 0; gpr_j < gpr_personnes-1;gpr_j++) {
      for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
        if ((gpr_monArrayCopie [gpr_k][0]) > (gpr_monArrayCopie [gpr_k+1][0])) {
          gpr_float = (gpr_monArrayCopie [gpr_k+1][0]);
          (gpr_monArrayCopie [gpr_k+1][0]) = (gpr_monArrayCopie [gpr_k][0]);
          (gpr_monArrayCopie [gpr_k][0]) = gpr_float;
        }
      }
    }

    //Dessine les lignes d'évolution des valeurs
    stroke (0);
    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k][0])*200), 60+(gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k+1][0])*200));
    }
  }

  if (gpr_analyse == 2) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("Encore classés en ordre ascendant, mais c'est la ", 25, 255);
    text(gpr_float2, 350, 270);
    text("PROXIMITÉ à la moyenne qui est affichée", 25, 270);

    //Transfère les données de l'array Principal à l'Array copie
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      for (int gpr_k = 0;gpr_k < gpr_data; gpr_k++) {
        gpr_monArrayCopie[gpr_j][gpr_k] = gpr_monArray[gpr_j][gpr_k];
      }
    }

    //Classe les personnes par ordre croissant
    for (int gpr_j = 0; gpr_j < gpr_personnes-1;gpr_j++) {
      for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
        if ((gpr_monArrayCopie [gpr_k][0]) > (gpr_monArrayCopie [gpr_k+1][0])) {
          gpr_float = (gpr_monArrayCopie [gpr_k+1][0]);
          (gpr_monArrayCopie [gpr_k+1][0]) = (gpr_monArrayCopie [gpr_k][0]);
          (gpr_monArrayCopie [gpr_k][0]) = gpr_float;
        }
      }
    }

    //Obtient la moyenne de tout les data 1
    gpr_float = 0;
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      gpr_float =gpr_float + gpr_monArrayCopie[gpr_j][0];
    }

    gpr_float2 = gpr_float / gpr_personnes;
    println(gpr_float2);


    //Transforme le data 1 en proximité de la moyenne
    for (int gpr_k = 0;gpr_k < gpr_personnes; gpr_k++) {
      if (gpr_monArrayCopie[gpr_k][0] > gpr_float2) {
        gpr_float = gpr_monArrayCopie[gpr_k][0] - gpr_float2;
      }
      if (gpr_monArrayCopie[gpr_k][0] <= gpr_float2) {
        gpr_float = gpr_float2 - gpr_monArrayCopie[gpr_k][0];
      }
      gpr_monArrayCopie[gpr_k][0] = 1- (gpr_float*1.5);
      println(gpr_float);
    }

    //Dessine les lignes d'évolution des valeurs
    stroke (0);
    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k][0])*200), 60+(gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k+1][0])*200));
    }
  }

  if (gpr_analyse == 3) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("On voit le deuxième data pour les 16 personnes, ont peut", 25, 255);
    text("visualiser les deux indépendamment", 25, 270);

    //Dessine les lignes d'évolution des valeurs
    stroke (0);

    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArray [gpr_k][1])*200), 60+(gpr_k*20), 240 - ((gpr_monArray [gpr_k+1][1])*200));
    }
  }

  if (gpr_analyse == 4) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("Deuxième data, mais les 16 personnes sont placées en ordre ascendant", 25, 255);

    //Transfère les données de l'array Principal à l'Array copie
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      for (int gpr_k = 0;gpr_k < gpr_data; gpr_k++) {
        gpr_monArrayCopie[gpr_j][gpr_k] = gpr_monArray[gpr_j][gpr_k];
      }
    }
    //Classe les personnes par ordre croissant
    for (int gpr_j = 0; gpr_j < gpr_personnes-1;gpr_j++) {
      for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
        if ((gpr_monArrayCopie [gpr_k][1]) > (gpr_monArrayCopie [gpr_k+1][1])) {
          gpr_float = (gpr_monArrayCopie [gpr_k+1][1]);
          (gpr_monArrayCopie [gpr_k+1][1]) = (gpr_monArrayCopie [gpr_k][1]);
          (gpr_monArrayCopie [gpr_k][1]) = gpr_float;
        }
      }
    }

    //Dessine les lignes d'évolution des valeurs
    stroke (0);
    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k][1])*200), 60+(gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k+1][1])*200));
    }
  }

  if (gpr_analyse == 5) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("Encore classés en ordre ascendant, mais c'est la ", 25, 255);
    text(gpr_float2, 350, 270);
    text("PROXIMITÉ à la moyenne qui est affichée", 25, 270);

    //Transfère les données de l'array Principal à l'Array copie
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      for (int gpr_k = 0;gpr_k < gpr_data; gpr_k++) {
        gpr_monArrayCopie[gpr_j][gpr_k] = gpr_monArray[gpr_j][gpr_k];
      }
    }

    //Classe les personnes par ordre croissant
    for (int gpr_j = 0; gpr_j < gpr_personnes-1;gpr_j++) {
      for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
        if ((gpr_monArrayCopie [gpr_k][1]) > (gpr_monArrayCopie [gpr_k+1][1])) {
          gpr_float = (gpr_monArrayCopie [gpr_k+1][1]);
          (gpr_monArrayCopie [gpr_k+1][1]) = (gpr_monArrayCopie [gpr_k][1]);
          (gpr_monArrayCopie [gpr_k][1]) = gpr_float;
        }
      }
    }

    //Obtient la moyenne de tout les data 1
    gpr_float = 0;
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      gpr_float =gpr_float + gpr_monArrayCopie[gpr_j][1];
    }

    gpr_float2 = gpr_float / gpr_personnes;
    println(gpr_float2);


    //Transforme le data 1 en proximité de la moyenne
    for (int gpr_k = 0;gpr_k < gpr_personnes; gpr_k++) {
      if (gpr_monArrayCopie[gpr_k][1] > gpr_float2) {
        gpr_float = gpr_monArrayCopie[gpr_k][1] - gpr_float2;
      }
      if (gpr_monArrayCopie[gpr_k][1] <= gpr_float2) {
        gpr_float = gpr_float2 - gpr_monArrayCopie[gpr_k][1];
      }
      gpr_monArrayCopie[gpr_k][1] = 1- (gpr_float*1.5);
      println(gpr_float);
    }

    //Dessine les lignes d'évolution des valeurs
    stroke (0);
    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k][1])*200), 60+(gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k+1][1])*200));
    }
  }

  if (gpr_analyse == 6) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("On voit l'addition des 2 datas pour les 16 personnes, ont peut", 25, 255);
    text("observer des résultats plus près de la moyenne", 25, 270);

    //Dessine les lignes d'évolution des valeurs
    stroke (0);

    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - (((gpr_monArray [gpr_k][0]) + (gpr_monArray [gpr_k][1]))*100), 60+(gpr_k*20), 240 - (((gpr_monArray [gpr_k+1][0]) + (gpr_monArray [gpr_k+1][1]))*100));
    }
  }

  if (gpr_analyse == 7) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("Deuxième data, mais les 16 personnes sont placées en ordre ascendant", 25, 255);


    //Transfère les données de l'array Principal à l'Array
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      for (int gpr_k = 0;gpr_k < gpr_data; gpr_k++) {
        gpr_monArrayCopie[gpr_j][gpr_k] = gpr_monArray[gpr_j][gpr_k];
      }
    }
    //Compile les 2 datas dans l'espace du premier
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      gpr_monArrayCopie[gpr_j][0] = (gpr_monArrayCopie[gpr_j][0] + gpr_monArrayCopie[gpr_j][1])/2;
    }
    //Classe les personnes par ordre croissant Data_1
    for (int gpr_j = 0; gpr_j < gpr_personnes-1;gpr_j++) {
      for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
        if ((gpr_monArrayCopie [gpr_k][0]) > (gpr_monArrayCopie [gpr_k+1][0])) {
          gpr_float = (gpr_monArrayCopie [gpr_k+1][0]);
          (gpr_monArrayCopie [gpr_k+1][0]) = (gpr_monArrayCopie [gpr_k][0]);
          (gpr_monArrayCopie [gpr_k][0]) = gpr_float;
        }
      }
    }

    //Dessine les lignes d'évolution des valeurs
    stroke (0);
    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k][0])*200), 60+(gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k+1][0])*200));
    }
  }

  if (gpr_analyse == 8) {

    textAlign(LEFT);
    textSize(10);
    fill(0);
    text("C'est la partie intéressante, est-ce qu'on voit les ", 25, 255);
    text(gpr_float2, 350, 270);
    text("exceptions s'estomper", 25, 270);

    //Transfère les données de l'array Principal à l'Array
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      for (int gpr_k = 0;gpr_k < gpr_data; gpr_k++) {
        gpr_monArrayCopie[gpr_j][gpr_k] = gpr_monArray[gpr_j][gpr_k];
      }
    }
    //Compile les 2 datas dans l'espace du premier
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      gpr_monArrayCopie[gpr_j][0] = (gpr_monArrayCopie[gpr_j][0] + gpr_monArrayCopie[gpr_j][1])/2;
    }
    //Classe les personnes par ordre croissant Data_1
    for (int gpr_j = 0; gpr_j < gpr_personnes-1;gpr_j++) {
      for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
        if ((gpr_monArrayCopie [gpr_k][0]) > (gpr_monArrayCopie [gpr_k+1][0])) {
          gpr_float = (gpr_monArrayCopie [gpr_k+1][0]);
          (gpr_monArrayCopie [gpr_k+1][0]) = (gpr_monArrayCopie [gpr_k][0]);
          (gpr_monArrayCopie [gpr_k][0]) = gpr_float;
        }
      }
    }

    //Obtient la moyenne des deux datas
    gpr_float = 0;
    for (int gpr_j = 0; gpr_j < gpr_personnes; gpr_j++) {
      gpr_float =gpr_float + gpr_monArrayCopie[gpr_j][0];
    }

    gpr_float2 = gpr_float / gpr_personnes;
    println(gpr_float2);


    //Transforme l'adéquation des 2 datas en proximité de la moyenne
    for (int gpr_k = 0;gpr_k < gpr_personnes; gpr_k++) {
      if (gpr_monArrayCopie[gpr_k][0] > gpr_float2) {
        gpr_float = gpr_monArrayCopie[gpr_k][0] - gpr_float2;
      }
      if (gpr_monArrayCopie[gpr_k][0] <= gpr_float2) {
        gpr_float = gpr_float2 - gpr_monArrayCopie[gpr_k][0];
      }
      gpr_monArrayCopie[gpr_k][0] = 1- (gpr_float*1.5);
      println(gpr_float);
    }

    //Dessine les lignes d'évolution des valeurs
    stroke (0);
    for (int gpr_k = 0; gpr_k < gpr_personnes-1;gpr_k++) {
      line (40+ (gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k][0])*200), 60+(gpr_k*20), 240 - ((gpr_monArrayCopie [gpr_k+1][0])*200));
    }
  }



  //Dessine les boutons
  stroke (0);
  fill (255);
  rect(30, 280, 55, 35, 7);

  textAlign(CENTER, CENTER);
  textSize(12);
  fill(0);
  text("Data_1", 57, 295);

  fill (255);
  rect(30, 320, 55, 35, 7);

  fill(0);
  text("Courbe", 57, 335);

  fill (255);
  rect(30, 360, 55, 35, 7);

  fill(0);
  text("Cloche", 57, 375);

  fill (255);
  rect(100, 280, 55, 35, 7);

  textAlign(CENTER, CENTER);
  textSize(12);
  fill(0);
  text("Data_2", 127, 295);

  fill (255);
  rect(100, 320, 55, 35, 7);

  fill(0);
  text("Courbe", 127, 335);

  fill (255);
  rect(100, 360, 55, 35, 7);

  fill(0);
  text("Cloche", 127, 375);

  stroke (0);
  fill (255);
  rect(170, 280, 55, 35, 7);

  textAlign(CENTER, CENTER);
  textSize(12);
  fill(0);
  text("Data1+2", 197, 295);

  fill (255);
  rect(170, 320, 55, 35, 7);

  fill(0);
  text("Courbe", 197, 335);

  fill (255);
  rect(170, 360, 55, 35, 7);

  fill(0);
  text("Cloche", 197, 375);
}


void mousePressed() {

  if (mouseX >= 30 && mouseX <= 85 && mouseY >= 280 && mouseY <= 315) {
    gpr_analyse = 0;
  }
  if (mouseX >= 30 && mouseX <= 85 && mouseY >= 320 && mouseY <= 355) {
    gpr_analyse = 1;
  }
  if (mouseX >= 30 && mouseX <= 85 && mouseY >= 360 && mouseY <= 395) {
    gpr_analyse = 2;
  }
  if (mouseX >= 100 && mouseX <= 155 && mouseY >= 280 && mouseY <= 315) {
    gpr_analyse = 3;
  }
  if (mouseX >= 100 && mouseX <= 155 && mouseY >= 320 && mouseY <= 355) {
    gpr_analyse = 4;
  }
  if (mouseX >= 100 && mouseX <= 155 && mouseY >= 360 && mouseY <= 395) {
    gpr_analyse = 5;
  }
  if (mouseX >= 170 && mouseX <= 225 && mouseY >= 280 && mouseY <= 315) {
    gpr_analyse = 6;
  }
  if (mouseX >= 170 && mouseX <= 225 && mouseY >= 320 && mouseY <= 355) {
    gpr_analyse = 7;
  }
  if (mouseX >= 170 && mouseX <= 225 && mouseY >= 360 && mouseY <= 395) {
    gpr_analyse = 8;
  }
}
