

//number of lines 2000
Cell[] myCells = new Cell[2000];
float angle;

void setup() { 
  // setting up the canvas
  background(250); 
  size(500, 500); 
  for (int i = 0; i < myCells.length; i ++) { 
    myCells[i] = new Cell(); 
  } 
  } 

 
  void draw() 
  {  
    // setting up the array
  myCells[0].isseed = true; 
  for (int i=0; i<myCells.length; i++) { 
    myCells[i].update(); 
    if (myCells[i].isseed == false) { 
      for (int j=0; j<myCells.length;j++) { 
        if (myCells[j].isseed == true) { 
                 float d; 
          d = PVector.dist(myCells[i].location, myCells[j].location); 
          if (d <20) { 
            myCells[i].isseed = true; 
            // line atributes
            stroke(255,50,50,150); 
            strokeWeight(.2); 
            line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y); 
         
          } 
        } 
      } 
    } 
  } 


} 




class Cell{ 
  PVector location = new PVector(); 
  PVector velocity = new PVector(); 
  float dia; 
  boolean isseed; 
  float cellred, cellgreen, cellblue; 
  float lineweight; 
  


  //then we construct it - using a 'constructor' 


  Cell(){ 
    //set up origin
    location = new PVector(250,250); 
     isseed = false; 
     lineweight = .5; 
  } 

  void display(){ 
    stroke(lineweight); 
    if(isseed == true){ 
      fill(255,255,0); 
    } 

    if(isseed == false){ 
    fill(cellred,cellgreen,cellblue); 
    } 

  } 

  void update(){ 
 
    if(isseed == false){ 
    velocity = new PVector(random(-150,150),random(-150,150));
  
    location.add(velocity); 
 
     } 
  } 
} 


  




