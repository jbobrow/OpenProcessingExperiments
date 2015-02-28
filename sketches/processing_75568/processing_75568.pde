
/*Nicole Strang
  ITGM 315 -- Processing
  10/15/2012
  Final Project -- Prototypes
  
  Prototype 2
  This prototype creates 9 blocks. Each block has a different color and position.
  
  If user clicks on a colored block adjacent to the white block (above, below, beside, or diagonal), the two blocks will change places. There are some bugs
  which I plan to fix in the next prototype by adding tighter rules.
  
  
  TO-DO:
  --Change so ONLY blocks beside, above, or below the white block can move.
  --Create a preset list of X and Y locations on a grid to place the blocks. Use this to randomize the coordinates of each block. (Use a function.)
  --Make sure the randomized values don't randomize to the solution to the puzzle.
  --Create a timer. Make the user unable to continue the puzzle after the timer ends.
  */


Puzzle[] pieces = new Puzzle[9];
color[] cVal = {color(255,0,55), color(223,0,83), color(195,0,111), color(167,0,139), color(139,0,167), color(111,0,195), color(83,0,223), color(55,0,255), color(255,255,255)};

int i, u, o, tempX, tempY;
int spacing = 0;

void setup(){
  
  frameRate(12);
  size(500,500);
  background(255);
  rectMode(CENTER);
  
  i = 0;
  for(int o=0; o<sqrt(pieces.length)*75; o+=75){ //row (X)
    for(int u=0; u<sqrt(pieces.length)*75; u+=75){ //column (Y)
      pieces[i] = new Puzzle(i, 100+u, 100+o, 50, 50, cVal[i]);
      pieces[i].create();
      i++;
    }
  }
  
}



void draw(){
  for(int i=0; i<pieces.length; i++){
    if(mousePressed==true && mouseX>=pieces[i].sendX()-24 && mouseX<=pieces[i].sendX()+24 && mouseY>=pieces[i].sendY()-24 && mouseY<=pieces[i].sendY()+24 && cVal[i]!=color(0,0,0)){
      print(pieces[i].sendValue() + " ||| ");
      
      if(pieces[8].sendX()-75>=pieces[i].sendX() || pieces[8].sendY()-75>=pieces[i].sendY() || pieces[8].sendX()+75>=pieces[i].sendX() || pieces[8].sendY()+75>=pieces[i].sendY()  ){
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

