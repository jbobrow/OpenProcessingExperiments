
int ellipseDia = 50;
int numColumn = 5;
int rowLoc;
int gridIncrement;
int gridOffset;


void setup() {  //setup function called initially, only once
  size(500, 500);
  
  gridIncrement = width/numColumn;
  rowLoc = height/2;
  gridOffset = gridIncrement/2;
}

void draw() {  //draw function loops 
  background(255);  //set background white
  
  //row of ellipses
  ellipseMode(CENTER);
  ellipse(gridIncrement*0+gridOffset, rowLoc, ellipseDia, ellipseDia);
  ellipse(gridIncrement*1+gridOffset, rowLoc, ellipseDia, ellipseDia);
  ellipse(gridIncrement*2+gridOffset, rowLoc, ellipseDia, ellipseDia);
  ellipse(gridIncrement*3+gridOffset, rowLoc, ellipseDia, ellipseDia);
  ellipse(gridIncrement*4+gridOffset, rowLoc, ellipseDia, ellipseDia);
  
  ellipseDia = map(mouseX, 0, width, gridOffset, gridIncrement);
}
