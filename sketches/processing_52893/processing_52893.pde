
// Luke Diamantopoulos, Problem set 1, Question 4
int NB = 35;
int columns, rows;

void setup() {
  size(280,280); // 280/8 = 8x8 grid full screen. The size has to be divided by 8.
  columns = width/NB;  // height/35 
  rows = height/NB; // width/35 
}

void draw() {
for (int i = 0; i < columns; i++) {  
for (int j = 0; j < rows; j++) {
      
 
int x = i*NB; 
int y = j*NB; 
     
stroke(0);
rect(x,y,NB,NB); 
      

      
    }
  }
}



