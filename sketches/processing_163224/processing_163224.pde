
int x;
int y;
int s;
int s1;
float x1;
float y1;
String directionx1;
String directiony1;

String directionx;
String directiony;

PImage Chloe;
String nomFichier;

PImage Foot;
String nomFichierFoot;
PImage Ballon;
String nomFichierBallon;



void setup() {
  size(800, 500);
  smooth(); 

  x=25;
  y=25;
  s=5; 
  s1=7;

  directionx="vers la droite";
  directiony="vers le bas";
  frameRate(60);
}




void draw() {
  background(60, 211, 61);




  ///////  

  if (directionx=="vers la droite") {
    x=x+s;
  } else {
    x=x-s;
  }

  if (directiony=="vers le bas") {
    y=y+s;
  } else {
    y=y-s;
  }


  if (x<=50) {
    directionx="vers la droite";
  }
  if (x>=width-50) {
    directionx="vers la gauche";
  }

  if (y<=50) {
    directiony="vers le bas";
  }
  if (y>=height-50) {
    directiony="vers le haut";
  }

  //////

  if (directionx1=="vers la droite") {
    x1=x1+s1;
  } else {
    x1=x1-s1;
  }

  if (directiony1=="vers le bas") {
    y1=y1+s1;
  } else {
    y1=y1-s1;
  }


  if (x1<=25) {
    directionx1="vers la droite";
  }

  if (x1>=width-25) {
    directionx1="vers la gauche";
  }

  if (y1<=25) {
    directiony1="vers le bas";
  }
  if (y1>=height-25) {
    directiony1="vers le haut";
  }     

  ////////




  nomFichierFoot="foot.gif";
  Foot=loadImage(nomFichierFoot);


  image(Foot, width/2, height/2);

  chloe();


  nomFichierBallon="ballon.gif";
  Ballon=loadImage(nomFichierBallon);

  fill(255);
  image(Ballon, x1, y1);
}

void chloe() {


  nomFichier="chloe1111.gif";
  Chloe=loadImage(nomFichier);

  imageMode(CENTER); 
  image(Chloe, x, y);
}



