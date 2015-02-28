
Cell[] myCells = new Cell[120];

void setup(){

  background(255);
  size(500,500);
  smooth();
  
  for (int i=0; i<myCells.length; i++){
    myCells[i]=new Cell();  
    
  }
  
}

void draw(){
  
  
  
  for(int i=0; i<myCells.length; i++){
     
  myCells[i].display();
  myCells[i].update();
  myCells[i].nevercomeagain();
  
  
}
}

class Cell{  
  float xlocation, ylocation; 
  float dia; 
  float cellred, cellgreen, cellblue; 
  float lineweight;
  boolean isseed;  
  
  Cell(){    
    xlocation=random(0,500);
    ylocation=random(0,500);
    dia=10;
    isseed =false;
    cellred=174;
    cellgreen=133;
    cellblue=62;
    lineweight=0.001;    
  }
  
  void display(){
    
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(xlocation,ylocation,dia,dia);  
}
  void update(){    
    xlocation=xlocation+random(-3,3);
    ylocation=ylocation+random(-3,3);
    cellred=cellred+random(-3,3);
    cellblue=cellblue+random(-0,0);
    cellgreen=cellgreen+random(-0,0); 
    dia=dia+random(-1,1);  
}
void nevercomeagain(){
  
  if((xlocation<0) || (xlocation > 500)){
  xlocation=1500;
  }
  
  if((ylocation<0) || (ylocation > 500)){
  ylocation=1500;
  }
  
}
}


