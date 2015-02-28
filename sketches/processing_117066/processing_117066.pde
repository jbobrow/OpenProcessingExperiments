
Cell[]myCells = new Cell [160];//161 cells

Cell myCell;

void setup() {
  size(500, 500); 
  colorMode(HSB, 360, 100, 100, 100);//sets colour to HSB and allows me to change the numbers if needed
  frameRate(21); //  the frame rate = frames per sec
  smooth(); //  
  for (int i = 0; i < myCells.length; i++) { // i = 0 - till the end of the array "length"(i.e 160). 161  i's one for each integer between 0 and 160
    myCells[i] = new Cell(); // for each i a new Cell is created 
    if ( (i>= 0 ) && (i<40) ){ // cells 0-39 to positionA, bottom right
      myCells[i].setPosition(5*width/6, 2*height/3, 11, 80, 75, 5, 25);//(xl, yl, cH, cS, cB, v)
    }
    if ((i >=40) && (i<80)) { //cells40-79 to positionB, top left
      myCells[i].setPosition(width/6, height/3, 20, 75, 66, 6, 20);
    }
    if ((i>=80)&&(i<105)) {//cells 80-109 to positionC, top right
      myCells[i].setPosition(2*width/3, height/3, 37, 58, 71, 4, 30);
    }
    if ((i>=105)&&(i<125)) {//cells 80-109 to positionD, bottom left
      myCells[i].setPosition(width/3, 2*height/3, 31,18,94, 2, 10);
    }
    if (i>=125) {//cells 124-160 to positionE, center 
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
  int num = 20; // num, the number of 
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
    //as the frameCount increases which increases (through 0-20 and repeat)  frame count = the number of frames that have been displayed since the program started
    numbersx[which] = xlocation; 
    numbersy[which] = ylocation; 
      /* which = (0-20 looped) one for each frame. frame rate is 21fps = 21 updates per second so there is one loop of 'which' values per second.
      the numbersx and numbersy arrays are given an xlocation and a ylocation for each value of 'which'(0to20).
       */
    for (int j = 0; j < num; j++) { 
      /* 
      from 0-num(20) j increases by 1 so in this example there are 21 'j's         
      */

      int index = (which+1 + j) % num; 
      /* index - variable 
      (which(0to20) + 1 + j(0to20)) % num (21) = index
       so, as 'which' +1 + 'j' is increasing through loops of 21 'index'is created which combines the two.
      index(0to20)
       */
      noStroke();
      fill(cHue, cSat, cBri, cAlph -10);
      ellipse(numbersx[index], numbersy[index], (dia/3)+j, (dia/3)+j); 
      
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



