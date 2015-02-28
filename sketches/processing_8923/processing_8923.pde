
//Appoximation du nombre PI, représentation graphique

//Written by Jonathan Chemla
//Please contact me for non-private use ;)
//jos.chemla@gmail.com

//On connait la relation liant l'aire d'un disque à son rayon : A = PI * r*r
//Si l'on jette aléatoirement des points dans un carré de côté 1, alors
//Le rapport du nombre de point tombés dans le disque sur le nombre total de points lancés
//permet d'approximer le nombre PI : 
//A_disque = PI * r*r, dc PI = A_disque/(r*r), 
//Or A_carré = (2r)*(2r) = 4 * r*r, soit r*r = A_carre/4
//Donc PI = 4*A_disque/A_carre
//Le rapport du nombre de points dans le cercle sur celui du nombre de points tombés dans le carré
//tends vers ce rapport 4*A_disque/A_carré, c'est ce dont nous avons besoin.

int WIDTH = 1000; 
int HEIGHT = 500;

int iteration = 1000;
float[] APPROX = new float[iteration];
PVector pos_pt;
int nb_disque;
int nb_carre;

PVector org = new PVector(20, 20);
float ord_min = 0;
float ord_max = 6;
float ord_pi;
PFont font;
int txt_s = 20;
PImage pi;
color backg = color(0);
color pinc  = color(255);

void graphique()
{
  background(backg);
  initialise_font();
  textFont(font, 12);
  
  //Axes
  stroke(pinc);
  line(org.x, org.y, org.x, HEIGHT-org.y);
  line(org.x, HEIGHT-org.y, WIDTH-org.x, HEIGHT-org.y);
  text(ord_min, 3, HEIGHT-org.y);
  text(ord_max, 3, org.y);

  //Les images PI
  pi = loadImage("PI.png");
  ord_pi = map(PI, ord_min, ord_max, HEIGHT-org.y, org.y);
  initialise_font();
  text(" = 3,14159265", 570, 70);
  pi.resize(0, 10);
  image(pi, org.x-13,ord_pi-5);
  
  //Droite d'ordonnée PI
  stroke(30, 200, 255);
  line(org.x, ord_pi, WIDTH-org.x, ord_pi);
}

void initialise_font()
{
  font = loadFont("LucidaSans-48.vlw");
  textFont(font, txt_s);
  fill(255);
}

void approximme_pi()
{
  stroke(pinc);
  noFill();
  nb_disque = 0;
  nb_carre = 0;
  
  beginShape();
  for (int i = 1; i < iteration; i++)
  {
    //Génération aléatoire d'un point de coordonées analysées par la suite
    pos_pt = new PVector(random(-1.0, 1.0), random(-1.0, 1.0));
    if ((sq(pos_pt.x)+sq(pos_pt.y)) < sq(1.0)) {nb_disque ++;} //Car le point appartient au disque (Pythagore)
    nb_carre = i;
    
    //Stockage de l'approximation dans un tableau
    APPROX[i-1] = 4*(nb_disque/(float)nb_carre);
    vertex(org.x + i, map(APPROX[int(i-1)], ord_min, ord_max, HEIGHT-org.y, org.y));
  }
  endShape();
}

void affiche_approx()
{
  //Effacage
  pi = loadImage("PI.png");
  stroke(pinc);
  fill(backg);
  rect(520, 20, 300, 100);
  image(pi, 550, 50);
  fill(pinc);
  text(" = 3,14159265", 570, 70);
  
  //Affichage de la valeur indiquée par la souris
  fill(pinc);
  int numero = (int)map(mouseX, org.x, WIDTH, 0, iteration);
  text(APPROX[abs(numero)], 590, 45);
  
  //Calcul de l'écart relatif à la valeur de PI connue
  float ecart = abs(PI - APPROX[abs(numero)]);
  text("écart : " + ecart, 550, 100);
}

void setup()
{
  size(WIDTH, HEIGHT);
  smooth();
  graphique();
}

void draw() {affiche_approx();}

void mousePressed() {if(mouseButton == RIGHT) {graphique();}
                     approximme_pi();} //Génération d'une nouvelle courbe d'approximation
void keyPressed() {if (keyCode == ENTER) {saveFrame();}}

