
void setup()
{
  size(400,400);
  smooth();
  background(0);
  noFill();
}

void draw()
{
    // création d'une variable pour chaque couleur
  
  int R;
  R = mouseX/20;
  int V;
  V = mouseX;
  int B;
  B = mouseX/20;
  int T;
  T = mouseY/20;
  
  // création d'une variable pour les paramètres du cercle
  int E;
  E = mouseX;
  int F;
  F = mouseY;
  
  background(0);
  // Point de départ sur un cercle invariable
  noStroke();
  fill(V+57,R+120,R+183,T+105);
  ellipse(200,200,E,E);

  // J'applique que le jeu de forme se fera à partir du centre du cercle
  // J'applique une boucle for pour pouvoir faire tourner mes formes
  translate(width/2, height/2);
  for (int i=0;i<360;i+=30){
  
  // création d'une variable A pour la taille de ma forme
  int A;
  A = mouseX/100;
  
  // rotation de quadrilatère violet
rotate(radians(mouseY));
fill(V+88,V+61,B+255,T+125);
quad(A+20, A+4, A+38, A+26, A+92, A+52, A+60, A+56);} 

 // 2E PARTIE
 // création d'une variable B pour la taille de ma forme
 int Bl;
 Bl = mouseY/100;
 
 // rotation de quadrilatère blanc + boucle for
for (int i=0;i<360;i+=30){ 
rotate(radians(mouseX));
fill(R+255,B+255,B+55,T+125);
quad(Bl+26, Bl+20, Bl+86, Bl+12, Bl+58, Bl+26, Bl+49, Bl+45);}

 // 3E PARTIE
 // création d'une variable C pour la taille de la forme
 int C;
 C = mouseX/100;
 
 //rotation de quadrilatère bleu + boucle for
for (int i=0;i<360;i+=30){
rotate(radians(mouseY));
fill(R+57,V+154,B+255,T+125);
quad(C+16, C+20, C+28, C+68, C+69, C+92, C+56, C+50);}

 // 4E PARTIE
 // création d'une variable D pour la taille de la forme
 int D;
 D = mouseY/100;
 
 //rotation de quadrilatère rouge + boucle for
for (int i=0;i<360;i+=30){
rotate(radians(mouseX));
fill(R+138,V+25,B+46,T+125);
quad(D+18, D+61, D+32, D+26, D+53, D+92, D+56, D+29);}
 
//  noLoop();
}



