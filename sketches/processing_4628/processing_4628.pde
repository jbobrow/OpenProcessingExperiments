
/*
 * Invader 2d drawing with sin movement
 * The sin movement is taken from processing examples ;)
 */

int[][] matrix = { { 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 },
                   { 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 },
                   { 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
                   { 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0 },
                   { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
                   { 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
                   { 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1 },
                   { 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0 },
                  
};
int mWidth = 11;
int mHeight = 8;
int multFactor = 1;
int cont = 0;
int blockSize = 30;
int divFactor = 0;

void setup()
{
size(500,500, P3D);  
background(0);

for(int j=0; j<mWidth; j++) { 
  for(int i=0; i<mHeight; i++) {
      if (matrix[i][j]!=0) matrix[i][j]=100 ;
    }
  } 
}

void draw()
{
background(0);
cont++;
rectMode(CENTER);
translate( width/2 , height/2 , -500);
rotateZ( radians( cont ) );  
rotateY ( radians ( cont ) );

for(int j=0; j<mWidth; j++) { 
  translate(blockSize + divFactor  ,(-blockSize*mHeight) - (divFactor*mHeight) );
  for(int i=0; i<mHeight; i++) {
    fill (matrix[i][j] + multFactor  , matrix[i][j] + multFactor + 100, matrix[i][j] + multFactor);
    //fill (matrix[i][j] * multFactor, matrix[i][j] * multFactor, matrix[i][j] * multFactor);
    translate( divFactor ,blockSize + divFactor );
    box(blockSize); 
  }
}
}


void keyPressed(){
  if (key == '1') {
    multFactor += 1;
  } else 
    if (key == '2') {
    multFactor -= 1;
  } else 
    if (key == '3') {
    blockSize += 1;
  } else 
    if (key == '4') {
    blockSize -= 1;
  } else 
    if (key == '5') {
    divFactor++;
  } else 
    if (key == '6') {
    divFactor--;
  }  
}


