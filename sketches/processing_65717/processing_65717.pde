

void setup() {
  size(600,600); // Taille de la fenetre (width,height)
  background(255,255,255); // R,V,B. Valeur entre 0 (Min) et 255 (Max)
  smooth(); // Anti-aliasing
}

void draw() {
  line (width/2,height/2,mouseX,mouseY) ; // line (x1,y1,x2,y2)
}

