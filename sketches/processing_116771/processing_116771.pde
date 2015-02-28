
Cell[]myCells = new Cell [170];//161 cells

Cell myCell;

void setup() {
  size(500, 500); 
  colorMode(HSB, 360, 100, 100, 100);//sets colour to HSB and allows me to change the numbers if needed
  frameRate(60); //  the frame rate
  smooth(); // smooths "animation" 
  for (int i = 0; i < myCells.length; i++) { // i = 0 - till the end of the array "length"(i.e 170). 171  i's one for each integer between 0 and 170
    myCells[i] = new Cell(); // for each i a new Cell is created 
    if ( (i>= 0 ) && (i<40) ){ // cells 0-39 to positionA 
      myCells[i].setPosition(5*width/6, 2*height/3, 11, 80, 75, 5, 25);//(xl, yl, cH, cS, cB, v)
    }
    if ((i >=40) && (i<80)) { //cells40-79 to positionB 
      myCells[i].setPosition(width/6, height/3, 20, 75, 66, 6, 20);
    }
    if ((i>=80)&&(i<105)) {//cells 80-109 to positionC
      myCells[i].setPosition(2*width/3, height/3, 37, 58, 71, 4, 30);
    }
    if ((i>=105)&&(i<125)) {//cells 80-109 to positionD
      myCells[i].setPosition(width/3, 2*height/3, 31,18,94, 2, 10);
    }
    if (i>=125) {
      myCells[i].setPosition(width/2, height/2, 3,80,17,10, 40);
  }
  }
}

void draw() {
  background(3, 80, 17);//background colour
  
  for (int i = 0; i<myCells.length; i++) { // for all applicable values of i
    myCells[i].display();// each cell is run through the display function
    myCells[i].update();// each cell is run through the update function
  }

}

class Cell { // the cell class: each version of cell[i] is taken through this

  float xlocation; // the x location of the updated cell
  float ylocation; // the y location of the updated cell
  float variance; // the "wobble" limit of the cell each time 'update' is called
  float cHue, cSat, cBri, cAlph; // colour fields and opacity field
  float pxlocation; // the original xlocation
  float pylocation; // the original y location
  float dia; // diameter of the cells
  int num = 20; // num 
  float numbersy[] = new float[num]; // a new array is created to store the input of the previous x locations. num is the number of places stored
  float numbersx[] = new float[num]; //// a new array is created to store the input of the previous y locations. num is the number of places stored




  Cell() {//original colony
    dia= 30;
    cAlph=random(0, 60);
    pxlocation = xlocation - variance; // so pxlocation will always = the originally set xl/xlocation position. this does not update
    pylocation = ylocation - variance;// pylocation will always = the originally set yl/ylocation position. this does not update
  
  }
  

  void display() { // this function is the "drawing" of the cell
    fill(cHue, cSat, cBri, cAlph); 
    ellipse(xlocation, ylocation, dia, dia);
    strokeWeight(0.5);    
    int which = frameCount % num; // which is the r of (frame count / num) (i.e 310/20 = 15 r10) which = 10. for 1/20 the remainder is 1
    numbersx[which] = xlocation; // array numbersx [which (1-20)] = xlocation. and so, each 'which'is allocated an xlocation
    numbersy[which] = ylocation; // array numbersy [which (1-20)] = ylocation. and so, each 'which'is allocated an ylocation
      for (int j = 0; j < num; j++) { // from 0-num(20) i increases by 1 so in this example there are 21 'i's
   
    int index = (which+1 + j) % num; /* (which + 1 + (i = (0-21)) % num (20) 
    where the smallest index value is correlated to the largest values of j and 
    and the "oldest" in the array
     */
    noStroke();
    fill(cHue, cSat, cBri, cAlph -10);
    ellipse(numbersx[index], numbersy[index], (dia/3)+j, (dia/3)+j); // biggest index = smallest j value. width and height of trail cells corrolate to the diameter of the cell
  }
  }

  void update() {//changing values here will mean that the values are updated each time the cell is "drawn"
    xlocation += random(-variance, variance);
    ylocation += random(-variance, variance);
    dia+= random(-0.1* variance, 0.1* variance);
    }
  
  

  void setPosition(float xl, float yl, float cH, float cS, float cB, float v, float d) {
    /* this allows me to create many colonies with minimum code
     by giving value to the fields outside of the Cell class
     */

    xlocation = xl;
    ylocation = yl;
    cHue = cH;
    cSat = cS;
    cBri = cB;
    variance = v;
    pxlocation = xl - v;
    pylocation = yl - v;
    dia = d;
  }
  
  
}




