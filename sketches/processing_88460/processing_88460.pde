
int i = 0;
boolean vivant;//affiche ou non les points
boolean clefTaille;  //enclencher l'augementation de la taille d'un point
boolean clefRotation;//enclencher la rotation des points
ArrayList lesPts; //liste dynamique plus adapté à notre projet,notamment pour appeler les parametres de la dernière instance créé
float t = 0; //taille de la boule d'énergie

//////////////////////////////////////////////////////////////////////////////////

void setup() {
  noCursor();
  size(displayWidth, displayHeight, P3D);
  lesPts = new ArrayList ();
}

//////////////////////////////////////////////////////////////////////////////////

void draw() {

  background(0);////////////////////version1
  //background(#0D0C15);////////////version2

  frameRate(50);
  camera(mouseX, height/2, (height/2) / tan(PI/4), width/2, height/2, 0, 0, 1, 0); 

  fill(255);
  ellipse(mouseX, mouseY, 5, 5); //remplace le curseur

  translate(width/2, height/2);//centre les boules d'energies

  lights();

  stroke(255, 255, 255, 100);
  strokeWeight(0.5); 
  sphere(5);//boule d'energie centrale

  noFill();
  stroke(255, 255, 255, 100);
  sphere(1100);//arrière plan
  t = (lesPts.size()/8 )*(lesPts.size()/6);//fait augumenter de maniere exponentielle la taille de sphere proportinellment au nombre de point
  sphere(t+random(t, t*1.5));              //fait vibré la boule d'energie


  for (int i = 0;i<lesPts.size();i++) {//permet laisser active les fonctions de tout les points créers

    pt nouveauPt = (pt) lesPts.get(i);//tout les points créers sont appelé a chaque fois que la draw est executer
    nouveauPt.vie(); 

    if (vivant==true) {//garde affiché touts les points qui ont été clické jusqu'a leur mort
      nouveauPt.afficheLePt();
    }

    if (clefRotation) {
      nouveauPt.bouge(); // la rotation s'applique a tout les points
    }
    if (clefTaille) {
      pt dernier = (pt) lesPts.get(int(lesPts.size()-1)); //appelle la variable taille du dernier point créer
      dernier.taille++; //augumenter la taille du dernier point
    }
  }
}

//////////////////////////////////////////////fonctions en dehors de draw///////////////////////////////////////////

void mousePressed() {
  lesPts.add(new pt(mouseX, mouseY));//un click ajoute un point à la liste
  clefTaille= true; //la taille augumente lorqu'on reste appuyé
}

void mouseReleased() {
  clefTaille = false;//lorsqu'on a relaché le click la taille du dernier point crée arrète d'augumenter
  clefRotation= true;//lorsqu'on relache le click la rotation du denier point s'enclenche
  pt dernier = (pt) lesPts.get(int(lesPts.size()-1));//appelle le dernier point crée
  dernier.taille = dernier.taille ;//lorsqu'on relache le click la taille du dernier point créer conserve cette taille par la suite
  dernier.r = 0; /**nous avons volontairement choisi que l'appartation du point ne se fasse pas au même endroit que le curseur, 
  si s'était le cas non il n'y aurait pas l'unité que forme l'ensemble des points en mouvment**/
}

/////////////////////////////////////////////la class du point///////////////////////////////////////////////////////////////

class pt {

  //centre du point
  float centreX;
  float centreY;
  float centreZ;

  float taille =0;
  float vitesse;//deplacement sur les axes x,y
  float vitesseP;//deplacement sur l'axe z
  float r;
  float age;

  //coordonnée de l'une des éxtrémités du lien avec les points
  float xD;
  float yD;
  float zD;

  pt (float nouvCentreX, float nouvCentreY) {

    centreX = nouvCentreX;
    centreY = nouvCentreY;

    centreZ = 0;

    taille = 0;
    vitesse = 0.001; 
    vitesseP = noise(0.001, -0.001);//le noise donne une certaine unité à l'ensemble des points en mouvement

    age = 0;
    //place au centre l'une des éxtrémités du lien avec les points
    xD = width/2; 
    yD = height/2;
    zD = 0;
  }


  void vie() {//donne une durée de vie au point
    age++;
    if (age>random(400, 500)) {//le random permet une disparition sacadé du point
      vivant = false;
    }
    else {
      vivant = true;
    }
    if (keyPressed==true) {
      vivant = true;//pour faire réaparaitre tout les points
    }
  }

  void bouge () {//mouvement du point
    //axe x,y
    rotate(r);
    r = r + vitesse;
    //axe y
    centreZ = centreZ + vitesseP;
    if (centreZ>200||centreZ<-200) {
      vitesseP=vitesseP*-1;
    }
  }

  void afficheLePt () {//le dessin du point

      noFill();
    stroke(255);
    strokeWeight(0.4);

    pushMatrix();
    translate(-width/2, -height/2);// replace l'origine des axe sur le curseur de la souris

    line(xD, yD, zD, centreX, centreY, centreZ);//le lien

    fill(#20ee38);//couleur du point////////version1
    //noFill();/////////////////////////////version2

    beginShape();
    //crée un certain nombre de coté à la forme plus ou moins éloigné du centre
    for (i=0 ; i<10 ;i++) {
      vertex(random(centreX-5, centreX+5), random(centreY-5, centreY+5), random(centreZ-5, centreZ+5));
    }
    if (taille>50) {
      for (i=0 ; i<10 ;i++) {
        vertex(random(centreX-15, centreX+15), random(centreY-15, centreY+15), random(centreZ-15, centreZ+15));
      }
    }
    if (taille>250) {
      for (i=0 ; i<10;i++) {
        vertex(random(centreX-25, centreX+25), random(centreY-25, centreY+25), random(centreZ-25, centreZ+25));
      }
    }
    if (taille>300) {
      for (i=0 ; i<4 ;i++) {
        vertex(random(centreX-60, centreX+60), random(centreY-60, centreY+60), random(centreZ-60, centreZ+60));
      }
    }
    if (taille>350) {
      for (i=0 ; i<1 ;i++) {
        vertex(random(centreX-100, centreX+120), random(centreY-100, centreY+100), random(centreZ-100, centreZ+100));
      }
    }
    endShape(CLOSE);
    popMatrix();
  }
}//fin de la class pt



