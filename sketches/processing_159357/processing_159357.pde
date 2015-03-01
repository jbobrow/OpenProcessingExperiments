
/* Propagation d'idées */
/* Auteure : Dominique Domachie Charbonneau */

/* 
Jeu de pandémie de couleurs.
Les parasites-couleurs se servent des formes pour se propager. Éventuellement, certaines envahiront la population au grand complet.
Maladie ou simple propagation des opinions?

Commandes : 
 "k" pour redonner une chance à une couleur aléatoire (+ donne cette couleur au fond)
 Click (mouseReleased) pour recommencer le jeu
 
 */
//import ddf.minim.*;

//Minim minim;
//AudioPlayer musique;

Forme [] tableauFormes = new Forme[33]; //les formes
ArrayList <Projectile> Projectiles; //les projectiles des explosions
color fond;


void setup() {
  size(1080, 720);
  smooth();
  noStroke();
  
//  minim = new Minim(this);
//  musique = minim.loadFile("MobyTunedPercussion1Xylophone.aif");
//  musique.play();
 // musique.loop();
  

  //Donne une position et une vitesse aléatoires à chacune des formes
  for (int i =0; i < tableauFormes.length; i++) {
    PVector pos = new PVector (random(100+2, width-(100+2)), random(100+2, height-(100+2)));
    PVector vit = new PVector (random(-1, 1), random(-1, 1));
    tableauFormes[i] = new Forme( pos, vit, int(floor(random(6, 9))), int(floor(random(3, 7))), int(floor(random(3, 7))));
  }
  fond  = tableauFormes[0].couleurs[int(floor(random(tableauFormes[0].couleurs.length)))];


  Projectiles = new ArrayList();
}


