
int startVerticalLine = 20; //where the first vertical line is
int startHorizontalLine = 20;
int gridSpacing = 20; // how much the vertical lines are spaced

void setup() {
 size(600, 600); 
}

void draw() {
  
  //draw vertical lines for grid
  while(startVerticalLine < width){
    line(startVerticalLine, 0, startVerticalLine, height);
    startVerticalLine = startVerticalLine + gridSpacing;
  }
  
  //draw horizontal lines for grid
  while(startHorizontalLine < height){
    line(0, startHorizontalLine, width, startHorizontalLine);
    startHorizontalLine = startHorizontalLine + gridSpacing;
  }
}


