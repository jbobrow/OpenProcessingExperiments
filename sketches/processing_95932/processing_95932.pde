
float a;
float b;
float c;
float d;
float e;
float f;
float g;
float h;
float i;
float j;
float k;
float l;
float m;
float n;

void setup () {
  size (1000,1000);
  smooth ();
  
  a = random(0,width);
  b = random(0,height);
  c = random(0,width);
  d = random(0,height);
  e = random(0,width);
  f = random(0,height);
  g = random(0,width);
  h = random(0,height);
  i = random(0,width);
  j = random(0,height);
  k = random(0,width);
  l = random(0,height);
  m = random(0,width);
  n = random(0,height);
  /*
  a = random(0,width);
  b = random(0,height);
  c = random(0,width);
  d = random(0,height);
  e = random(0,width);
  f = random(0,height);
  g = random(0,width);
  h = random(0,height);
  i = random(0,width);
  j = random(0,height);
  k = random(0,width);
  l = random(0,height);
  m = random(0,width);
  n = random(0,height);
  */
  
  fill (0);
  rect (0,0,width,height);
}

void draw () {
  
  
  
  
  //   INT
  
  
  
  //   force du mouvement
  int rand;
  rand = (1/4)+(mouseX/25);
  int rand2;
  rand2 = rand/2;
  
  
  //   taille ellipses
  int tc;
  tc = 0;
  
  //   couleur des ellipses
  
  color sel = color (255);
  
  
  //   lignes?   1 = oui, 0 = non.
  
  int lignes;
  lignes = 0;
  
  //   taille lines
  int sw;
  sw = 2;
  
  //   couleur des lignes
  
  color scolor = color (0);
  
  //   ajout d'un mouvement vertical ou horizontal
  int dplch;
  dplch = 0;
  int dplcv;
  dplcv = 0;
  
  
  
  
  
  //      PARAMETRES DE LA TRAME
  
  
  
  
  
  //   nombre de motifs dans la page
  //   horizontalement
  int nbmtfh;
  nbmtfh = width/4;
  //   verticalement
  int nbmtfv;
  nbmtfv = height/4;
  
  //   espace entre les motifs (plus le nombre est grand, moins il y a d'espace entre les motifs)
  int espcmtf;
  espcmtf = 1;
  
  //   où commence la trame à gauche
  int dbtrmg;
  dbtrmg = -nbmtfh*2;   //   intialement -nbmtfh*2
  
  //   où commence la trame en haut
  int dbtrmh;
  dbtrmh = -nbmtfv*2;   //   intialement -nbmtfv*2
  
  //   où se termine la trame à droite
  int fntrmd;
  fntrmd = width+nbmtfh*2;   //   intialement width+nbmtfh*2
  
  //   où se termine la trame en bas
  int fntrmb;
  fntrmb = height+nbmtfv*2;   //   intialement height+nbmtfv*2
  
  
  
  
  //   couleurs
  /*color cq1 = color (255,20);
  color cq2 = color (255,30);
  color cq3 = color (255,40);
  color cq4 = color (255,50);*/
  
  color ce = color (0);
  color cl = color (255,0);
  
  //   ensemble de couleurs 1
  /*color cq1 = color (170,205,75,75);
  color cq2 = color (195,200,130,75);
  color cq3 = color (200,130,200,75);
  color cq4 = color (95,185,230,75);*/
  
  //   ensemble de couleurs 2
  /*color cq1 = color (73,62,62,150);
  color cq2 = color (126,109,108,150);
  color cq3 = color (139,127,111,150);
  color cq4 = color (157,147,131,150);*/
  
  //   ensemble de couleurs 3
  color cq1 = color (100);
  color cq2 = color (75);
  color cq3 = color (50);
  color cq4 = color (25);
  
  
  
  
  
  a = a + random(0,rand) - rand/2 + dplch;
  if (a < 0) { 
  a = random(0,nbmtfh);}
  if (a > nbmtfh) { 
  a = random(0,nbmtfh);}
  
  b = b + random(0,rand) - rand/2 + dplcv;
  if (b < 0) { 
  b = random(0,nbmtfv);}
  if (b > nbmtfv) { 
  b = random(0,nbmtfv);}
  
  c = c + random(0,rand) - rand/2 + dplch;
  if (c < 0) { 
  c = random(0,nbmtfh);}
  if (c > nbmtfh) { 
  c = random(0,nbmtfh);}
  
  d = d + random(0,rand) - rand/2 + dplcv;
  if (d < 0) { 
  d = random(0,nbmtfv);}
  if (d > nbmtfv) { 
  d = random(0,nbmtfv);}
  
  e = e + random(0,rand) - rand/2 + dplch;
  if (e < 0) { 
  e = random(0,nbmtfh);}
  if (e > nbmtfh) { 
  e = random(0,nbmtfh);}
  
  f = f + random(0,rand) - rand/2 + dplcv;
  if (f < 0) { 
  f = random(0,nbmtfv);}
  if (f > nbmtfv) { 
  f = random(0,nbmtfv);}
  
  g = g + random(0,rand) - rand/2 + dplch;
  if (g < 0) { 
  g = random(0,nbmtfh);}
  if (g > nbmtfh) { 
  g = random(0,nbmtfh);}
  
  h = h + random(0,rand) - rand/2 + dplcv;
  if (h < 0) { 
  h = random(0,nbmtfv);}
  if (h > nbmtfv) { 
  h = random(0,nbmtfv);}
  
  i = i + random(0,rand) - rand/2 + dplch;
  if (i < 0) { 
  i = random(0,nbmtfh);}
  if (i > nbmtfh) { 
  i = random(0,nbmtfh);}
  
  j = j + random(0,rand) - rand/2 + dplcv;
  if (j < 0) { 
  j = random(0,nbmtfv);}
  if (j > nbmtfv) { 
  j = random(0,nbmtfv);}
  
  k = k + random(0,rand) - rand/2 + dplch;
  if (k < 0) { 
  k = random(0,nbmtfh);}
  if (k > nbmtfh) { 
  k = random(0,nbmtfh);}
  
  l = l + random(0,rand) - rand/2 + dplcv;
  if (l < 0) { 
  l = random(0,nbmtfv);}
  if (l > nbmtfv) { 
  l = random(0,nbmtfv);}
  
  m = m + random(0,rand) - rand/2 + dplch;
  if (m < 0) { 
  m = random(0,nbmtfh);}
  if (m > nbmtfh) { 
  m = random(0,nbmtfh);}
  
  n = n + random(0,rand) - rand/2 + dplcv;
  if (n < 0) { 
  n = random(0,nbmtfv);}
  if (n > nbmtfv) { 
  n = random(0,nbmtfv);}
  
  
  
  
  
  //   depassement dans la forme
  
  
  
  
  
  if (c>g){
    c = random (0,nbmtfh);
    g = random (0,nbmtfh);}
  
  if (g>a){
    a = random (0,nbmtfh);
    g = random (0,nbmtfh);}
  
  if (a>i){
    a = random (0,nbmtfh);
    i = random (0,nbmtfh);}
  
  if (i>e){
    i = random (0,nbmtfh);
    e = random (0,nbmtfh);}
  
  if (b>d){
    b = random (0,nbmtfv);
    d = random (0,nbmtfv);}
  
  if (d>f){
    d = random (0,nbmtfv);
    f = random (0,nbmtfv);}
  
  if (f>h){
    f = random (0,nbmtfv);
    h = random (0,nbmtfv);}
  
  if (h>j){
    h = random (0,nbmtfv);
    j = random (0,nbmtfv);}
  
  
  
  
  //   fond
  
  
  
  noStroke ();
  if (lignes > 0){
  strokeWeight (sw);
  stroke (scolor);
  }
  fill (cq4);
  rect (0,0,width,height);
  
  
  
  //   TRIANGLES
  
  
  //   rappel espacement horizontal de base : +nbmtfh/espcmtf
  
  
  
  
  
  fill (cq3);
  for (int mltha = dbtrmg; mltha<fntrmd; mltha=mltha+nbmtfh/espcmtf){
    for (int mltva = dbtrmh; mltva<fntrmb; mltva=mltva+nbmtfv/espcmtf){
  //triangle (mltha+c,mltva+d,mltha+e,mltva+f,mltha+g,mltva+h);
  triangle (mltha+i,mltva+j,mltha+nbmtfh/espcmtf+c,mltva+d,mltha+e,mltva+nbmtfv/espcmtf+f);
  triangle (mltha+e,mltva+f,mltha+nbmtfh/espcmtf+g,mltva-nbmtfv/espcmtf+h,mltha+a,mltva+b);
  triangle (mltha+g,mltva+h,mltha+a,mltva+nbmtfv/espcmtf+b,mltha-nbmtfh/espcmtf+e,mltva+nbmtfv/espcmtf+f);
  
  //triangle (mltha+g,mltva+h,mltha+i,mltva+j,mltha+e,mltva+f);
  triangle (mltha+a,mltva+b,mltha+c,mltva+d,mltha+e,mltva+f);
  }}
  
  
  fill (cq2);
  for (int mltha = dbtrmg; mltha<fntrmd; mltha=mltha+nbmtfh/espcmtf){
    for (int mltva = dbtrmh; mltva<fntrmb; mltva=mltva+nbmtfv/espcmtf){
  triangle (mltha+e,mltva+f,mltha+nbmtfh/espcmtf+a,mltva+b,mltha+nbmtfh/espcmtf+c,mltva+d);
  triangle (mltha+i,mltva+j,mltha+a,mltva+nbmtfv/espcmtf+b,mltha+e,mltva+nbmtfv/espcmtf+f);
  
  //triangle (mltha+g,mltva+h,mltha+i,mltva+j,mltha+e,mltva+f);
  //triangle (mltha-nbmtfh/espcmtf+e,mltva+nbmtfv/espcmtf+f,mltha+c,mltva+d,mltha+g,mltva+h);
  triangle (mltha-nbmtfh/espcmtf+e,mltva+nbmtfv/espcmtf+f,mltha+c,mltva+d,mltha+g,mltva+h);
  //triangle (mltha+a,mltva+b,mltha+c,mltva+d,mltha+e,mltva+f);
  triangle (mltha+g,mltva+h,mltha+i,mltva+j,mltha+e,mltva+f);
  }}
  
  
  fill (cq1);
  for (int mltha = dbtrmg; mltha<fntrmd; mltha=mltha+nbmtfh/espcmtf){
    for (int mltva = dbtrmh; mltva<fntrmb; mltva=mltva+nbmtfv/espcmtf){
  //triangle (mltha+a,mltva+b,mltha+c,mltva+d,mltha+e,mltva+f);
  //triangle (mltha+g,mltva+h,mltha+i,mltva+j,mltha+e,mltva+f);
  //triangle (mltha-nbmtfh/espcmtf+e,mltva+nbmtfv/espcmtf+f,mltha+c,mltva+d,mltha+g,mltva+h);
  fill (cq1);
  triangle (mltha+c,mltva+d,mltha+e,mltva+f,mltha+g,mltva+h);
  
  
  
  
  
  //   ELLIPSE
  
  noStroke ();
  fill (sel);
  
  ellipse (mltha+a,mltva+b,tc,tc);
  ellipse (mltha+c,mltva+d,tc,tc);
  ellipse (mltha+e,mltva+f,tc,tc);
  ellipse (mltha+g,mltva+h,tc,tc);
  ellipse (mltha+i,mltva+j,tc,tc);
  }}
  
  
  
  
  
  //   texte
  
  
  
  
  /*fill (255);
  text (1,a,b-10);
  text (2,c,d-10);
  text (3,e,f-10);
  text (4,g,h-10);
  text (5,i,j-10);*/
  
  
}
