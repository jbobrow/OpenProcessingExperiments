
float epaisseur = 1;     //épaisseur curseur souris 
float transparent = 1;  //intensité curseur souris
Forme [] p = new Forme [20]; //nombre de formes 
void setup() {
  size(700, 700);      //taille de la fenetre
  for (int i=0; i<p.length; i++) {
    p[i] = new Forme(random(0.5, 5), random(0.5, 5), (int)random(4));
  }
}
void draw() {
  noCursor(); // pas de curseur
    background(#000000); // fond noir
  epaisseur = map(mouseX, 0, 500, 1, 7);  // refaire le curseur en point bleu
  strokeWeight(epaisseur);
  transparent = map(mouseY, 0, height, 2, 200);
  stroke (#3B4CF5);
  line(mouseX, mouseY, pmouseX, pmouseY);
  for (int i=0; i<p.length; i++) {
    p[i].bouge();
    p[i].decision();
    p[i].forme();
// changement de couleur lorsque l'on passe au dessus de la forme
    if ( overRect(p[i].centreX, p[i].centreY, 40, 40)) { 
      println("au dessus");
      p[i].R = random(255);
    }
  }
  if (keyPressed) {
    if (key == ' ') {
      background(200);
    }
  }
  translate(mouseX, mouseY);
}
boolean overRect(float x, float y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

//Déclarations des différentes variables utilisées
class Forme {
  float centreX;
  float centreY;
  float directionX = 1;
  float directionY = 1;
  float zoom;
  float speed;
  int choix;
  float r =0;
  float R, G, B;
  
  //variables permettant bouge, zoome
  Forme(float _zoom, float _speed, int _choix) {
    zoom = _zoom;
    speed = _speed;
    choix = _choix;
    centreX = random(width);
    centreY = random(height);
    R = 0; 
    G = 0;
    B = 50;
  }
  
   // conditions du code 
   
  void decision() {
    if (choix == 0) {
      stroke (#3B4CF5);//bleu
    }
    if (choix == 1) {
      stroke (#8A908E);
    }
    if (choix == 2) {
      stroke(#8A908E);
    }
    if (choix == 3) {
      stroke(#BFC9C4);
    }
  }
  void bouge() {
    if (centreX > width) { 
      centreX = width;
      directionX *= -1;
    }
    if (centreX < 0) {
      centreX = 0;
      directionX *= -1;
    }
    else {
      centreX += speed * directionX;
    }
    if (centreY > height) { 
      centreY = height;
      directionY *= -1;
    }
    if (centreY < 0) {
      centreY = 0;
      directionY *= -1;
    }
    else {
      centreY += speed * directionY;
    }
  }
  ///////////
  void forme() { // déclaration fonction forme
    //noFill();
    pushMatrix();
    translate(centreX, centreY); // déplacer objets dans la fenêtre d'affichage
    rotate(r); // rotation
    r= r+0.05; // 
    scale(zoom/5); // variation des formes
    fill (R, G, B); // couleur de le forme
    
//forme
    beginShape();
    vertex(-40, -40);
    vertex(0, -60);
    vertex(40, -40);
    vertex(60, 0);
    vertex(40, 40);
    vertex(0, 60);
    vertex(-40, 40);
    vertex(-60, 0);
    endShape(CLOSE);
    popMatrix();
  }
}


