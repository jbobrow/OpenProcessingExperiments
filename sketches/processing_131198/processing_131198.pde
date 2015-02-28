
/*
 * Wolfram 2D Cellular Automata, by Henrique Silva.
 * Cellular Automata considering 4 neighbors and 1 active cell
 * in the center as seed, as described in Wolfram's A New Kind of Science.
 * 1023 diferent rules.
  
 * Code adapted from the Game of Life by Ricky Lai
 
 * Rule 204
 
*/
 
  
int worldX = 400;
int worldY = 400;
 
int[][] data = new int[worldX][worldY];
int intRule=204;
 
String ruleset = "";
 
int iteracoes=1;
PFont font;
   
void setup(){
  size(400,400);
  noStroke();
  
  // int to binary 
  //normalize string: 10 bits
   ruleset=binary(intRule,10);
 
  data[worldX/2][worldY/2] = 1;
 
 // frameRate(10);
}
  
void draw(){
   
 // background(75,75,75);
     background(255,255,255);

  rule();
   
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
      int eachSizeX = (int) width / worldX;
      int eachSizeY = (int) height / worldY;
      int x = i*eachSizeX;
      int y = j*eachSizeY;
      if(data[i][j] == 1){
        fill(0,0,204);
        rect(x,y,eachSizeX,eachSizeY);
      }
    }
  }
   
   
 
 drawLabel(iteracoes);
  iteracoes++;
 
 
}
  
void rule() {
  int[][] temp = new int[worldX][worldY];
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
            
      int totalNeighbors = neighbors(i,j);
             
      if(data[i][j] == 0 && totalNeighbors == 0){
        temp[i][j] = int(ruleset[9]);
      }
      else if(data[i][j] == 1 && totalNeighbors == 0 ){
        temp[i][j] = int(ruleset[8]);
      }
      else if(data[i][j] == 0 && totalNeighbors == 1){
        temp[i][j] = int(ruleset[7]);
      }
      else if(data[i][j] == 1 && totalNeighbors == 1 ){
        temp[i][j] = int(ruleset[6]);
      }
     else if(data[i][j] == 0 && totalNeighbors == 2){
        temp[i][j] = int(ruleset[5]);
      }
      else if(data[i][j] == 1 && totalNeighbors ==2 ){
        temp[i][j] = int(ruleset[4]);
      }
      else if(data[i][j] == 0 && totalNeighbors ==3){
        temp[i][j] = int(ruleset[3]);
      }
      else if(data[i][j] == 1 && totalNeighbors == 3 ){
        temp[i][j] = int(ruleset[2]);
      }
      else if(data[i][j] == 0 && totalNeighbors == 4){
        temp[i][j] = int(ruleset[1]);
      }
      else if(data[i][j] == 1 && totalNeighbors == 4 ){
        temp[i][j] = int(ruleset[0]);
      }
 
    }
  }
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
      data[i][j] = temp[i][j];
    }
  }
   
}
  
int neighbors(int i, int j) {
  int result = 0;
 
  if(j > 0 && data[i][j-1] == 1){
    result = result + 1;
  }
  if(i > 0 && data[i-1][j] == 1){
    result = result + 1;
  }
  if(i < worldX -1 && data[i+1][j] == 1){
    result = result + 1;
  }
  if(j < worldY -1 && data[i][j+1] == 1){
    result = result + 1;
  }
  return result;
  
}
 
   
void keyPressed(){
   
  if(key == 's')
  {
  
  }
}

 void drawLabel(int iteracao) {
     fill(100, 150);
     rect(0,height-20,width, 20 );
     fill(255);
     text("Rule="+intRule + "; Iteration=" + iteracao,5, height-5);
      
   }



