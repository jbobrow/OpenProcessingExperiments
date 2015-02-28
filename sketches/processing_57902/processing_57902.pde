
// creation des liste pour r x et y
PImage img;
float []x;
float []y;
float []r;
//initialiser un compteur
int nbrActu=0;
int nbrTot;

void setup() {
    size(800,800, P2D);
  smooth();
  noStroke();
  fill(40);
  img = loadImage("data/portrait_6b_800.jpg");


  //inititier les listes et nombre
  nbrTot = 20000;
  background(0);
  x= new float [nbrTot];
  y= new float [nbrTot];
  r= new float [nbrTot];
     r[0] = random(1,3);
   x[0] = random(0+r[0], width-r[0]);
   y[0] = random(0+r[0], height-r[0]); 
   frameRate(200);
}

void draw() {
//println(frameRate);
  //placer une nouvelle cercle quelque part à l'interieur de la fenetre
  float r_new = random(2,6);
  float x_new = random(0+r_new, width-r_new);
  float y_new = random(0+r_new, height-r_new); 

  //chercher le cercle le plus proche du nouveau dans la liste des cercles existant
  float pp = Float.MAX_VALUE;
  int pp_index=0;

  for (int i = 0; i < nbrActu; i++) {
    float  distance =  dist(x_new, y_new, x[i], y[i]);
    if (distance < pp) {
      pp = distance;
      pp_index= i;
    }
  }
   nbrActu++; 
  //calculer l'angle entre le plus proche et le nouveau atan2
  float angle = atan2(y_new - y[pp_index], x_new-x[pp_index]);

  // calculer le nouveau position r-proche + cos/sin*r-proche +r-nouveau
  // et rajoute le nouveau cercle dans la liste
  x[nbrActu] = x[pp_index] + cos(angle)*(r_new + r[pp_index]);
  y[nbrActu] = y[pp_index] + sin(angle)*(r_new + r[pp_index]);
  r[nbrActu] = r_new;
  // affiche tout les cercle existant
  
 // for (int i = 0; i < nbrActu; i++) {
    color c = img.get(int(x[nbrActu]), int(y[nbrActu]));
    fill(c);
    ellipse(x[nbrActu], y[nbrActu], r[nbrActu]*2, r[nbrActu]*2);
  
 // }
  // augmente le nombre d'objet d'un
  // arrete l processus si nombre tot est accompli
  if (nbrActu>=nbrTot-1) noLoop();
}


