
int x;
int y;
int cols = 15;
int rows = 100;
int[][] myArray = new int[cols][rows];
void setup(){
    size(450,450);
    background(255,204,0);
    ptsaleatorios();
    paint();
}
  
 void ptsaleatorios(){
// ......
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = random(20,224);
   
   

  }    
}
// ......
     }
void paint(){
    for (int i = 0; i < cols; i++) {
    x = myArray[0][i];
    y = myArray[1][i];
    stroke();
    fill(20);
    ellipse(x,y,6,6);
    
    }
 }
