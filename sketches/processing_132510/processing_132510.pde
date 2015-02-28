
//Carlyn Maw, January 2014
//Week 4 "Rinse, repeat", Example 4
//Draw squares based on how many rows and cols are wanted

//how many rows should there be
int rect_numberofRows = 10;
//how many columns should there be
int rect_numberofCols = 20;
//what is the minimum amount of space between squares
int rect_minMargin = 5;

//Variables whose value will be determined by math
int rect_totalWidthNeeded;
int rect_width;
int rect_totalHeightNeeded;
int rect_height;
int offsetX;
int offsetY;

void setup() {
  //how big is the stage
  size(300, 300);

  //figure out how wide the rectangles can be
  rect_totalWidthNeeded = (width-rect_minMargin)/rect_numberofCols;
  rect_width = rect_totalWidthNeeded - rect_minMargin;

  //figure out how tall the rectangles can be
  rect_totalHeightNeeded = (height-rect_minMargin)/rect_numberofRows;
  rect_height = rect_totalHeightNeeded - rect_minMargin;

  //make sure there is a margin at the top and on the left and that 
  //its size will leave the grid centered
  offsetX = (width-((rect_numberofCols*rect_totalWidthNeeded)-rect_minMargin))/2;
  offsetY = (height-((rect_numberofRows*rect_totalHeightNeeded)-rect_minMargin))/2;

  //draws the squares one column at a time
  for (int i = 0; i < rect_numberofCols; i++) {
    for (int j = 0; j < rect_numberofRows; j++) {
      rect((i*rect_totalWidthNeeded)+offsetX, (j*rect_totalHeightNeeded)+offsetY, rect_width, rect_height);
    }
  }
}



