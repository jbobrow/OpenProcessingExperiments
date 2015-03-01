
int diametre = 1;
int opacite = 254;
int vitesse = 0;

void setup() {
  size(400,400);
  background(0);
  noStroke();
}

void draw() {
  background(0);

  fill(255, opacite);
  ellipse(width/2, height/2, diametre, diametre);
  
   vitesse += 1;
  //opacite = opacite - vitesse;
  diametre = diametre + vitesse;
 
  print(vitesse);
  print(", ");
  println(diametre);
  

  if (diametre == 254 || diametre <= 1) {
    vitesse += 1;
    vitesse = - vitesse;
  }
  /*if (diametre < 1) {
    vitesse = - vitesse;
  }*/
}


