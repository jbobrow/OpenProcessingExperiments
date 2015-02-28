
import ddf.minim.*;//pour le son
Minim minim;// pour le son
AudioPlayer player;//pour le son

class polybase {


  float bx;
  float by;
  float br;
  int bn;
  color couleur;
  boolean affiche;

  polybase(float tempbx, float tempby, float bradius, int bside, color tempColor) {

    bx= tempbx;
    by= tempby;
    br= bradius;
    bn= bside;
    couleur = tempColor;
    affiche = false;
  }

  // Taille de départ

  void display() {
    if (affiche) {
      float angle = 360.0/bn;   // Forme Hexagone
      fill(couleur);
      beginShape();   // Permet la création d'une forme
      for (int j =0; j<bn; j++) {
        vertex(bx + br * cos(radians(angle  * j)), 
        by + br * sin(radians(angle  * j)));
      }
      endShape(CLOSE);   // Permet de fermer la fonction beginShape et d'écrire dans la mémoire tampon de l'image la forme.
    }
  }
  void taille() {   // Gerre l'apparition des hexagone, leur taille min et max

    br = br+0.45;   // Temps de zoom
    if (br<=0) {   // Taille limite de l'hexagone

      // br = random(5);   // Gerre la taille de base, quand l'hexagone est rendu a son maxi, il redemarre a la taille défini (et peux mettre réduir encore ex: random (25)-10;
      // br = br+1;   // Évolution de l'hexagone
    }
    if (br>=30) {
      br = 30;   // Taille final de l'hexagone
    }
  }
}

polybase[][] mybase1 = new polybase[8][19];
polybase[][] mybased1 = new polybase[8][19];
PImage bg; 
int cols =8;   // alignement horizontale
int rows=19;   // aligement verticale
float angle;
int choixC = 0;   
int choixL = 0;
int compteur = 0;

// Couleur : action par Obama :
color reTweetParObama = color(118, 191, 46, 200);   // Retweet par Obama
color favoriserParObama = color(255, 155, 0, 200);   // Favorisé par Obama
color tweetParObama = color(24, 157, 206, 200);   // Tweet par Obama
color mentionParObama = color(150, 4, 27, 200);   // Mentionné par Obama

// Couleur : action par un autre profil :
color reTweetParAutreProfil = color(143, 69, 249, 200);   // Retweet par un autre profil
color favoriserParAutreProfil = color(0, 0, 0, 200);   // Favorisé par un autre profil
color tweetParAutreProfil = color(255, 255, 255, 200);   // Tweet par un autre profil
color mentionParAutreProfil = color(140, 198, 215, 200);   // Mentionné par un autre profil

void setup() {
  
 minim = new Minim(this); //pour lire le son
player = minim.loadFile("coeur2.mp3");//ouvrir le fichier mp3
player.play();//pour que le son soit joué

  
  ArrayList<Integer> maListeDeCouleurs = new ArrayList<Integer>();
  maListeDeCouleurs.add(color(118, 191, 46, 150));
  maListeDeCouleurs.add(color(255, 155, 0, 150));
  maListeDeCouleurs.add(color(24, 157, 206, 150));
  maListeDeCouleurs.add(color(140, 198, 215, 150));
  maListeDeCouleurs.add(color(150, 4, 27, 150));
  maListeDeCouleurs.add(color(51, 51, 51, 150));
  maListeDeCouleurs.add(color(0, 0, 0, 100));
  maListeDeCouleurs.add(color(255, 255, 255, 100));

  size(674, 916);   // Taille de la fenêtre (Taille de l'image 674,916)

  bg = loadImage("Barack.jpg");   // Image de fond d'écran

  frameRate(10);   // Image par seconde
  smooth();   // lissage de la géométrie
  noFill();   // Pas de couleur

  //

  mybase1 = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      color aColor = maListeDeCouleurs.get(int(random(0, maListeDeCouleurs.size())));
      mybase1[k][l] = new polybase (k*3*30+(2*30*cos(radians(60))), l*2*30*sin(radians(60)), 15, 6, aColor);
    }
  }

  mybased1 = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      color aColor = maListeDeCouleurs.get(int(random(0, maListeDeCouleurs.size())));
      mybased1[k][l] = new polybase (k*3*30-(30*cos(radians(60))), l*2*30*sin(radians(60))+30*(sin(radians(60))), 15, 6, aColor);
    }
  }
}


void draw() {
 
  background(bg); 
  for (int k = 0; k < cols; k++) {
    for (int l = 0; l < rows; l++) {
      fill(2, 98, 130, 200);   // Couleur de l'hexagone + opacité
      strokeWeight(0);   // Épaisseur du contour de l'hexagone
      stroke(150);   // Couleur du contour      
      mybase1[k][l].display();
      mybase1[k][l].taille();
      mybased1[k][l].display();
      mybased1[k][l].taille();
      if (compteur < 16) {
        int c = int(random(16));
        println(c);
        choixC = (int)random(8);
        choixL = (int)random(19);
        if (c == 0) {   // Choix n°1
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = reTweetParObama;
          }
        }
        if (c == 1) {   // Choix n°2
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = favoriserParObama;
          }
        }
        if (c == 2) {   // Choix n°3
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = tweetParObama;
          }
        }
        if (c == 3) {   // Choix n°4
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = mentionParObama;
          }
        }
        if (c == 4) {   // Choix n°5
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = reTweetParAutreProfil;
          }
        }
        if (c == 5) {   // Choix n°6
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = favoriserParAutreProfil;
          }
        }
        if (c == 6) {   // Choix n°7
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = tweetParAutreProfil;
          }
        }
        if (c == 7) {   // Choix n°8
          if (mybase1[choixC][choixL].affiche != true) {
            mybase1[choixC][choixL].affiche = true;
            mybase1[choixC][choixL].couleur = mentionParAutreProfil;
          }
        }
        if (c == 8) {   // Choix n°9
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = reTweetParObama;
          }
        }
        if (c == 9) {   // Choix n°10
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = favoriserParObama;
          }
        }
        if (c == 10) {   // Choix n°11
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = tweetParObama;
          }
        }
        if (c == 11) {   // Choix n°12
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = mentionParObama;
          }
        }
        if (c == 12) {   // Choix n°13
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = reTweetParAutreProfil;
          }
        }
        if (c == 13) {   // Choix n°14
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = favoriserParAutreProfil;
          }
        }
        if (c == 14) {   // Choix n°15
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = tweetParAutreProfil;
          }
        }
        if (c == 15) {   // Choix n°16
          if (mybased1[choixC][choixL].affiche != true) {
            mybased1[choixC][choixL].affiche = true;
            mybased1[choixC][choixL].couleur = mentionParAutreProfil;
          }
        }
        else {
          choixC = (int)random(8);
          choixL = (int)random(19);
        }
        compteur ++;
       // println("test  " + compteur);
      }
    }
  }
  compteur = 0;
}


void keyPressed()
{
  if (key == 'l') loop();

  if (key == 'p')noLoop();

  if (key == 's')saveFrame("resultat_" + millis() + ".png");
}

void stop(){
player.close();
minim.stop();
super.stop();
}



