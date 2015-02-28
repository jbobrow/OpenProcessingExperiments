
/*
yb@imal.org
 
 example de liste (ArrayList)
 création interactive d'objets que l'on gère par une liste (ArrayList)
 
 */

import ddf.minim.*;

Minim minim;
AudioSample kick;
AudioSample kick2;

Chose[] choses = new Chose[150]; //tableau de Choses en fond
ArrayList dynamiques = new ArrayList();//grosseChose créée interactivement (dynamiquement)

int deplacementX;
int x;
int deplacementY;
int y;

void setup() {
  size(500, 500);
  
  x=95;
  y=95;
  deplacementX=-4;
  deplacementY=-6;

  minim = new Minim(this);
  kick = minim.loadSample("2.mp3", 2048);
  kick2 = minim.loadSample("1.mp3", 2048);

  for (int i=0; i<choses.length; i++) {
    //créée des choses réparties aléatoirement dans la fenêtre
    choses[i]=new Chose(random(width), random(height));
  }
}

float angle=0;
float sfactor=0.99;
float dangle = 0.05; //vitesse angulaire


void draw() {
  fill(map(mouseX,0,500,150,250),0,map(mouseY,0,500,150,250),20);
  rect(0,0,500,500);

  for(int i=0; i<300; i++) {
    fill(255,255,255,80);
    stroke(255,255,255,80);
   ellipse(random(500), random(500),3,3);
  }
  //dessine le fond des choses
  for (int i=0; i<choses.length; i++) choses[i].action();

  //dessine les choses créées dynamiquement
  for (int i=0; i<dynamiques.size(); i++) {
    Chose c = (Chose) dynamiques.get(i);
    c.action();
  }
 angle=angle+dangle; 
  if (angle > 90.0 || angle<0) dangle=-dangle; //oscille entre 0 et 90 degrés
  
  x=x+deplacementX;
  y=y+deplacementY;
  
  pushMatrix(); 
  translate(x, y);//spirale du haut
  spirale(100, 50);
  popMatrix();
  
   if(x<0 || x+10>width) {
   deplacementX=-deplacementX;
 }
 
 if(y<0 || y+10>height){
   deplacementY=-deplacementY;
 }
  
}

Boolean isInCircle(float xc, float yc, float r, float x, float y) {
  //returns true if point x,y inside circle with center xc,yc and radius r
  return( dist(xc, yc, x, y) <= r );

  //exemple d'usage sur un grossechose c:
  // isInCircle( c.x, c.y, 15/2.0, mouseX, mouseY)
  // ou utiliser methode touche de grosseChose
}

int chercheChoseEnDessousMouse() {
  /*for (int i = dynamiques.size()-1; i >= 0; i--) {
    grosseChose gc =  (grosseChose) dynamiques.get(i);    
    if (gc.touche(mouseX, mouseY)) {
      return i;
    }
    else {
      return -1;
    }
  }*/
  
  // ATTENTION : avec else, c'est soit l'un loit l'autre donc la boucle n'est pas relue
  
      for (int i = 0; i < dynamiques.size() ; i++) {
       grosseChose gc = (grosseChose) dynamiques.get(i);
      if (gc.touche(mouseX, mouseY)) {
        return i;
      }
    }
  
  return -1;
  // renvoit l'index de chose en dessous souris si trouvée
  // sinon -1
  // utilisez la méthode touch défine pour la classe grosseChose
  // faire une boucle sur la liste dynamiques pour tester
  // si une grosseChose se trouve sous mouseX, mouseY

  // return -1; //provisoirement - on n'a rien trouvé
}


void mousePressed() {
  //vérifier si on clique sur un objet grosseChose;
  // si oui l'enlever de la liste: dynamiques.remove(i_clicked) 

  int found;
  found = chercheChoseEnDessousMouse();
  if ( found >=0) {
    //on a clique sur une chose - on l'enlève avec remove
    dynamiques.remove(found);
    kick2.trigger();
  }
  else {
    //sinon
    //on crée une grosseChose et on l'ajoute à la liste dynamiques
    dynamiques.add(new grosseChose(mouseX, mouseY));
    kick.trigger();
  }
}

void keyPressed() {
  //détruit toutes les choses ajoutées interactivement
  dynamiques = new ArrayList();
}

void stop() {
  kick.close();
  kick2.close();
  minim.stop();
  super.stop();
}


