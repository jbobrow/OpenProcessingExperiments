
// 4 zones d'actions
// chaque carré gris influe sur la partie concernée

int h = 320;
int w = 180;
int x = 0;
int y = 0;
PImage photo;

void setup() {
  size(640, 360);
  background (255);
  smooth();
  photo = loadImage("zombie-caniche.jpg");
}

void draw() {
  hautDroit();
  hautGauche();
  basGauche();
  basDroit();

  //surfaces grises
  fill(200);
  strokeWeight(1);
  rect(320, 180, 50, 50); //bas droit
  rect(270, 180, 50, 50); //bas gauche
  rect(320, 130, 50, 50); //haut droit
  rect(270, 130, 50, 50); //haut gauche
  
  //retour a 0
  if ((mousePressed == true) && (mouseX>610) && (mouseX<640) && (mouseY>0) && (mouseY<30)) {
    background(255);
  }
  rect(610, 0, 30, 30);
  stroke(0);
  line(613, 3, 637, 27);
  line(613, 27, 637, 3);
}


