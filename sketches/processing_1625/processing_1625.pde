
//
//This sketch will display a symmetrical image in an 8x8 grid
//

int cols = 4;
int rows = 8;

// declare 2D array
int[][] leftArray = new int[cols][rows];
int[][] rightArray = new int[cols][rows];

void setup() {
  stroke(0);
  background(0);
  fill(255);
  size(800,800);
  
  // Initialize left 2D array values
  for (int col = 0; col < cols; col++) {
      for (int row= 0;row < rows; row++) {
        // Initialize each object
         leftArray[col][row] =  1;
      }
   }
   
  // Initialize right 2D array values
  for (int col = 0; col < cols; col++) {
      for (int row= 0;row < rows; row++) {
        // Initialize each object
         rightArray[col][row] =  1;
      }
   }
} 

void draw() {
   createSeq_allOff();
   createSeq_random();
   mirrorSeq();
   displaySeq();
   delay(500);
}

void createSeq_allOff(){
  //This function switches each cell's state to 0
  for (int col= 0; col<4; col += 1){ 
    for (int row= 0; row<8; row += 1){ 
      leftArray[col][row] =0; 
         rightArray[col][row] =0;         
         }
    }
}

void createSeq_random(){
  //This function randomizes each cell's state to 1 or 0
  for (int col= 0; col<4; col += 1){ 
    for (int row= 0; row<8; row += 1){ 
      leftArray[col][row] =int(random(2));            
      }
  }
}

void mirrorSeq(){
  //This function mirrors the left array to the right array
  for (int row= 0;row<8; row += 1){ 
      for (int col= 0; col<4; col += 1){
         if (leftArray[col][row] == 1){
               rightArray[((4-(col+1))+1)-1][row] = 1;
            }
        }
    }
}

void displaySeq(){
  //This function displays the symmetrical image
     for (int col= 0; col<4; col += 1){ 
      for (int row= 0; row<8; row += 1){
         if (leftArray[col][row] == 1) 
             {
               fill(255); 
               rect((100*col),(100*row),100,100);
               fill(0);
             }
         else
             {
               fill(0);
               rect((100*col),(100*row),100,100);
               fill(255);
             } 
        }
  }
      for (int col= 0; col<4; col += 1){ 
      for (int row= 0; row<8; row += 1){
         if (rightArray[col][row] == 1) 
             {
               fill(255);
               rect(((100*col)+400),(100*row),100,100);
               fill(0);
             }
         else
             {
               fill(0);
               rect(((100*col)+400),(100*row),100,100);
               fill(255);
             } 
        }
  }
}



