
// Kristine Bergeron
// TP4 - Jeu
// remerciement à tout ceux de la classe qui on essayés de m'aider :P
// remerciement à Maxime Garrant et Jeff Dupuis. 
// inspiration Simon says & mama says

// déclaration des variables
int clickCount = 0;
int spaceCount = 0;
int timer = 0;
int player1 = 0;
int player2 = 0;
int player3 = 0;
int KristeenPosition;
int compteur;
PFont directive, kristeen;
PImage bg;
int scene = 1;
int score = 0;


void setup() {
  bg = loadImage("bg.jpg");
  image(bg,0,0);
  size(400, 400);
  colorMode (RGB); 
  smooth();
  stroke(0);
  strokeWeight(8);
  KristeenPosition = int(random(2,3));
 directive = loadFont("directive.vlw");
  kristeen = loadFont("kristeen.vlw");
  textFont(directive);
  timer=180;
  
  for (int i = score; player1 == KristeenPosition ; i =+1);
  for (int i = score; player2 == KristeenPosition ; i =+1);
  for (int i = score; player3 == KristeenPosition ; i =+1);
  
}
 
void draw() {
 
  background(255);
  image(bg,0,0);


  // SITUATION DE DÉPART 
  if(scene == 1) {
  
 // DÉTERMINE LE TITRE DU JEU, LA COULEUR ET LA POSITION
 
    fill(100,255,192);
    textFont(kristeen,40);
    text("KRISTEEN TE DIS", width/2-150, height/2-150); // titre du jeu
    
   
    // DÉTERMINE LES INSTRUCITON DU JEU, SA COULEUR ET SA POSITION
    
    pushMatrix();
    translate(-120, 75);
    textFont(directive, 20); // détermine la police d'écriture
  
    fill(131,255,153);
    text("joueur 1:  contrôle avec le Z ", width/2-50, height/2+40);
    fill(230,75,255);
    text("joueur 2:  contrôle avec le B ", width/2-50, height/2+70);
    fill(255,255,255);
    text("joueur 3:  contrôle avec le M ", width/2-50, height/2+100);
    fill(255,255,255);
    text(" Directives: ", width/2-50, height/2-5);
 
    // INSTRUCTION POUR DÉMARER LE JEU
    
    fill(255,232,54);
    textFont(directive, 25);
    text(" CLIC pour jouer ", width/2-50, height/2-50);
    popMatrix();
    
    // ÉCRITURE DE L'INTRODUCTION ET EXPLICATION DU CONCEPT
    
    fill(0);
    translate(-145, 10);
    textFont(directive, 20);
    fill(0);
    text(" C'est moi le boss ", width/2-50, height/2-130);
    text("Change ta position afin d'être comme moi", width/2-50, height/2-110);
    text("Fais ce que je fais et tu gagneras! ", width/2-50, height/2-90);


 
  }
 // DÉTERMINE LES ÉLÉMENTS DU TIMER AVANT DE CHANGER DE POSITION
  
  // AFFICHAGE DES POINTS!!!!!!! 
  
  else if(scene == 2) {
    
    textFont(directive,20);
      fill(255);
  textAlign(LEFT);
  text("Joueur 1: "+score, width/2-190, height/2-170);
  if (player1 == KristeenPosition)


  
  // **************
  
  
  fill(255);
  textAlign(LEFT);
  text("Joueur 2: "+score, width/2-60, height/2-170);
  if (player2 == KristeenPosition)
  
  fill(255);
  textAlign(LEFT);
  text("Joueur 3: "+score, width/2+70, height/2-170);
  if (player3 == KristeenPosition)
  
 
    println(timer);
    textFont(directive, 48);
    
 
    if (timer > 5.5 * 60) {
      KristeenPosition = int(random(1,5));
      println("SWITCH! to " +KristeenPosition);
      timer = 0;
      player1 = 0;
      player2 = 0;
      player3 = 0;
    }
    else if (timer > 3 * 60 ) {
      endScreen();
    }
    else {
       
      pushMatrix();
      scale(1.25);
      translate(-80,0);
      fill(253,81,192);
      Kristeen(KristeenPosition);
      popMatrix();
 
      player1();
      player2();
      player3();
    }
    timer++;
  }
}
 

 
void mousePressed() { // passe du menu au jeu

  scene = 2;
}
void keyPressed() { // détermine les contrôles avec l'utilisation des touches du clavier
  if (key == 'z') { // determine que le joueur 1 va bouger quand on presse la touche z
    player1++;
    if (player1 == 5) {
      player1 = 0;
    }
  }
  else if (key == 'm') { // determine que le joueur 3 va bouger quand on presse la touche m 
    player3++;
    if (player3 == 5) {
      player3 = 0;
    }
  }
  else if (key == 'b') { // determine que le joueur 2 va bouger quand on presse la touche b
    player2++;
    if (player2 == 5) {
      player2 = 0;
    }
  }      

}
 
 
 
