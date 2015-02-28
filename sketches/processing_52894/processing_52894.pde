
// Luke Diamantopoulos, Problem set 1, Question 5
int NB = 35;
int columns, rows;

void setup() {
  size(280,280); // 280/8 = 8x8 grid full screen. The size has to be divided by 8.
  columns = width/NB;  // height/35 - this makes the height go up the screen
  rows = height/NB; // width/35 - this makes it go across the screen
}

void draw() {
for (int i = 0; i < columns; i++) { 
for (int j = 0; j < rows; j++) { 
      
 
int x = i*NB;  
int y = j*NB; 
     
stroke(0);
rect(x,y,NB,NB); 
      
      if ((i % 2 == 0) && (j % 2 == 0) || (i % 2 != 0) && (j % 2 != 0)) {
        fill(255);
      } else {
        fill(0);
      }

      
    }
  }
}



