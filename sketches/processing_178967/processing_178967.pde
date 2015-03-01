
/**Processing Sketch inspired by BAMO 1999 Problem
 *
 * When a square is clicked, every square in the same row and 
 * column change state (color).
 * The objective is to try to get every square to the same color 
 *
 * Created by Oluwasanya Awe
 * https://www.mathemazier.wordpress.com
 *
 * Released on 23/12/2014
 *
 * Problem 3. Bay Area Mathematical Olympiad 1999
 * A lock has 16 keys arranged in a 4 x 4 array, each key
 * oriented either horizontally or vertically. In order to
 * open it, all the keys must be vertically oriented. When
 * a key is switched to another position, all the other keys
 * in the same row and column automatically switch their
 * positions too (see diagram). Show that no matter what
 * the starting positions are, it is always possible to open
 * this lock. (Only one key at a time can be switched.) 
 *
 * One solution to this problem can be found on UC Berkeley's site:
 * http://mathcircle.berkeley.edu/newsitedocs/bamodocs/bamo1999examsol.pdf
 *
 */

//Initializing the 'squares' class to be used in creating the 4 x 4 grid
Squares squares =  new Squares();

void setup() {
  size(600, 600);  
  background(0);
  stroke(47, 167, 23); 
  strokeWeight(2.5); 
  smooth();
  squares.createArray(); // Laying out a random initial grid arrangement
}

void draw() {
}

void mouseClicked() {  
  //assigning different points on the grid to numbers 0 through 15
  int squareNumber = 4*floor(mouseX/150) + floor(mouseY/150);   
  //updating the 4 x 4 grid based on which square is clicked
  squares.updateArray(squareNumber); 
  
  for (int j = 0; j < 16; j++) { 
    //applying the effects of clicking on a square to the 16 squares 
    //for the squares    
    fill(squares.getState()[j]*233);    
    rect(floor(j/4)*150, (j%4)*150, 150, 150);
  } 
  
  if (squares.sumArray() == 0 || squares.sumArray() == 16){
    squares.createArray();
    }    
  
}

/*this defines the square class used to create the 4 x 4 grid 
 and to facilitate interaction*/

class Squares {   
  //initializing an array to contains the states (in terms of color) of 
  //each of the 16 squares
  int[] squareState = new int[16];   

  
  void createArray() {     
    for (int i = 0; i < 16; i++) {    
      squareState[i] = (int)random(0, 2);
      int value = squareState[i]*233;
      fill(value);     
      rect(floor(i/4)*150, (i%4)*150, 150, 150);
    }
  }

  void updateArray(int i) {  

    for (int j = 0; j < 4; j++) {
      squareState[4*j+(i%4)] = abs(1-squareState[4*j+(i%4)]);
    }

    for (int j = floor (i/4)*4; j < (floor(i/4)+1)*4; j++) {
      squareState[j] = abs(1-squareState[j]);
    }    

    squareState[i] = abs(1-squareState[i]);
  }

  int[] getState() {
    return squareState;
  }
  
  int sumArray(){
    int sum = 0;
    for (i = 0; i<16; i++){
      sum += squareState[i];
    }
    return sum;
  }
}

