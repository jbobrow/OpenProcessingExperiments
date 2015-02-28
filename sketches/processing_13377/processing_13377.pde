
// jeu de la vie, un type d'automate cellulaire
// PrPierre, 2008

int DIM = 10;
float R;

int[][]C = new int[DIM][DIM];
int[][]D = new int[DIM][DIM];
int i,j;
float x,y;

void setup(){
  size(600,600);
  smooth();
  noStroke();
  R = width/DIM;
  frameRate(1);  
  for (i=0;i<DIM;i++)
   for (j=0;j<DIM;j++)
    {if (random(1)<0.5) C[i][j]=0; else C[i][j]=1;}

}

void draw(){
 background(120);
 // calcul nvelle etape
 for (i=0;i<DIM;i++)
  for (j=0;j<DIM;j++){
   int m=SommeMoore(i,j);
   if (C[i][j]==0)
     if (m==3) D[i][j]=1; else D[i][j]=0;
   else
     if ((m==2)||(m==3)) D[i][j]=1; else D[i][j]=0;
  }
 
 // affichage resultat
 x = R/2; y = R/2;
 for (i=0;i<DIM;i++){
  for (j=0;j<DIM;j++){
    if (D[i][j]==0) fill(0); else fill(255);
    ellipse(x,y,R,R);
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
 // calcul de i-1 mod DIM etc.
 int im1 = (i == 0)?DIM-1:i-1;
 int ip1 = (i == DIM-1)?0:i+1;
 int jm1 = (j == 0)?DIM-1:j-1;
 int jp1 = (j == DIM-1)?0:j+1;
 //somme du contenu des cases voisines
 int s = 0;
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


