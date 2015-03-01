

//number of cells
Cell[]myCells= new Cell[2000]; 


void setup() { 
  size(500, 500); 
  for (int i=0; i <myCells.length; i++) { 
    myCells[i]=new Cell(); 
  } 


 myCells[0].isseed=true; 
 myCells[1].isseed=true; 
 myCells[400].isseed=true; 
} 


void draw () { 
   background(255); 
  for (int i=0; i<myCells.length;i++) { 
    myCells[i].display(); 
    myCells[i].update(); 
  } 


  for (int i=0; i<myCells.length; i++) { 
    if (myCells[i].isseed== false) { 
      for (int j=0; j<myCells.length; j++) { 
        if (myCells[j].isseed==true) { 
          float d; 
          d= PVector.dist(myCells[i].location, myCells[j].location); 
          if (d<5) { 
            myCells[i].isseed=true; 
          } 
        } 
      } 
    } 
  } 
} 


class Cell { 
  PVector location= new PVector(); //creating vectors 
  PVector velocity=new PVector(); 
  float dia; 
  boolean isseed; 
  float cellred, cellgreen, cellblue; 
  float lineweight; 

  Cell() { 


    location = new PVector(random(500), random(500));  
    dia=10; 
    isseed=false; 
    cellred=225; 
    cellblue=225; 
    cellgreen=225; 
    lineweight=0.1; 


  } 


  void display() { 
    strokeWeight(lineweight); 
    if (isseed==true) { 
      fill(250, 50, 150); 
    } 


    if (isseed==false) { 
      fill(cellred, cellgreen, cellblue); 
    } 

     ellipse(location.x, location.y, dia, dia); 


  } 

  void update() { 
    if (isseed==false) {
     //determines range of movement 
      velocity = new PVector(random(-2, 2), random(-2, 2)); 
      location.add(velocity); 
    } 
  } 
} 
 












