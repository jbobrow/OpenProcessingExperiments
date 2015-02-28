
/*
 * Wolfram 2D Cellular Automata, by Henrique Silva.
 * Cellular Automata considering 4 neighbors and 1 active cell 
 * in the center as seed, as described in Wolfram's A New Kind of Science.
 * 1023 diferent rules.
 
 * Code adapted from the Game of Life by Ricky Lai
 
 * Mouse click to next rule. 
 * Also use the arrows to move between the rules or 
 * type the number (0-1023) of the rule and press Enter.

*/

import java.lang.*;
 
int worldX = 200;
int worldY = 200;

int[][] data = new int[worldX][worldY];
//int intRule=942;
int intRule=452;

String ruleset = "";

int iteracoes=1;

PFont font; 

String typedRule="";
 
void setup(){
  size(400,400);
  font = loadFont("ArialMT-48.vlw");
  textFont(font,18);
  textAlign(LEFT, TOP);
  noStroke();
 
 ruleset = Integer.toBinaryString(intRule);
  
  //normalize string: 10 bits
while (ruleset.length() < 10) {
  ruleset = "0" + ruleset;
}
  
  data[worldX/2][worldY/2] = 1;

  frameRate(10);
}
 
void draw(){
  
  background(255);
  rule();
  
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
      int eachSizeX = width / worldX;
      int eachSizeY = height / worldY;
      int x = i*eachSizeX;
      int y = j*eachSizeY;
      if(data[i][j] == 1){
        fill(0);
        rect(x,y,eachSizeX,eachSizeY);
      }
    }
  }
  
  
  fill(color(120,120,120));
  rect(10,10,100,30);
  fill(color(255,255,255));
  text("Rule: "+intRule, 15, 15); 

  iteracoes++;
  if (iteracoes==100) {
    intRule++;
    changeRule();
    }

}
 
void rule() {
  int[][] temp = new int[worldX][worldY];
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
           
      int totalNeighbors = neighbors(i,j);
            
      if(data[i][j] == 0 && totalNeighbors == 0){
        temp[i][j] = ruleset.charAt(9)-48;
      }
      else if(data[i][j] == 1 && totalNeighbors == 0 ){
        temp[i][j] = ruleset.charAt(8)-48;
      }
      else if(data[i][j] == 0 && totalNeighbors == 1){
        temp[i][j] = ruleset.charAt(7)-48;
      }
      else if(data[i][j] == 1 && totalNeighbors == 1 ){
        temp[i][j] = ruleset.charAt(6)-48;
      }
     else if(data[i][j] == 0 && totalNeighbors == 2){
        temp[i][j] = ruleset.charAt(5)-48;
      }
      else if(data[i][j] == 1 && totalNeighbors ==2 ){
        temp[i][j] = ruleset.charAt(4)-48;
      }
      else if(data[i][j] == 0 && totalNeighbors ==3){
        temp[i][j] = ruleset.charAt(3)-48;
      }
      else if(data[i][j] == 1 && totalNeighbors == 3 ){
        temp[i][j] = ruleset.charAt(2)-48;
      }
      else if(data[i][j] == 0 && totalNeighbors == 4){
        temp[i][j] = ruleset.charAt(1)-48;
      }
      else if(data[i][j] == 1 && totalNeighbors == 4 ){
        temp[i][j] = ruleset.charAt(0)-48;
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

void mousePressed()
{
  intRule++;
changeRule();

}
  
void changeRule() {
  
   ruleset = Integer.toBinaryString(intRule);
  
  //normalize string: 10 bits
  while (ruleset.length() < 10) {
    ruleset = "0" + ruleset;
  }
  iteracoes=1;
  
//empty array
 for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
      data[i][j] = 0;
    }
  }
  data[worldX/2][worldY/2]=1; 
 
  }
  
void keyPressed(){
  
  if(key == CODED)
  {
 
    switch(keyCode)
    {
      case LEFT: intRule--;changeRule(); break;
      case RIGHT: intRule++;changeRule(); break;
      case DOWN: intRule-=10;changeRule(); break;
      case UP: intRule+=10;changeRule(); break;
    }
  }
  else
  {

    if (key >='1' || key <='9') typedRule=typedRule+ key;
     
    if (key == 10) // Enter
    {
       int rule=Integer.parseInt(typedRule.trim());
      if (rule < 1024)
      {
       intRule=rule;
       changeRule();
      }
     typedRule="";
    }
  }
}

