
int tailleCarre = 50 ;
int nbCarre = 5;
int countMax;
int num = 0;
int xDecalage = 3, posX = 0;
int dimX , dimY;
int marge = 10;

void setup()
{
  size(1090,610);
  smooth();
  background(255);
  //nombre de carres par lignes et par colonnes
  dimX = (width-marge) / (tailleCarre + marge);
  dimY = (height-marge) / (tailleCarre + marge);
  countMax = int(pow(2,nbCarre*nbCarre));
}

void draw()
{
  background(255);
  int n = num;
  for(int i = 0; i < dimX+1; i++)
    for(int j = 0; j < dimY+1; j ++)
    {
      fill(255);
      stroke(30);
      rect(i*(tailleCarre+marge)+ marge + posX,j*(tailleCarre+marge)+marge,tailleCarre, tailleCarre);
      Carre c = new Carre(n,5);
      c.draw(tailleCarre,(i*tailleCarre)+(i+1)*marge+posX,(j*tailleCarre)+(j+1)*marge);
      n++;
    }
    
   posX = posX - xDecalage;
   if(abs(posX) > tailleCarre+marge+1)
   {
     num = num + dimY + 1  ; 
     if(num > countMax)
       num = 0 ; //:D
     posX = 0 ;
   }
     
   
}
class Carre
{
  int dim;
  int numCarre;
  int[][] matrice;
 
  Carre(int numCarre, int _dim)
  {
    dim = _dim;
    
    matrice = new int [dim][dim];
    for(int i=0; i <dim; i++)
      for(int j=0; j < dim; j++)
        matrice[i][j] = 0 ;
        
    int num = numCarre ;
    int i = 0, j=0;
    
    while(num > 0)
    {
      
      if(num%2 == 1)
      {
        matrice[i][j] = 1 ;
      }
      else
      {
        matrice[i][j] = 0 ;
      }
      
      num = int(num / 2) ;
      //println("Num: " + num);
      i = i + 1 ;
      if(i==dim)
      {
        j = j + 1 ;
        i = 0;
        if(j > dim)
          break;
      }     
    }
  }
  
  void draw(int taille, int xOrig, int yOrig)
  {
    int len = taille / dim;
    for(int i=0; i <dim; i++)
      for(int j=0; j < dim; j++)
        if(matrice[i][j]==1)
        {
          stroke(0);
          fill(0);
          rect(xOrig+(len*i),yOrig+(len*j),len,len);
        }
  }
}


