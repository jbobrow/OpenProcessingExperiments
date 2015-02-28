
final int TAILLE = 1000;

float[ ] tableauDeX;
float[ ] tableauDeY;

void setup() {
  size(400,400);
  smooth();
  
  tableauDeX = new float[TAILLE];
  tableauDeY = new float[TAILLE];
  
  /*
  tableauDeX[0] = 100;
  tableauDeY[0] = 100;
  
  tableauDeX[1] = 200;
  tableauDeY[1] = 200;
  
  tableauDeX[2] = 250;
  tableauDeY[2] = 250;
  */
  
  int i =0;
  while ( i < TAILLE ) { // i < 3
   tableauDeX[ i ] = random(0,width);
   tableauDeY[ i ] = random(0,height);
   i = i+1; 
  }
  
}


void draw () {
  background(0);
  /*
  ellipse(tableauDeX[0],tableauDeY[0],30,30);
  ellipse(tableauDeX[1],tableauDeY[1],30,30);
  ellipse(tableauDeX[2],tableauDeY[2],30,30);
  */
  /*
  int i = 0;
  while ( i < TAILLE ) {
    tableauDeX[i] = tableauDeX[i] + random(-5,5);
    tableauDeY[i] = tableauDeY[i] + random(-5,5);
   ellipse( tableauDeX[i] , tableauDeY[i] , 30 , 30);
   i = i + 1; 
  }
  */
  for ( int i = 0; i < TAILLE ; i = i + 1 ) {
   
    ellipse( tableauDeX[i] , tableauDeY[i] , 30 , 30);
  }
  
}
