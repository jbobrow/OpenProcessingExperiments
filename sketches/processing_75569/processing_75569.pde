
/*Nicole Strang
  ITGM 315 -- Processing
  10/15/2012
  Final Project -- Prototypes
  
  Prototype3
  This prototype is mainly a mathematical update. The pieces now randomize upon startup and only blocks north, south, east, or west of the white block
  will change locations.
  
  TO-DO:
  --Stop the game when the solution is reached.
  --Create a timer. Make the user unable to continue the puzzle after the timer ends.
  */



Puzzle[] pieces = new Puzzle[9];
color[] cVal = {color(255,0,55), color(223,0,83), color(195,0,111), color(167,0,139), color(139,0,167), color(111,0,195), color(83,0,223), color(55,0,255), color(255,255,255)};
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
  
  while(i<8){
      u = int(random(0,8));
      if(location[u]==0){
        pieces[i] = new Puzzle(i, locX[u], locY[u], 50, 50, cVal[i]);
        location[u] = 1;
        i++;
        print(i);
      }
    }
    
    pieces[8] = new Puzzle(8, locX[8], locY[8], 50, 50, cVal[8]);
  
}



void draw(){
  
  for(i=0; i<9; i++){
    pieces[i].create();
  }
  
  for(int i=0; i<9; i++){
    if(mousePressed==true && mouseX>=pieces[i].sendX()-24 && mouseX<=pieces[i].sendX()+24 && mouseY>=pieces[i].sendY()-24 && mouseY<=pieces[i].sendY()+24 && cVal[i]!=color(0,0,0)){
      print(pieces[i].sendValue() + " ||| ");
      
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

