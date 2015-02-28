

int x1, x2, y1, y2;

// dŽfinir les variables de mouvement
int dx1, dx2, dy1, dy2;

// les variables qui dŽfiniront la couleur du qix
int r, v, b;
int a, q;


void setup(){

size(700,500);

  background(255);


  // nous devons dŽfinir les directions de dŽpart (dx1, dy1, dx2, dy2)
  changerDirection();


}


public void draw() {

  fondu();
  bouger();
  rebondir();
  dessiner();
  
}


void fondu() {
  noStroke();
  fill(255,255,255,1);
  // remplir l'Žcran avec un carrŽ d'une transparence de 32 (sur 255)
  rect(0,0,width,height);
}


void bouger() {
  x1 += dx1; // augementer la valeur de x1 selon dx1
  y1 += dy1; // augementer la valeur de x1 selon dx1
  x2 += dx2; // augementer la valeur de x1 selon dx1
  y2 += dy2; // augementer la valeur de x1 selon dx1
}


void rebondir() {
  if ( (x1 < 0 && dx1 < 0) || (x1 > width && dx1 > 0) ) {
    dx1 = -dx1;
    nouvelleCouleur();
  }
  if ( (y1 < 0 && dy1 < 0) || (y1 > height && dy1 > 0) ) {
    dy1 = -dy1;
    nouvelleCouleur();
  }
  if ( (x2 < 0 && dx2 < 0) || (x2 > width && dx2 > 0) ) {
    dx2 = -dx2;
    nouvelleCouleur();
  }
  if ( (y2 < 0 && dy2 < 0) || (y2 > height && dy2 > 0) ) {
    dy2 = -dy2;
    nouvelleCouleur();
  }
}


void dessiner() {
 
  frameRate(9999);
  
   if (keyPressed){
    if(key=='a'){
   stroke(255, v, b, 20);
line(a,q,mouseX,mouseY);
}
 }
 
  
    if (keyPressed){
    if(key=='z'){
   stroke(r, 255, b, 20);
line(a,q,mouseX,mouseY);
}
 }

  
   if (keyPressed){
    if(key=='e'){
   stroke(r, v, 255, 20);
line(a,q,mouseX,mouseY);
}
 } 

 
if (keyPressed){
    if(key=='q'){
 fill(255); //remplir de noir l'éllipse
 frameRate (999);
  ellipse( mouseX, mouseY, 10, 10);
}
}

if (keyPressed){
    if(key=='s'){
 fill(255); //remplir de noir l'éllipse
 frameRate (999);
  ellipse( mouseX, mouseY, 30, 30);
}
}

if (keyPressed){
    if(key=='d'){
 fill(255); //remplir de noir l'éllipse
 frameRate (999);
  ellipse( mouseX, mouseY, 50, 50);
}
}
if (keyPressed){
    if(key=='g'|| key == 'G'){
 fill(255); //remplir de noir l'éllipse
 frameRate (999);
  ellipse( mouseX, mouseY, 400, 400);
}
}

}


void changerDirection() {

  // dŽfinir (alŽatoirement) la direction des quatre points
  dx1 = nouvelleDirection();
  dx2 = nouvelleDirection();
  dy1 = nouvelleDirection();
  dy2 = nouvelleDirection();
  
}


int nouvelleDirection() {

  int direction, valeur;
  // on va aller dans un sens, ou dans un autre. CrŽer une liste
  int[] polarity = { -1,1 };
  // dŽfinir une direction -1 ou 1
  direction = polarity[(int)random(2)];
  valeur = (int)random(1,5);

  return ( direction * valeur );
}


void nouvelleCouleur() {
  // choisir une valeur alŽatoire pour les trois couleurs
  r = (int)random(0,255);
  v = (int)random(0,255);
  b = (int)random(0,255);
}



void mousePressed() {
   a = pmouseX;
  q = pmouseY;
}




