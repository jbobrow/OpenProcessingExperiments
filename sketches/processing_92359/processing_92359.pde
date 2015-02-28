
float x; //centre, axe x
float y; //centre, axe y
float ybb ; // bas de la bouche, axe y
float pdby ; //paupière du bas, axe y
int etatBouche; //état de la bouche, axe y
int tDepart; //départ de la minuterie
int tEcoule; //temps écoulé de la minuterie depuis tDepart
float flash; //activation du flash si le bout de sa queue est touché


void setup() {
  size(400, 400); //Taille de la fenetre.
  frameRate(30); //Nombre d'images/seconde.
  smooth(); //Lisser les formes dessinées.

  x = width*0.5; //centre, axe x
  y = height*0.5; //centre, axe y
  flash = 0; //activation du flash si le bout de la queue est touché
  tEcoule = int(random(500, 3000)); //temps de la minuterie: entre 0.5 et 3 secondes
}


void draw() {
  background(255); //Remplir l'arrière-plan en blanc.

  //ajout sin pour montée et descente du monstre dans l'eau, axe y
  y = height*0.5+ sin(frameCount*0.1)*15; //centre, axe y
  //note: fonction sin ajoutée à pdby dans bloc "forme : paupière droite du bas" dans void draw 

  //le monstre se dédouble et oscille d'avantage si flash activé
  if (flash==1) {
    x = (1/x)*10000+200; 
    x=x+cos(frameCount*0.9)*15;
    y=y+sin(frameCount*0.9)*30;
  }
  else {  
    flash=0;
    x = ((width*0.5)-x)*0.1+x; //retour au centre assoupli après animation
  }

  ybb = y; //lier variable ybb à y
  //montée et descente du monstre dans l'eau pendant sa nage, axe y
  pdby = y+ sin(frameCount*0.1)*0.05; 


  //CORPS ET PATTES---------------------------------------------------------------------------
  //zone interactive circulaire active flash
  float distance = dist(mouseX, mouseY, (x+70), (y-105)+ cos(frameCount*0.2)*30); 
  if (distance < 12.5) { 
    flash = 1;
    tDepart = tDepart + tEcoule;
  }
  fill(20, 20, 100);
  ellipse(x+70, y-105 + cos(frameCount*0.2)*30, 25, 25);

  //l'animation s'arrete après 2sec
  if ( millis() - tDepart >= tEcoule ) { 
    flash = 0;
    tDepart = tDepart + tEcoule;
  }

  //forme : articulation5 avec fonction cos additionnée à y pour action de nager
  fill(#4d0000); 
  beginShape();  
  curveVertex(x+142, y-74 + cos(frameCount*0.2)*30); 
  curveVertex(x+56, y-60 + cos(frameCount*0.2)*30);
  curveVertex(x+38, y-72 + cos(frameCount*0.2)*30);
  curveVertex(x+51, y-91 + cos(frameCount*0.2)*30);
  curveVertex(x+71, y-106 + cos(frameCount*0.2)*30);
  curveVertex(x+73, y-80 + cos(frameCount*0.2)*30);
  curveVertex(x+56, y-60 + cos(frameCount*0.2)*30);
  curveVertex(x+31, y-56 + cos(frameCount*0.2)*30);
  endShape();

  //forme : articulation4 avec fonction cos additionnée à y pour action de nager
  fill(#4d0000);
  beginShape();  
  curveVertex(x+67, y-58 + cos(frameCount*0.2)*40);
  curveVertex(x+48, y-27 + cos(frameCount*0.2)*40);
  curveVertex(x+11, y-36 + cos(frameCount*0.2)*40);
  curveVertex(x-4, y-62 + cos(frameCount*0.2)*40);
  curveVertex(x+56, y-93 + cos(frameCount*0.2)*40);
  curveVertex(x+67, y-71 + cos(frameCount*0.2)*40);
  curveVertex(x+48, y-27 + cos(frameCount*0.2)*40);
  curveVertex(x+77, y+38 + cos(frameCount*0.2)*40);
  endShape();

  //forme : taches sur l'articulation4 avec fonction cos additionnée à y pour action de nager
  fill(#464a06); 
  ellipse(x+36, y-71 + cos(frameCount*0.2)*40, 6, 4);

  //forme : articulation3 avec fonction cos additionnée à y pour action de nager
  fill(#4d0000);
  beginShape();  
  curveVertex(x+69, y-57 + cos(frameCount*0.2)*50);
  curveVertex(x+30, y+10 + cos(frameCount*0.2)*50);
  curveVertex(x-35, y-19 + cos(frameCount*0.2)*50);
  curveVertex(x-29, y-55 + cos(frameCount*0.2)*50);
  curveVertex(x+13, y-73 + cos(frameCount*0.2)*50);
  curveVertex(x+51, y-57 + cos(frameCount*0.2)*50);
  curveVertex(x+30, y+10 + cos(frameCount*0.2)*50);
  curveVertex(x-52, y+43 + cos(frameCount*0.2)*50);
  endShape();

  //forme : taches sur l'articulation3 avec fonction cos additionnée à y pour action de nager
  fill(#464a06); 
  ellipse(x-4, y-63 + cos(frameCount*0.2)*50, 15, 12);
  ellipse(x+31, y-50 + cos(frameCount*0.2)*50, 21, 25);

  //forme : patte gauche 3 
  //fonction cos et sin ajoutées pour rotation des membres dans la nage
  //addition de 0.2 dans fonction cos pour déformation des membres dans la nage
  fill(#4d0000);
  beginShape(); 
  curveVertex(x+3+(sin(frameCount*0.2)*3), y-3 + cos(frameCount*0.2)*50);
  curveVertex(x-16+(sin(frameCount*0.2)*3), y-23 + cos(frameCount*0.2)*50);
  curveVertex(x-36+(sin(frameCount*0.2)*3), y-26 + cos(frameCount*0.2+0.2)*50);
  curveVertex(x-36+(sin(frameCount*0.2)*3), y+5 + cos(frameCount*0.2+0.2)*50);
  curveVertex(x-54+(sin(frameCount*0.2)*3), y-41 + cos(frameCount*0.2+0.2)*50);
  curveVertex(x-24+(sin(frameCount*0.2)*3), y-55 + cos(frameCount*0.2)*50);
  curveVertex(x-9+(sin(frameCount*0.2)*3), y-49 + cos(frameCount*0.2)*50);
  endShape();

  //forme : patte droite 3 
  //fonction cos et sin ajoutées pour rotation des membres dans la nage
  //addition de 0.2 dans fonction cos pour déformation des membres dans la nage
  fill(#4d0000);
  beginShape(); 
  curveVertex(x+17-(sin(frameCount*0.2)*3), y+19 + cos(frameCount*0.2)*50);
  curveVertex(x+38-(sin(frameCount*0.2)*3), y-12 + cos(frameCount*0.2)*50);
  curveVertex(x+57-(sin(frameCount*0.2)*3), y-12 + cos(frameCount*0.2+0.2)*50);
  curveVertex(x+66-(sin(frameCount*0.2)*3), y+21 + cos(frameCount*0.2+0.2)*50);
  curveVertex(x+64-(sin(frameCount*0.2)*3), y-29 + cos(frameCount*0.2+0.2)*50);
  curveVertex(x+28-(sin(frameCount*0.2)*3), y-43 + cos(frameCount*0.2)*50);
  curveVertex(x+16-(sin(frameCount*0.2)*3), y-33 + cos(frameCount*0.2)*50);
  endShape();

  //forme : articulation2 avec fonction cos additionnée à y pour action de nager
  fill(#4d0000);
  beginShape(); 
  curveVertex(x+45, y-34 + cos(frameCount*0.2)*40);
  curveVertex(x+18, y+36 + cos(frameCount*0.2)*40);
  curveVertex(x-59, y-10 + cos(frameCount*0.2)*40);
  curveVertex(x-54, y-48 + cos(frameCount*0.2)*40);
  curveVertex(x-4, y-57 + cos(frameCount*0.2)*40);
  curveVertex(x+37, y-34 + cos(frameCount*0.2)*40);
  curveVertex(x+18, y+36 + cos(frameCount*0.2)*40);
  curveVertex(x-76, y+66 + cos(frameCount*0.2)*40);
  endShape();                 

  //forme : taches sur l'articulation2 avec fonction cos additionnée à y pour action de nager
  fill(#464a06); 
  ellipse(x-51, y-40 + cos(frameCount*0.2)*40, 13, 16);
  ellipse(x+26, y-10 + cos(frameCount*0.2)*40, 20, 25);
  ellipse(x-9, y-24 + cos(frameCount*0.2)*40, 28, 26);

  //forme : patte gauche 2 
  //fonction cos et sin ajoutées pour rotation des membres dans la nage
  //addition de 0.2 dans fonction cos pour déformation des membres dans la nage
  fill(#4d0000);
  beginShape(); 
  curveVertex(x-27+(sin(frameCount*0.2)*3), y+20 + cos(frameCount*0.2)*40);
  curveVertex(x-46+(sin(frameCount*0.2)*3), y + cos(frameCount*0.2)*40);
  curveVertex(x-66+(sin(frameCount*0.2)*3), y-3 + cos(frameCount*0.2+0.2)*40);
  curveVertex(x-66+(sin(frameCount*0.2)*3), y+28 + cos(frameCount*0.2+0.2)*40);
  curveVertex(x-84+(sin(frameCount*0.2)*3), y-18 + cos(frameCount*0.2+0.2)*40);
  curveVertex(x-49+(sin(frameCount*0.2)*3), y-34 + cos(frameCount*0.2)*40);
  curveVertex(x-39+(sin(frameCount*0.2)*3), y-26 + cos(frameCount*0.2)*40);
  endShape();

  //forme : patte droite 2 
  //fonction cos et sin ajoutées pour rotation des membres dans la nage
  //addition de 0.2 dans fonction cos pour déformation des membres dans la nage
  fill(#4d0000);
  beginShape(); 
  curveVertex(x+1-(sin(frameCount*0.2)*3), y+51 + cos(frameCount*0.2)*40);
  curveVertex(x+22-(sin(frameCount*0.2)*3), y+20 + cos(frameCount*0.2)*40);
  curveVertex(x+41-(sin(frameCount*0.2)*3), y+20 + cos(frameCount*0.2+0.2)*40);
  curveVertex(x+50-(sin(frameCount*0.2)*3), y+53 + cos(frameCount*0.2+0.2)*40);
  curveVertex(x+48-(sin(frameCount*0.2)*3), y+4 + cos(frameCount*0.2+0.2)*40);
  curveVertex(x+12-(sin(frameCount*0.2)*3), y-11 + cos(frameCount*0.2)*40);
  curveVertex(x-(sin(frameCount*0.2)*3), y-1 + cos(frameCount*0.2)*40);
  endShape();

  //forme : articulation1 avec fonction cos additionnée à y pour action de nager
  fill(#4d0000);
  beginShape();  
  curveVertex(x+32, y-10 + cos(frameCount*0.2)*25);
  curveVertex(x+5, y+67 + cos(frameCount*0.2)*25);
  curveVertex(x-78, y+42 + cos(frameCount*0.2)*25);
  curveVertex(x-89, y+1 + cos(frameCount*0.2)*25);
  curveVertex(x-32, y-40 + cos(frameCount*0.2)*25);
  curveVertex(x+17, y-9 + cos(frameCount*0.2)*25);
  curveVertex(x+5, y+67 + cos(frameCount*0.2)*25);
  curveVertex(x-89, y+90 + cos(frameCount*0.2)*25);
  endShape();

  //forme : taches sur l'articulation1 avec fonction cos additionnée à y pour action de nager
  fill(#464a06); 
  ellipse(x-34, y-9 + cos(frameCount*0.2)*25, 13, 16);
  ellipse(x-21, y+25 + cos(frameCount*0.2)*25, 20, 18);
  ellipse(x+1, y-15 + cos(frameCount*0.2)*25, 6, 8);

  //forme : patte gauche 1 
  //fonction cos et sin ajoutées pour rotation des membres dans la nage
  //addition de 0.2 dans fonction cos pour déformation des membres dans la nage
  fill(#4d0000);
  beginShape();  
  curveVertex(x-71+(sin(frameCount*0.2)*3), y+50 + cos(frameCount*0.2)*25);
  curveVertex(x-87+(sin(frameCount*0.2)*3), y+30 + cos(frameCount*0.2)*25);
  curveVertex(x-110+(sin(frameCount*0.2)*3), y+27 + cos(frameCount*0.2+0.2)*25);
  curveVertex(x-110+(sin(frameCount*0.2)*3), y+58 + cos(frameCount*0.2+0.2)*25);
  curveVertex(x-128+(sin(frameCount*0.2)*3), y+12 + cos(frameCount*0.2+0.2)*25);
  curveVertex(x-84+(sin(frameCount*0.2)*3), y-2 + cos(frameCount*0.2)*25);
  curveVertex(x-83+(sin(frameCount*0.2)*3), y+4 + cos(frameCount*0.2)*25);
  endShape();

  //forme : patte droite1
  //fonction cos et sin ajoutées pour rotation des membres dans la nage
  //addition de 0.2 dans fonction cos pour déformation des membres dans la nage
  fill(#4d0000);
  beginShape();  
  curveVertex(x-8-(sin(frameCount*0.2)*3), y+56 + cos(frameCount*0.2)*30);
  curveVertex(x-1-(sin(frameCount*0.2)*3), y+49 + cos(frameCount*0.2)*30);
  curveVertex(x+16-(sin(frameCount*0.2)*3), y+53 + cos(frameCount*0.2+0.2)*30);
  curveVertex(x+19-(sin(frameCount*0.2)*3), y+87 + cos(frameCount*0.2+0.2)*30);
  curveVertex(x+28-(sin(frameCount*0.2)*3), y+37 + cos(frameCount*0.2+0.2)*30);
  curveVertex(x-9-(sin(frameCount*0.2)*3), y+17 + cos(frameCount*0.2)*30);
  curveVertex(x-19-(sin(frameCount*0.2)*3), y+23 + cos(frameCount*0.2)*30);
  endShape();


  //TÊTE & SES COMPOSANTES------------------------------------------------------------------
  //vibration aléatoire de la tête
  translate(random(3), random(3)); 

  //forme : tête
  fill(#4d0000);
  beginShape(); 
  curveVertex(x+32, y-10); 
  curveVertex(x-48, y+65);
  curveVertex(x-99, y+63);
  curveVertex(x-118, y-16);
  curveVertex(x-51, y-22);
  curveVertex(x-20, y+25);
  curveVertex(x-48, y+65);
  curveVertex(x-89, y+90);
  endShape();

  //forme : taches sur la tête 
  fill(#464a06); 
  ellipse(x-99, y+16, 20, 23);
  ellipse(x-57, y+58, 15, 10); 
  ellipse(x-46, y+31, 23, 30);
  ellipse(x-64, y-9, 13, 16);

  //bas de de la bouche bouge si etatBouche est activé
  if (etatBouche==1) { 
    ybb = y + cos(frameCount*1.5)*2;
  }

  //intérieur bouche
  fill(0);        
  beginShape(); 
  vertex(x-56, ybb+58);
  vertex(x-58, ybb+66);
  vertex(x-73, ybb+69);
  vertex(x-90, ybb+60);
  vertex(x-90, ybb+50);
  endShape();

  //forme : dent gauche du bas
  fill(255);
  beginShape(); 
  vertex(x-78, ybb+61);
  vertex(x-77, ybb+63);
  vertex(x-80, ybb+64);
  vertex(x-80, ybb+61);
  vertex(x-80, ybb+60);
  endShape();

  //forme : dent droite du bas
  fill(255); 
  beginShape(); 
  vertex(x-71, ybb+62);
  vertex(x-70, ybb+64);
  vertex(x-73, ybb+65);
  vertex(x-73, ybb+62);
  vertex(x-73, ybb+61);
  endShape();

  //forme : dent gauche du haut
  fill(255);
  beginShape();
  vertex(x-81, y+61);
  vertex(x-87, y+61);
  vertex(x-85, y+59);
  vertex(x-89, y+55);
  vertex(x-83, y+54);
  endShape();

  //forme : dent centrale du haut
  fill(255);
  beginShape();
  vertex(x-73, y+63);
  vertex(x-76, y+59);
  vertex(x-78, y+61);
  vertex(x-78, y+56);
  vertex(x-73, y+55);
  endShape();

  //forme : dent droite du haut
  fill(255);
  beginShape(); 
  vertex(x-67, y+56);
  vertex(x-66, y+61);
  vertex(x-69, y+62);
  vertex(x-71, y+59);
  vertex(x-70, y+56);
  endShape();

  //forme : bas de la bouche 
  fill(#4d0000); 
  beginShape(); 
  curveVertex(x-155, ybb+9);
  curveVertex(x-91, ybb+60);
  curveVertex(x-59, ybb+63);
  curveVertex(x-59, ybb+67);
  curveVertex(x-63, ybb+68);
  curveVertex(x-67, ybb+69);
  curveVertex(x-71, ybb+69);
  curveVertex(x-78, ybb+68);
  curveVertex(x-86, ybb+66);
  curveVertex(x-96, ybb+57);
  curveVertex(x-75, ybb+43);
  endShape();

  //forme : haut de la bouche
  fill(#4d0000);
  beginShape(); 
  curveVertex(x-123, y+123);
  curveVertex(x-91, y+60);
  curveVertex(x-52, y+64);
  curveVertex(x-56, y+56);
  curveVertex(x-61, y+50);
  curveVertex(x-68, y+47);
  curveVertex(x-79, y+51);
  curveVertex(x-89, y+47);
  curveVertex(x-95, y+50);
  curveVertex(x-92, y+61);
  curveVertex(x-26, y-2);
  endShape();

  //forme : oeil gauche       
  fill(150);
  beginShape(); 
  curveVertex(x-92, y+62);
  curveVertex(x-89, y+36);
  curveVertex(x-93, y+14);
  curveVertex(x-110, y+14);
  curveVertex(x-108, y+34);
  curveVertex(x-89, y+36);
  curveVertex(x-90, y-50);
  endShape();

  //forme : pupille gauche
  fill(0);
  beginShape();  
  curveVertex(x-105, y+57);
  curveVertex(x-95, y+33);
  curveVertex(x-93, y+20);
  curveVertex(x-105, y+20);
  curveVertex(x-106, y+30);
  curveVertex(x-95, y+33);
  curveVertex(x-57, y-19);
  endShape();

  //boucle : forme elliptique dans milieu pupille gauche
  noStroke();
  for (int i = 10 ; i > 0 ; i = i - 2) { 
    fill(i*12);
    ellipse(x-99, y+26, i, i);
  }

  stroke(0);

  //forme : oeil droit
  fill(127);
  beginShape(); 
  curveVertex(x-61, y+59);
  curveVertex(x-58, y+33);
  curveVertex(x-64, y+12);
  curveVertex(x-75, y+18);
  curveVertex(x-77, y+31);
  curveVertex(x-58, y+33);
  curveVertex(x-60, y-78);
  endShape();

  //forme : pupille droite       
  fill(0);
  beginShape();  
  curveVertex(x-67, y+61);
  curveVertex(x-61, y+32);
  curveVertex(x-63, y+21);
  curveVertex(x-71, y+19);
  curveVertex(x-74, y+28);
  curveVertex(x-61, y+32);
  curveVertex(x-28, y+1);
  endShape();

  //boucle : forme elliptique dans milieu pupille droite
  noStroke();
  for (int i = 7 ; i > 0 ; i = i - 2) { 
    fill(i*25);
    ellipse(x-69, y+26, i, i);
  }

  stroke(0);

  //mouvement : paupière droite du bas, vitesse proportionnelle  
  float facteur = 0.6;  //facteur d'assouplissement
  int paupiereBouge = int(random(0, 25)); //mouvement à moments aléatoires      
  if (paupiereBouge==1) { 
    pdby = ((pdby + random(0, 5)) - pdby) * facteur + pdby;
  }   

  //forme : paupière droite du bas
  fill(#4d0000); 
  beginShape(); 
  curveVertex(x-61, y+1);
  curveVertex(x-58, pdby+33); //ajout fonction sin au y pour suivre oscillation nage
  curveVertex(x-63, y+44);
  curveVertex(x-77, pdby+33); //ajout fonction sin au y pour suivre oscillation nage
  curveVertex(x-79, y+11);
  endShape();
}


//zone interactive rectangulaire, on clique pour activer etatBouche
void mousePressed () {
  rectMode(CORNER); //rectangle dessiné à partir du coin haut gauche
  if ( mouseX > x-100 && mouseX < x-46 && mouseY > y+50 &&  mouseY < y+79 ) {
    if (etatBouche==0) {
      etatBouche=1;
    }
  }
}


//bouche arrête de bouger quand curseur est hors du rect, même si click retenu
void mouseDragged() {
  if ( !(mouseX > x-100 && mouseX < x-46 && mouseY > y+50 &&  mouseY < y+79) ) {
    etatBouche=0;
  }
}


//bouche arrête de bouger si click relâché
void mouseReleased() {
  etatBouche=0;
}
