
Cell[]myCells = new Cell [120];

Cell myCell;

void setup() {
  size(500,500);
  frameRate(15);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);//changes mode to HSB
  for(int i = 0; i < myCells.length; i++){
    myCells[i] = new Cell();
    if (i <20){ // for cells 0-19
      myCells[i].setPositionA();
    }
    if ((i >=20) && (i<60)){// for cells 20-59
      myCells[i].setPositionB();
    }// others follow original Cell class function
  }
}

void draw(){
  background(222,35,36);
  smooth();
  for(int i = 0; i<myCells.length; i++){
    myCells[i].display();
    myCells[i].update();
  }
}
class Cell{
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellhue, cellsat, cellbright;
  float lineweight;
  float variance;
  
  
  Cell(){
  xlocation = width/2;
  ylocation = height/2; 
  dia= 10;
  isseed= false;
  cellhue = 180;
  cellsat = 20;
  cellbright= 30;
  lineweight = 0.5;
  variance = 4;
  }

void display(){
  stroke(cellhue, cellsat, cellbright+20); // colour of stroke
  strokeWeight(lineweight); // lineweight
  fill(cellhue, cellsat, cellbright); 
  ellipse(xlocation, ylocation, dia, dia);
  }

void update(){
  xlocation += random(-variance,variance);
  ylocation += random(-variance,variance);
  cellsat = random(25,65);
  cellhue= random(0,50);
  cellbright = random(40,60);
  lineweight= random(0.5,8);
  }
  
  void setPositionA(){
    xlocation = 400;
    ylocation = 400;
    variance = 3;    
  }
  void setPositionB(){
    xlocation = 130;
    ylocation = 130;
    variance = 8;
  }
}
  


