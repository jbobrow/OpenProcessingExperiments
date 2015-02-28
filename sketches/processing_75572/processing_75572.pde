
/*Nicole Strang
  ITGM 315 -- Processing
  10/15/2012
  Final Project -- Prototypes
  
  Prototype 4
  This prototype makes the puzzle unable to solve after the pieces are in the correct location. The randomizer is removed for this test.
  
  TO-DO:
  --Create a timer. Make the user unable to continue the puzzle after the timer ends.
  */



Puzzle[] pieces = new Puzzle[9];
color[] cVal = {color(255,0,55), color(223,0,83), color(195,0,111), color(167,0,139), color(139,0,167), color(111,0,195), color(83,0,223), color(55,0,255), color(255,255,255)};
boolean[] numSolved = {false, false, false, false, false, false, false, false, false};
int[] location = {0, 0, 0, 0, 0, 0, 0, 0};
int[] locX = {100, 175, 250, 100, 175, 250, 100, 175, 250};
int[] locY = {100, 100, 100, 175, 175, 175, 250, 250, 250};

int i, u, o, tempX, tempY;
int spacing = 0;




void setup(){
  
  frameRate(12);
  size(350,500);
  background(255);
  rectMode(CENTER);
  
  /*
  Randomizer:
  
  while(i<8){
      u = int(random(0,8));
      if(location[u]==0){
        pieces[i] = new Puzzle(i, locX[u], locY[u], 50, 50, cVal[i]);
        location[u] = 1;
        i++;
        print(i);
      }
    }*/
    
  for(i=0; i<=6; i++){
    pieces[i] = new Puzzle(i, locX[i], locY[i], 50, 50, cVal[i]);
  }
  
  pieces[7] = new Puzzle(7, locX[8], locY[8], 50, 50, cVal[7]);
  pieces[8] = new Puzzle(8, locX[7], locY[7], 50, 50, cVal[8]);
    
  for(i=0; i<9; i++){
    pieces[i].create();
  }
  
}





void draw(){
  
  
  
  if( checkSolved()==false ){
    
    for(int i=0; i<9; i++){
    
    if(mousePressed==true && mouseX>=pieces[i].sendX()-24 && mouseX<=pieces[i].sendX()+24 && mouseY>=pieces[i].sendY()-24 && mouseY<=pieces[i].sendY()+24 && cVal[i]!=color(255,255,255)){
      
      if( checkMove(pieces[8].sendX(), pieces[8].sendY(), pieces[i].sendX(), pieces[i].sendY() ) ){
        tempX = pieces[8].sendX();
        tempY = pieces[8].sendY();
        pieces[8].storePos(pieces[i].sendX(), pieces[i].sendY());
        pieces[i].storePos(tempX, tempY);
        pieces[8].create();
        pieces[i].create();
      }
    }
   }
  }
  
}



boolean checkMove(int x8, int y8, int xi, int yi){
  if( xi==x8 && ( (yi-75)==y8 || (yi+75==y8) ) ){
    return true;
  }
  else if( yi==y8 && ( (xi-75)==x8 || (xi+75==x8) ) ){
    return true;
  }
  else{
    return false;
  }
}



boolean checkSolved(){
  int u=0;
  for(int i=0; i<9; i++){
    if( pieces[i].sendX()==locX[i] && pieces[i].sendY()==locY[i] ){
      numSolved[i]=true;
      u++;
    }
  }
  if(u==9){
    return true;
  }
  else{
    return false;
  }
}



class Puzzle{
  
  int value, xpos, ypos, w, h;
  color col;
 
 Puzzle(int val, int xval, int yval, int wide, int high, color c){
  value = val;
  xpos = xval;
  ypos = yval;
  col = c;
  w = wide;
  h = high;
 }

  void storePos(int xval, int yval){
    xpos = xval;
    ypos = yval;
  }
  
  int sendValue(){
    return value;
  }
  
  int sendX(){
    return xpos;
  }
  
  int sendY(){
    return ypos;
  }
  
  void create(){
    noStroke();
    fill(col);
    rect(xpos,ypos,w,h);
  }
  
}

