

//HINT - Ctrl+T auto-formats nesting

float col = 0;
float col2 = 0;
float col3 = 0;

Cell[] myCells = new Cell[2999];

void setup() {
  size(500, 500);
  background(0);

  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
  //for loop - (define integer variable; while 'i' is less than the length of cell list; add one more to 'i')
}

void draw() {

  for (int i=0; i< myCells.length; i++) {
    //myCells[i].display();
    myCells[i].update();
  }
  myCells[0].location.x = 250;
  myCells[0].location.y = 250;
  myCells[0].isseed = true;

  //setting the location of the seed cell to the centre of the page



    for (int i=0; i< myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j< myCells.length; j++) {
        if (myCells[j].isseed) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<=7) {
            myCells[i].isseed = true;
            strokeWeight(0.5);
            stroke(col3, col, col2);
            noFill();
            quad(myCells[i].location.x, myCells[i].location.y, myCells[i].location.x, myCells[j].location.y, myCells[j].location.x, myCells[j].location.y, myCells[j].location.x, myCells[i].location.y);
            //draws a 'quad' using 4 xy coordinates derived from the locations of the two cells being compared
            col += 0.5;
            if (col>=255) {
              col2 += 0.5;
            }

            if (col2>=255) {
              col3 += 0.5;
            }

            if (col3>=255) {
              col = 0;
              col2 = 0;
              col3 = 0;
            }
          //These three if statements monitor the colour values used in the RGB for stroke colour. If the first in 'G' reaches 255+ then the 
          //second colour, in 'B' will begin to increase. When colour 2 reaches 255+ then colour 3, in 'R' increases. Once all colour values
          //are 255+ the values all reset back to 0 and begin the loop again  
        }
          
        }
      }
    }
  }
}

//this is the cell classe. We defnie it in two parts. First we delare its variables:

class Cell{
  
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  
//then we construct it - using a 'constructor 
  
  Cell(){
  
    location = new PVector(random(500),random(500));
    //defines the new location by a vector with a random x and a random y
    dia = 2;
    isseed = false;
    cellred = 0;
    cellgreen = 0;
    cellblue = 0;
    lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);
    if(isseed == true){
      fill(0,213,255);
      stroke(0,213,255);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    }
    ellipse(location.x,location.y,dia,dia);
  }
  void update(){
    if(isseed == false){
      velocity = new PVector(random(-8,8),random(-8,8));
      location.add(velocity);
    }
  }
}


  
  
    
  