void draw() {
  background(fond);
 // background(250, 125, 30);
  for (int i =0; i < tableauFormes.length; i++) {

    tableauFormes[i].draw();


    /* ~~~~~ DÉBUT - COLLISIONS SUR LES MURS ~~~~~ */
    // droite
    if (tableauFormes[i].position.x > width-tableauFormes[i].rayon) {
      tableauFormes[i].position.x = width-tableauFormes[i].rayon;
      tableauFormes[i].vitesse.x *= (-0.7);
      tableauFormes[i].acceleration.x *= -0.2;
      tableauFormes[i].update();
      //  println(i+" "+tableauFormes[i].vitesse);
    } 
    //gauche
    else if (tableauFormes[i].position.x < tableauFormes[i].rayon) {
      tableauFormes[i].position.x = tableauFormes[i].rayon;
      tableauFormes[i].vitesse.x *= (-0.7);
      tableauFormes[i].acceleration.x *= (-0.2);

      //  tableauFormes[i].vitesse.mult(-1);
      // tableauFormes[i].acceleration.mult(-1);
      tableauFormes[i].update();
    }  //bas
    else if (tableauFormes[i].position.y > height-tableauFormes[i].rayon) {
      tableauFormes[i].position.y = height-tableauFormes[i].rayon;
      tableauFormes[i].vitesse.y *= (-0.7);
      tableauFormes[i].acceleration.y *= (-0.2);
      //   tableauFormes[i].vitesse.mult(-1);
      //  tableauFormes[i].acceleration.mult(-1);
      tableauFormes[i].update();
    }  //haut
    else if (tableauFormes[i].position.y < tableauFormes[i].rayon) {
      tableauFormes[i].position.y = tableauFormes[i].rayon;
      tableauFormes[i].vitesse.y *= (-0.7);
      tableauFormes[i].acceleration.y *= (-0.2);
      //  tableauFormes[i].vitesse.mult(-1);
      // tableauFormes[i].acceleration.mult(-1);
      tableauFormes[i].update();
    }

    /* ~~~~~ FIN - COLLISIONS SUR LES MURS ~~~~~ */


    /* ~~~~~ DÉBUT - EXPLOSIONS :D! ~~~~~ */
    if (tableauFormes[i].pretAExploser == true) {
      tableauFormes[i].explosion();
    }


    if (tableauFormes[i].explosion == true) {

      int indexQuiTire = int(floor(random(tableauFormes.length)));
      for (int l = 0; l <20; l++) {
        color c = color(0, random(255), 0);
        Projectile b = new Projectile(tableauFormes[i].position.x, tableauFormes[i].position.y, tableauFormes[i].color3, tableauFormes[i].rayon );
        Projectiles.add(b);
      }

      tableauFormes[i].explosion = false;
    }
  }
  /* ~~~~~ FIN EXPLOSIONS POUR LA BOUCLE, CONTINUE PLUS LOIN ~~~~~ */
  

  /* ~~~~~ COLLISIONS ENTRE LES FORMES ~~~~~ */

  for (int j = 0; j < tableauFormes.length; j++) {
    for (int k = j+1; k < tableauFormes.length; k++) {
      if (j != k) { //pour ne comparer une forme avec elle-même
      
        float distance = dist(tableauFormes[j].position.x, tableauFormes[j].position.y, tableauFormes[k].position.x, tableauFormes[k].position.y);
        if (distance < tableauFormes[j].rayon+tableauFormes[k].rayon) {
          //Vecteur représentant distance entre les centres
          PVector axeCentres = new PVector(tableauFormes[k].position.x - tableauFormes[j].position.x, tableauFormes[k].position.y - tableauFormes[j].position.y);
          axeCentres.normalize();

          //de j -> k

          //Pour ne pas que les formes restent collées ensemble
          //inspiré de http://www.openprocessing.org/sketch/53224
          float retrait = abs(distance-(tableauFormes[j].rayon+tableauFormes[k].rayon));
          tableauFormes[j].position.x -= retrait*axeCentres.x;
          tableauFormes[j].position.y -= retrait*axeCentres.y;
          tableauFormes[k].position.x += retrait*axeCentres.x;
          tableauFormes[k].position.y += retrait*axeCentres.y;

          //lorsque l'on veut afficher les vecteur - débuggage
          // dessinFleche(axeCentres, color(255,0,0) , tableauFormes[j].position);

          //La formule est la suivante : v'1 = ((m1-m2)/(m1+m2))*v1 + ((2*m2)/(m1+m2))*v2)
          //v'2 = ((2*m1)/(m1+m2))*v1 + ((m2-m1)/(m1+m2))*v2
          //Tirée de la page wikipédia sur les chocs élastiques : http://fr.wikipedia.org/wiki/Choc_%C3%A9lastique

          PVector newVitesseJ1 = new PVector();
          PVector newVitesseJ2 = new PVector();
          newVitesseJ1.add(tableauFormes[j].vitesse);
          newVitesseJ1.mult((tableauFormes[j].masse-tableauFormes[k].masse)/(tableauFormes[j].masse+tableauFormes[k].masse));
          newVitesseJ2.add(tableauFormes[k].vitesse);
          newVitesseJ2.mult((2*tableauFormes[k].masse)/(tableauFormes[j].masse+tableauFormes[k].masse));
          newVitesseJ1.add(newVitesseJ2);

          PVector newVitesseK1 = new PVector();
          PVector newVitesseK2 = new PVector();
          newVitesseK1.add(tableauFormes[k].vitesse);
          newVitesseK1.mult((tableauFormes[k].masse-tableauFormes[j].masse)/(tableauFormes[j].masse+tableauFormes[k].masse));
          newVitesseK2.add(tableauFormes[j].vitesse);
          newVitesseK2.mult((2*tableauFormes[j].masse)/(tableauFormes[j].masse+tableauFormes[k].masse));
          newVitesseK1.add(newVitesseK2);

          //tableauFormes[j].position.x = tableauFormes[j].position.x;
          //tableauFormes[j].position.y = tableauFormes[j].position.y;
          tableauFormes[j].vitesse = newVitesseJ1;
          tableauFormes[j].acceleration.mult(-1);

          //tableauFormes[k].position.x = tableauFormes[k].position.x;
          //tableauFormes[k].position.y = tableauFormes[k].position.y;
          tableauFormes[k].vitesse = newVitesseK1;
          tableauFormes[k].acceleration.mult(-1);
          //}

          switch(int(floor(random(6)))) {
          case 0 :
            tableauFormes[j].color1 = tableauFormes[k].color1;
            break;
          case 1 :
            tableauFormes[j].color2 = tableauFormes[k].color2;
            break;
          case 2:
            tableauFormes[j].color3 = tableauFormes[k].color3;
            break;
          case 3:
            tableauFormes[k].color1 = tableauFormes[j].color1;
            break;
          case 4:
            tableauFormes[k].color2 = tableauFormes[j].color2;
            break;
          case 5:
            tableauFormes[k].color3 = tableauFormes[j].color3;
            break;
          }

          if (tableauFormes[j].color3 == tableauFormes[k].color3) {
            if (random(60) > 59) {
              tableauFormes[j].pretAExploser = true;
              tableauFormes[k].pretAExploser = true;
            }
          }

          if (tableauFormes[j].color3 != tableauFormes[k].color3) {
            if (random(100) > 99) {
              tableauFormes[k].pretAExploser = true;
            }
          }
          
        }
      }
    }
  }

  /*~~~~ Suite explosions! ~~~~~~*/

  for ( int l = 0 ; l < Projectiles.size() ; l++ ) {
    Projectile b = (Projectile) Projectiles.get(l);
    b.draw();
    b.explosion();


    //   print(b.alive());
  }

  for ( int l= Projectiles.size() -1; l >= 0 ; l-- ) {
    Projectile b = Projectiles.get(l);
    if (b.alive() == false) {
      Projectiles.remove(l);
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < tableauFormes.length; i++) {
    //Recharge toutes les couleurs, l'incrementation de l'explosion et le fond
    tableauFormes[i].color1 = tableauFormes[i].couleurs[int(floor(random(tableauFormes[i].couleurs.length)))];
    tableauFormes[i].color2 = tableauFormes[i].couleurs[int(floor(random(tableauFormes[i].couleurs.length)))];
    tableauFormes[i].color3 = tableauFormes[i].couleurs[int(floor(random(tableauFormes[i].couleurs.length)))];
    tableauFormes[i].incrementation = 0;
    fond  = tableauFormes[0].couleurs[int(floor(random(tableauFormes[0].couleurs.length)))];
  }
}

void keyPressed() {
  if (key == 'k' || key == 'K') {
    //Redonne une chance à une couleur; la met aussi dans le fond pour qu'on sache c'est laquelle
    //Donne à la moitié des formes une même couleur dans un de leurs trois polygones
    color c = tableauFormes[0].couleurs[int(floor(random(tableauFormes[0].couleurs.length)))];
    for (int i = 0; i < int(floor(tableauFormes.length/2)); i++) {
    int formeChange = int(floor(random(tableauFormes.length)));
    switch(int(floor(random(3)))) {
    case 0:
      tableauFormes[formeChange].color1 = c;
      break;
    case 1:
      tableauFormes[formeChange].color2 = c;
      break;
    case 2:
      tableauFormes[formeChange].color3 = c;
      break;
    }
    fond  = c;
  }
  }
}

class Forme {

  PVector vitesse, acceleration;
  float x, y;
  int nbCotes1, nbCotes2, nbCotes3;
  //  color color1, color2, color3;
  float rayon;
  // color[] couleurs;
  float forceCentrIni, masse, facteurAcc;
  boolean pretAExploser, explosion;
  int timeStampExp = 0;
  int incrementation, facteurAugmentation;
  float rotateFactor;
  PVector position;
  color couleurs[];
  color color1, color2, color3;


  Forme(PVector _position, PVector _vitesse, int c1, int c2, int c3) {
    
    rectMode(CENTER);
    shapeMode(CENTER);
    ellipseMode(CENTER);

    position = new PVector();

    vitesse = new PVector();
    rayon = random(10, 65);
    
  //est dans le draw pour l'instant
  //pourrait être ici aussi si on ne fait pas d'interaction avec la souris
    /*  forceCentrIni = mouseX;
     forceCentrIni = map(forceCentrIni, 0, width, 1, 2000);
     //forceCentrIni = 1000;
     masse = PI*(sq(rayon*2*0.5)); // formule de l’aire d'un disque : S = PI*((rayon)^2) Tiré du sketch "f_egale_m_a" de Jean-François Renaud
     
     acceleration = new PVector(random(-1, 1), random(-1, 1));
     acceleration.normalize();
     facteurAcc = forceCentrIni/masse;
     acceleration.mult(facteurAcc);
     acceleration.limit(2); */

    vitesse = _vitesse.get();
    position = _position.get();
    vitesse.normalize();
    vitesse.mult(10);

    nbCotes1 = c1;
    nbCotes2 = c2;
    nbCotes3 = c3;

    pretAExploser = false;
    incrementation =0;
    facteurAugmentation = 0;
    
    //palette de couleurs
    couleurs = new color[8];
    couleurs[0] = color(76/2, 54/2, 208/2);
    couleurs[1] = color(54, 54, 208);
    couleurs[2] = color(255, 177, 8);
    couleurs[3] = color(208, 56, 15);
    couleurs[4] = color(252, 146, 9);
    couleurs[5] = color(94, 42, 172);
    couleurs[6] = color(255, 221, 139);
    couleurs[7] = color(147, 46, 19);
    
    color1 = couleurs[int(floor(random(couleurs.length)))];
    color2 = couleurs[int(floor(random(couleurs.length)))];
    color3 = couleurs[int(floor(random(couleurs.length)))]; 
  }

  void draw() {

    /* ~~~~ POUR CHANGER FORCE CENTR AVEC MOUSE X (sinon mettre dans setup!)  ~~~~ */
    forceCentrIni = mouseX;
    forceCentrIni = map(forceCentrIni, 0, width, 2000, 1);
    //forceCentrIni = 1000;
    masse = PI*(sq(rayon*2*0.5)); // formule de l’aire d'un disque : S = PI*((rayon)^2) Tiré du sketch "f_egale_m_a" de Jean-François Renaud

      acceleration = new PVector(random(-1, 1), random(-1, 1));
     acceleration.normalize();
     facteurAcc = forceCentrIni/masse;
     acceleration.mult(facteurAcc);
     acceleration.limit(2); 

    vitesse.add(acceleration);
    position.add(vitesse); 
  //  println(forceCentrIni);
  /* ~~~~   ~~~~ */


    pushMatrix();
    translate(position.x, position.y);
    if (pretAExploser == true) { //change la rotation quand il y a rotation
      incrementation ++;
      rotateFactor = 0.001+incrementation/200000.0;
      rotate(millis()*rotateFactor);
      //  println("ca marche");
      // println(rotateFactor);
    }
    else {
      rotate(millis()*0.001);
      incrementation = 0;
    }
    translate(0, 0);
    stroke(255);
    strokeWeight(2);
    fill(color1);
    polygon(0, 0, rayon, nbCotes1, radians(360));
    noStroke();
    fill(color2);
    polygon(0, 0, rayon*0.7, nbCotes2, radians(360));
    fill(color3);
    polygon(0, 0, rayon*0.4, nbCotes3, radians(360));
    popMatrix();

    //  dessinFleche(vitesse, color(255,255,0), position);
    //  dessinFleche(acceleration, color(0,255,255), position);
  }

  void update() {
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    acceleration.normalize();
    facteurAcc = forceCentrIni/masse;
    acceleration.mult(facteurAcc);
    // acceleration.mult();
    acceleration.limit(2);

    vitesse.add(acceleration);
    vitesse.limit(3);
    position.add(vitesse);
  }


  void explosion() { //fait l'explosion et remet à l'état initial
    acceleration.x = 0;
    acceleration.y = 0;

    if (abs(vitesse.x) < 0.1 && abs(vitesse.y) < 0.1) {
      acceleration.mult(0);
      vitesse.mult(0);
    }

    if (incrementation == 500) {
      explosion = true;
    //  println("explosion!");
    }
    if (incrementation == 600) {
      pretAExploser = false;
      explosion = false;
      update();
      incrementation =0;
    }
  }
}

//Fonction polygone de William Smith (http://www.openprocessing.org/sketch/62697)
void polygon(float x, float y, float rayon, int nbreCotes, float angle) {
  beginShape();
  for (int i = 0; i < nbreCotes; i ++) {
    float xp = x + cos(angle + TWO_PI / nbreCotes * i) * rayon;
    float yp = y + sin(angle + TWO_PI / nbreCotes * i) * rayon;
    vertex(xp, yp);
  }
  endShape(CLOSE);
}

//Pour débuggage, tiré de JFR
void dessinFleche( PVector monVect, color c, PVector offset) {
  // orientation de la flèche
  float theta = monVect.heading2D();
  // ligne de la flèche
  stroke(c);
  pushMatrix();
  translate(offset.x, offset.y);
  float longueur = 5;
  line(0, 0, longueur*monVect.x, longueur*monVect.y);
  // pointe de la flèche
  //pushMatrix();
  translate(longueur*monVect.x, longueur*monVect.y);
  rotate(theta);
  noStroke();
  fill(c);
  beginShape();
  vertex(2, 0);
  vertex(-12, 6);
  vertex(-4, 0);
  vertex(-12, -6);
  endShape(CLOSE);
  popMatrix();
}

class Projectile {

  PVector posProj, vitProj, accProj;
  float x;
  float y, rayonForme, masseProj, rayonProj, forceCentrIniProj, facteurAccProj;
  color c;
  int timeStampP, compteur;

  Projectile( float x, float y, color c, float _rayonForme) {
    noStroke();
    this.x = x;
    this.y = y;
    this.c = c;
    rayonForme = _rayonForme;
    rayonProj = rayonForme/3;
    posProj = new PVector(x, y);
    vitProj = new PVector(random(-1, 1), random(-1, 1), 0);
    //accProj = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));
    //  fill(couleurs[int(floor((random(couleurs.length))))]);
    compteur = 0;
    
    forceCentrIniProj = 1000;
     masseProj = PI*(sq(rayonProj*2*0.5)); 
     
     accProj = new PVector(random(-1, 1), random(-1, 1));
    accProj.normalize();
    facteurAccProj = forceCentrIniProj/masseProj;
    accProj.mult(facteurAccProj);
    accProj.limit(2);
  }

  void draw() {

    fill(c);

    //stroke(250);
   // strokeWeight(0.2);
    ellipse(posProj.x, posProj.y, rayonForme/3, rayonForme/3);

    if ( millis() - timeStampP > 1000 ) {
      timeStampP = millis();
      compteur++;
      // println(compteur);
    }
  }

  void explosion() {
    // vitProj.add(accProj);
    vitProj.normalize();
    vitProj.mult(random(7,10));
    vitProj.add(accProj);
    posProj.add(vitProj);



    //   vitProj.add(accProj);
    //  posProj.add(vitProj);
  }

  boolean alive() {
    if (compteur < 5) {
      return true;
    } 
    else {
      return false;
    }
  }
}