void endScreen() { 
  
  // determine les mots de félicitation quand un joueur gagne
     


  textFont(directive, 25);
  if (player1 == KristeenPosition) {
    println("player 1 wins");
    fill(255,234,36);
    text ("Good job #1 ", width/2-60, height/2+40);


  }
  if (player2 == KristeenPosition) {
    println("player 2 wins");
    fill(36,255,151);
    text (" WOW, bravo #2 ", width/2-60, height/2+40);
  }
  if (player3 == KristeenPosition) {
    println("player 3 wins");
    fill(218,144,255);
    text ("BIG WINNER #3!", width/2-60, height/2+40);
     
  }
  pushMatrix();
  scale(1.25);
  translate(-80,0);
  fill(253,81,192);
  Kristeen(0);
  popMatrix();
 
  player1();
  player2();
  player3();
 
  int countdown = ceil(map(timer, 3*60, 5.5*60, 5, 0));
  fill (0);
  text(countdown, width/2, height/2);
}
 
 
 
void Kristeen(int position) { // construction du corps et des membres mobiles
 
  strokeWeight(10);
  ellipse(230, 90, 45, 45);
 
  if (position == 0) { 
    
    strokeWeight(3);
    pushMatrix();
    translate(width/2-80,90); // definir les bras gauches pour la position 0
    line(50, 2, 90, 0);
    popMatrix();
  
    strokeWeight(3);
    pushMatrix();
    translate(width/2+80,90); // définir les bras droits pour la position 0
    rotate(radians(90));
    line(0, 30, 10, 0);
    popMatrix();
 
   
    strokeWeight(3);
    pushMatrix();
    translate(190,109); // definir les jambes pour la position 0
    line(35,0, 35,35);
    translate(10,0);
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 1) { // definir la position 1 a refaire
    
    strokeWeight(3);
    pushMatrix();
    translate(width/2-70,70); // definir les bras gauches de la position 1
    line(0, 60, 30, 80);
    popMatrix();
 
    strokeWeight(3);
    pushMatrix();
    translate(width/2+70+1,100); // definir les bras droits de la position 1
    rotate(radians(90));
    line(0, 30, 20, 0);
    popMatrix();

    
    strokeWeight(3);
    pushMatrix();
    translate(350,150); // definir les jambes de la position 1
    line(35,0, 35,35);
    translate(35,0);
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 2) { // definir la position 2
    
    strokeWeight(3);
    pushMatrix();
    translate(width/2-80,20); // definir les bras gauche de la position 2
    line(0, 60, 30, 80);
    popMatrix();
 
    strokeWeight(3);
    pushMatrix();
    translate(width/2+70,110); // definir les bras droite de la position 2
    rotate(-PI);
    line(0, 30, 20, 0);
    popMatrix();
 
    
    strokeWeight(3);
    pushMatrix();
    translate(350,150); // definir les jambes de la position 2
    line(35,0, 35,35);
    translate(35,0);
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 3) { // definir la position 3
    
    strokeWeight(3);
    pushMatrix();
    translate(width/2-80,20); // definir les bras gauches de la position 3
    line(0, 60, 30, 80);
    popMatrix();
 
    strokeWeight(3);
    pushMatrix();
    translate(width/2+70,110); // definir les bras droits de la position 3
    rotate(-PI);
    line(0, 30, 20, 0);
    popMatrix();
 
    
    strokeWeight(3);
    pushMatrix();
    translate(350,150); // definir les jambes de la position 3
    line(35,0, 35,35);
    popMatrix();
    pushMatrix();
    translate(350+55,150+20);
    rotate(radians(-50));
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 4) { // détermine la position 4
    
    strokeWeight(3);
    pushMatrix();
    translate(width/2-80,20); // determine les bras gauche de la position 4
    line(0, 60, 30, 80);
    popMatrix();
 
    strokeWeight(3);
    pushMatrix();
    translate(width/2+70,110); // determine les bras droit de la position 4
    rotate(-PI);
    line(0, 30, 20, 0);
    popMatrix();
 
    
    strokeWeight(3);
    pushMatrix();
    translate(350-10,150-38); // determine les jambes de la position 4
    rotate(radians(50));
    line(35,0, 35,35);
    popMatrix();
    pushMatrix();
    translate(350+55,150+20);
    rotate(radians(-50));
    line(35,0, 35,35);
    popMatrix();
  }
}
 
 
 // reproduction des positions de 0 a 4 selon le nombre de fois appuyé sur la touche. 
 // definition des position pour les joueurs 1 2 et 3
void player1() { 
 
  pushMatrix();
  translate(-150, 200);
  fill(64, 219, 168);
  Kristeen(player1);
  popMatrix();
   
}
 
 
 
void player2() {
  pushMatrix();
  translate(-30, 200);
  fill(200,190,160);
  Kristeen(player2);
  popMatrix();
}
 
 
 
void player3() {
  pushMatrix();
  translate(100, 200);
  fill(0,160,250);
  Kristeen(player3);
  popMatrix();
}




