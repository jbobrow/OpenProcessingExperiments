
//Carlyn Maw, January 2014
//Week 4 "Rinse, repeat", Example 3
//Draw squares based on how large the squares should be

//WORKS DIFFERENTLY IN JAVA MODE AND JAVASCRIPT MODE.
//since javascript is basically all floats we need to add
//the "floor" function which is not necessary in Java mode

//how big should the square be and how much padding?
int sq_width = 30;
int sq_margin = 6;
int sq_totalRoomNeeded = sq_width + sq_margin;

//variables that will be set by math below.
int sq_numberOfRows;
int sq_numberOfCols;
int offsetX;
int offsetY;

void setup() {
  //how big is the stage
  size(400, 300);

  //determine the number of possible columns based on the picked
  //sizes for the squares and the margins
  //floor() is to make this work properly in javascript mode
  sq_numberOfCols = floor((width-(2*sq_margin))/sq_totalRoomNeeded);

  //determine the number of possible rows based on the picked
  //sizes for the squares and the margins
  //floor() is to make this work properly in javascript mode
  sq_numberOfRows = floor((height-(2*sq_margin))/sq_totalRoomNeeded);

  //make sure there is a margin at the top and on the left and that 
  //it will leave the grid centered
  offsetX = (width-((sq_numberOfCols*sq_totalRoomNeeded)-sq_margin))/2;
  offsetY = (height-((sq_numberOfRows*sq_totalRoomNeeded)-sq_margin))/2;

  //draws the squares one column at a time
  for (int i = 0; i < sq_numberOfCols; i++) {
    for (int j = 0; j < sq_numberOfRows; j++) {
      rect((i*sq_totalRoomNeeded)+offsetX, (j*sq_totalRoomNeeded)+offsetY, sq_width, sq_width);
    }
  }
}



