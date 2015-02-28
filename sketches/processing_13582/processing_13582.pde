
// Voteurs (une autre sorte d'automate cellulaire) -- voters (another kind of cellular automata)
// d'apres - following : T. Toffoli and N. Margolus, Cellular Automata Machines, MIT Press, 1987, p.41
// Pr Pierre Jan. 1999 , adapted to Processing March 2009

int DIM = 200; // taille de la grille -- grid size <= 600
float R;

int[][]C = new int[DIM][DIM];
int[][]D = new int[DIM][DIM];
int i,j;
float x,y;

void setup(){
  size(600,600);
  smooth();
  //noStroke();
  R = width/DIM;
  strokeWeight(int(R));
  frameRate(1);  
  for (i=0;i<DIM;i++)
   for (j=0;j<DIM;j++)
    {if (random(1)<0.5) C[i][j]=0; else C[i][j]=1;}

}

void draw(){
 background(127);
 // calcul nvelle etape
 for (i=0;i<DIM;i++)
  for (j=0;j<DIM;j++){
   int m=SommeMoore(i,j);
   if (m<5) D[i][j]=0; else D[i][j]=1; // voteur simple
   //if ((m<4)||(m==5)) D[i][j]=0; else D[i][j]=1;  // voteur perturbe
  }
 
 // affichage resultat
 x = R/2; y = R/2;
 for (i=0;i<DIM;i++){
  for (j=0;j<DIM;j++){
    if (D[i][j]==0) stroke(0); else stroke(255);
    point(x,y);
    x += R;
   }
   y += R;x = R/2;
 }
 
 // recopie etat courant
 for (i=0;i<DIM;i++) for (j=0;j<DIM;j++) C[i][j]=D[i][j];

 println(frameCount);
}

void keyPressed(){
  noLoop();
  save("jeu"+frameCount+".png");
}

int SommeMoore(int i, int j) {
 int im1 = (i == 0)?DIM-1:i-1;
 int ip1 = (i == DIM-1)?0:i+1;
 int jm1 = (j == 0)?DIM-1:j-1;
 int jp1 = (j == DIM-1)?0:j+1;
  //int s = 0;
int s= C[i][j];
 s+= C[im1][jm1];
 s+= C[im1][j];
 s+= C[im1][jp1];
 s+= C[i][jm1];
 s+= C[i][jp1];
 s+= C[ip1][jm1];
 s+= C[ip1][j];
 s+= C[ip1][jp1];
 return s;     
}


