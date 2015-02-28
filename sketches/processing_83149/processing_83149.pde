
//les fonctions qui vont nous servire dans ce programme : la direction, la vitesse, les coordonnées des points, et le changement de direction

float direction = 1;
PVector speed = new PVector(0, 9);
float pointX;
float pointY;
float change;

//taille de la fenêtre et couleur de l'arrière plan

void setup() {
  size(600, 600);
  background(#EBE6DC);
}

void draw() {

  //éléments du décor
  line(0, 150, 150, 0);
  rect(20, 20, 20, 20);
  ellipse(170, 170, 170, 170);

  stroke(#1B2070);

  change = round(random(1, 10)); //8 directions possibles
  if (change ==10) {
    direction = round(random(60)); //8 chances sur 60 de changer de direction, permet à la droite de ne pas changer continuellement de direction

    point(pointX, pointY);
    point(pointX+1, pointY+1);
    point(pointX-1, pointY-1);
    point(pointX-1, pointY+1);      //place des points aléatoirement sur le tracé
    point(pointX+1, pointY-1);
    noStroke();
    point(pointX+1, pointY);
    point(pointX-1, pointY);
    point(pointX, pointY+1);
    point(pointX, pointY-1);
    stroke(#E86565);
    strokeWeight(10);
    smooth();


    //direction que va prendre le tracé
  }
  if (direction == 1) {
    speed.set(0, -1, 0);
  } 
  else { 
    PVector speed = new PVector(4, 8); //choix restreint de direction, afin d'éviter que le tracé revienne un minimum sur lui même
  }

  if (direction == 2) {
    speed.set(1, 0, 0);
  } 
  else { 
    PVector speed = new PVector(5, 8);
  }

  if (direction == 3) {
    speed.set(0, 1, 0);
  } 
  else { 
    PVector speed = new PVector(2, 8);
  }

  if (direction == 4) {
    speed.set(-1, 0, 0);
  } 
  else { 
    PVector speed = new PVector(3, 8);
  }

  if (direction == 5) {
    speed.set(-1, -1, 0);
  } 
  else { 
    PVector speed = new PVector(1, 5);
  }
  if (direction == 6) {
    speed.set(1, 1, 0);
  } 
  else { 
    PVector speed = new PVector(1, 5);
  }

  if (direction == 7) {
    speed.set(-1, 1, 0);
  } 
  else { 
    PVector speed = new PVector(1, 7);
  }

  if (direction == 8) {
    speed.set(1, -1, 0);
  } 
  else { 
    PVector speed = new PVector(1, 5);
  }

  //Quand le tracé sort du cadre, il apparaît de l'autre côté de la fenêtre, aux coordonnées opposées
  if (pointX == width) {
    pointX = 1;
  }
  if (pointX == 0) {
    pointX = width-1;
  }
  if (pointY == height) {
    pointY = 1;
  }
  if (pointY == 0) {
    pointY = height-1;
  }

  //le point va s'imprimer selon ses coordonnées
  pointX = pointX+speed.x;
  pointY = pointY+speed.y;
  point(pointX, pointY);
}

boolean bStop;

void keyPressed() {    //permet de stopper et de modifier la trajectoire volontairement
  if (key == CODED)
    if (keyCode == UP) {
      direction = 1;
    }
  if (keyCode == RIGHT) {
    direction = 2;
  }
  if (keyCode == DOWN) {
    direction = 3;
  }
  if (keyCode == LEFT) {
    direction = 4;
  }


  {
    bStop = !bStop; 
    if (bStop)
      noLoop();   // presser n'importe quelle touche met en pause
    else
      loop();    // presser n'importe quelle touche relance le programme
  }
}


