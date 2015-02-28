
/*Nicole Strang
  ITGM 315 -- Processing
  10/15/2012
  Final Project -- Prototypes
  
  Prototype 1
  This exercise mainly continues a study in object orientation. The class contains rectangles which represent the puzzle pieces. Each rectangle is assigned a color
  from a separate color array. In draw, if the mouse is clicked within a rectangle's boundaries, then the computer prints the array value of the selected rectangle.
  To keep the computer from returning more than one value at a time, frame rate is reduced.
  
  Concrete understanding of class structure is necessary to creating a successful game.
  */


Puzzle[] pieces = new Puzzle[2];
color[] cVal = new color[2];

int i;
int spacing = 0;

void setup(){
  
  frameRate(12);
  size(300,300);
  background(255);
  rectMode(CENTER);
  
  cVal[0] = color(255,0,0);
  cVal[1] = color(0,0,0);
  
  for(int i=0; i<pieces.length; i++){
    pieces[i] = new Puzzle(i, width/3+spacing, height/3, 50, 50, cVal[i]);
    pieces[i].create();
    spacing+=60;
  }
  
}



void draw(){
  for(int i=0; i<pieces.length; i++){
    if(mousePressed==true && mouseX>=pieces[i].sendX()-24 && mouseX<=pieces[i].sendX()+24 && mouseY>=pieces[i].sendY()-24 && mouseY<=pieces[i].sendY()+24){
      print(pieces[i].sendValue() + " ||| ");
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

  void storeValue(int val){
    value = val;
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

