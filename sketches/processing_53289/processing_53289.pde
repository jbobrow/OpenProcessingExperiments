
int n = 20; //Echelle (1 mm = n cases)

int a = 8*n;
int b = 3*n;
int c = 3*n;

double[][] bounds = new double[a+b][a];
double[][] world = new double[a+b][a];

int xi,yi;
int i;

int N = 100; //Nombres d'iterations par cycle

int A = 4; //Grossissement (n'affecte pas le calcul)
int C; //Variable pour dessiner le gradient

int EQ = 0; //1: trace equipotentielles, 0: trace pas eqp

void setup()
{
  //size(A*(a+b),A*a);
  size(880,640);
  background(0);
  noStroke();
  colorMode(HSB,100);
    
  for(xi = 0; xi < a+b; xi++)
    for(yi = 0; yi < a; yi++)
      bounds[xi][yi] = -1;
  
  for(xi = 0; xi < a; xi++){
    bounds[xi][0] = 0;
    bounds[xi][a-1] = 0;}
      
  for(xi = a; xi < a+b; xi++){
    bounds[xi][0] = 10;
    bounds[xi][a-1] = 10;}
  
  for(xi = a - b/2; xi < a; xi++){
    bounds[xi][(a-c)/2] = 10;
    bounds[xi][a - (a-c)/2] = 10;}
    
  for(yi = 0; yi < a; yi++){
    bounds[0][yi] = 0;
    bounds[a+b - 1][yi] = 10;
    if(yi < (a-c)/2 || yi > (a - (a-c)/2))
      bounds[a][yi] = 10;}  

  for(xi = 0; xi < a+b; xi++){
    for(yi = 0; yi < a; yi++){
      if(bounds[xi][yi] == -1) world[xi][yi] = 0;
      else world[xi][yi] = bounds[xi][yi];
    }}  
}

void draw()
{
  for(i = 0; i < N; i++){
    
  for(xi = 0; xi < a+b; xi++){
    for(yi = 0; yi < a; yi++){
      if (bounds[xi][yi] == -1)
        world[xi][yi] = 0.25*(
              world[xi-1][yi] +
              world[xi+1][yi] +
              world[xi][yi-1] +
              world[xi][yi+1] );
    }}
    
  }
    
  for(xi = 0; xi < a+b; xi++){
    for(yi = 0; yi < a; yi++){
      C = (int)(world[xi][yi]*0.1 * 100);
      fill(8*C/10,80,100);
      rect(A*xi,A*yi,A,A);
      
      if(EQ>0 && (int)(world[xi][yi]*10) % 10 == 0){
        fill(0);
        rect(A*xi,A*yi,A,A);}
    }}
}

