
int CR = 30;
int cols = CR;
int rows = CR;
float [][] tam = new float [cols][rows]; 
float [][] tra = new float [cols][rows]; 

void setup (){
  frameRate (5);
size ( 600,600);
smooth();
for(int i =0; i<cols; i++){
    for(int j =0; j<rows; j++){
      tam [i][j]= random (2,width/CR);
            tra [i][j]= random (2,255);}}}

void draw (){
  fill (10);
rect (0,0,width,height);
 
 for (int i = 0 ; i < cols; i++) {
  for (int j =0; j < rows; j++) {
   // for ( int t = 0; t< cols ; t++ )
    fill(255,tra[i][j]);
    ellipse(i*(width/cols)+width/(cols*2),j*(height/rows)+height/(rows*2),tam[i][j],tam[i][j]);
  }}
}

