
int x;
int y;
int cols = 50;
int rows = 2;
int[][] myArray = new int[cols][rows];
void setup(){
    size(350,350);
    background(250,224,0);
    ptsaleatorios();
    paint();
}
  
 void ptsaleatorios(){
// ......
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = random(58,334);
   
   

  }    
}
// ......
     }
void paint(){
    for (int i = 0; i < cols; i++) {
    x = myArray[0][i];
    y = myArray[1][i];
    stroke(20);
    fill(20);
    ellipse(x,y,6,6);
    
    }
 }
