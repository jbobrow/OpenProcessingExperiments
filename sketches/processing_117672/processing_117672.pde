
//This code is a review work of ARC8068_Lecture_3
//Playing with the existing code, I tried to figure out how variable values affect the pattern.
//To do this, I have identifed the possible variables as indicated below...


//PARAMETERS affecting the pattern //
// d<10 // dia=5 // velocity = (-1,1) // i=2000 //
//POSSIBLE RELATIONS//
//SURFACE HARDNESS//PLACEMENT//NUTRIENT//INOCULATION AMOUNT//I think this is the starting point to resemble the real growth process...
//But I havent figured out yet.


int scale=2;


//The scale is directly related to the ratio between cell amount&proximity&velocity   _____ 

int   CellAmount=    1000*scale ;
int   Proximity=     10*scale ;   
int   CellSize=      5*scale          ;         //This does not make any difference since the software recognises only one point in matrix, not the shape...
int   Velocity=      2*scale          ;   



Cell[] myCell= new Cell[CellAmount];

void setup(){
  
  
  size(500,500);
  background(125,190,125);
  for(int i=0;i<myCell.length;i++){
    
    myCell[i]=new Cell();
    
    if(i==0){
        myCell[i].setthefirstseed();
      }

  } 
}

void draw(){
  
  //background(255);
  for(int i=0;i<myCell.length;i++){
    
  //myCell[i].display();
  myCell[i].update();
  myCell[i].CheckEdges();
  
  myCell[0].isseed=true;
  
  }
  
  for (int i=0; i<myCell.length; i++) {
    if(myCell[i].isseed == false){
      for(int j=0; j<myCell.length;j++){
        if(myCell[j].isseed == true){
          float d;
          d = PVector.dist(myCell[i].location, myCell[j].location);
            if(d <Proximity){
              myCell[i].isseed = true;
              
              line(myCell[i].location.x,myCell[i].location.y,myCell[j].location.x,myCell[j].location.y);
              strokeWeight(0.1);
            }
          }
        }
      }

    }

}


class Cell{
  
  float xloc,yloc,red,green,blue,line;
  boolean isseed;
  PVector location;
  PVector velocity;

  Cell(){
    
    location=new PVector(random(0,500),random(0,500));
    
    line=1;
    isseed=false;
    red=0;
    green=0;
    blue=0;
 
  }
    
    void display(){
      noStroke();
      strokeWeight(line);
      
      if(isseed==false){
        
        fill(red,green,blue);
      }
      
      if(isseed==true){
        
        fill(0,0,0);
        
      }

      ellipse(location.x,location.y,CellSize,CellSize);
      
      fill(red,green,blue); 

    }
    
    
    void update(){
      
      if(isseed==false){
      
     velocity=new PVector(random(-Velocity,Velocity),random(-Velocity,Velocity));
     location.add(velocity); 
      
    }

    }
    
    void setthefirstseed(){     // I want the first seed in center, not randomly...
      
      location.x=250;
      location.y=250;
    }
    
    void CheckEdges(){
      
      if((location.x>width) || (location.x<0)){
        location.x=location.x*-1;
      }
      if((location.y>height) || (location.y<0)){
        location.y=location.y*-1;
      }
    }
  
}


