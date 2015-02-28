
//Making changes on the indivudial numbers of the array//
//     If Ican specify the values of some certain cells of array, it will give me change to use each cell to make forms... Maybe in 3D, as well 



Cell[] myCells= new Cell[99];


void setup(){

size(500,500);
for(int i=0; i<myCells.length; i++){
  
  myCells[i]=new Cell();
  
  if(i>25 && i<=35){
    myCells[i].changecolor(255,0,0);
    myCells[i].fixlocation(150,150);
  }
  
  if(i>35 && i<=70){
    myCells[i].changecolor(0,255,0);
    myCells[i].fixlocation(300,300);
  }

}

}


void draw(){
background(125,190,125);
for(int i=0;i<myCells.length;i++){
  
  myCells[i].display();
  myCells[i].update();
  myCells[i].checkedges();
  
}

}
class Cell{
  
  PVector location;
  PVector velocity;
  float lineweight;
  float a;
  float b;
  float red,green,blue;
  float pointweight;

  Cell(){
  
  location= new PVector(random(0,500),random(0,500));
  lineweight= 3;
  a=0;
  b=0;
  red=0;
  green=0;
  blue=0;
  pointweight=4;

  }

  void display(){
  
  strokeWeight(pointweight);  
  stroke(red,green,blue);
  point(location.x,location.y);
    

  }

  void update(){
    
  velocity= new PVector(random(-1,1),random(-1,1));
  location.add(velocity);
    
    
  }
  
  void checkedges(){
    
    if(location.x>width || location.x<0){
      location.x = location.x * -1;
    }
    
    if(location.y>width || location.y<0){
      location.y = location.y * -1;
    }
  
}


void changecolor(int aaa, int bbb, int ccc){
  
  red=aaa;
  green=bbb;
  blue=ccc;
  pointweight=8;

}

void fixlocation(int xxx, int yyy){
  
  location.x=xxx;
  location.y=yyy;
}

}


