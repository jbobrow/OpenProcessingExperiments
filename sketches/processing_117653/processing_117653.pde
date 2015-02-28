
//This code has been derived from the ARC8068 Lecture 2.
//The aim is to achieve the first task given in the lecture
//The task is increasing number of cells, changing their speed and 
//giving them a tendency to move toward one direction.



Cell[] myCells = new Cell[250];


void setup(){
  
  size(600,600);  //or I can increase the screen size, as well
  
  for (int i=0; i<myCells.length; i++){
    myCells[i]=new Cell();  
    
  }
  

frameRate(10);  
  
}

void draw(){
  
  background(255);
  for(int i=0; i<myCells.length; i++){
     
  
  myCells[i].display();
  myCells[i].update();
  
  
}
}
// This tab defines the behaviour of the cells.
// Or I call this new tab DNA page of the cell.

class Cell{
  
  
  float s= 1;   // This allows me to see an individual cell in bigger size on the screen, to observe the behaviour.
  float xlocation, ylocation; // Starting point on matrix
  float dia; //dimention
  float cellred, cellgreen, cellblue; //Color definitions combined in one line
  float lineweight; //stroke...
  boolean isseed; //whether the cell is seed or just independent one... (at this stage, I am not exactly sure what is this for)
  
  
  Cell(){    //define the parameters
    
    xlocation=random(0,600);    // I want cell to appear in random points
    ylocation=random(0,600);
    dia=5*s;  // This is the parameter I made cells smaller /////s = scale
    isseed =false;  //Again, just keeping it. Do not know what its purpose
    cellred=10;
    cellgreen=200;
    cellblue=200;
    lineweight=0.5;
    
  }
  
  void display(){    // First function created to make cells visible on screen
    
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(xlocation,ylocation,dia,dia);
    
  
}

  void update(){        //Funtion to give cells motion. And I will make my intervention here to change the speed as well as the frame rate.
    
   
    xlocation=xlocation+random(-0.5,4);
    ylocation=ylocation+random(-2,3);
    
    // In original code, since increasement is define equally in x and y directions, all indivudial cells show a neutral behaviour.
    //In case I change the difference in increasement between x and y marigins, I will achieve to give cells tendency in one direction.
    //To do this, I set the number of cells to 1, and observed the behaviour of cell in bigger size, first.

}
}
