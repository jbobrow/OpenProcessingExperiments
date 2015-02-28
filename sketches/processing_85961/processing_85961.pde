
int cols = 10;
int rows = 10;
float colSize;
float rowSize;
float border = 20;
boolean squares[] = new boolean[rows*cols];
 
int previousSquare = -1;
 
void setup() {
 
  size(256,256);
   
   
  frameRate(20);
  colSize = (width-border*2-1) / float(cols);
  rowSize = (height-border*2-1) / float(rows);
 
  textAlign(CENTER,CENTER);
}
 
 
void draw() {
 
   
    background(204);
 
    if (mousePressed) {
      checkMouse();
    }
    else {
      previousSquare = -1;
    }
 
 
    // Grid
    stroke(128);
    for (int i = 0;i < (cols) ;i++) {
      line(i*colSize+border,border,i*colSize+border,height-border-1);
    }
    for (int i = 0;i < (rows) ;i++) {
      line(border,i*rowSize+border,width-border-1,i*rowSize+border);
    }
 
    // Last line of grid
    line(width-1-border,border,width-1-border,height-border-1);
    line(border,height-1-border,width-1-border,height-1-border);
 
    // Text
    fill(0);
    for (int r = 0; r < rows; r++) text(r, border/2, (r+0.5)*rowSize+border);
    for (int c = 0; c < cols; c++) text(c, (c+0.5)*colSize+border, border/2);
 
    // Squares
    fill(128);
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (squares[r*cols+c] == true) {
          rect(c*colSize+border,r*rowSize+border,colSize,rowSize);
        }
      }
    }
   
}
 
void mousePressed() {
  frameRate(20);
  previousSquare = -1;
  checkMouse();
 
}
 
 
void checkMouse() {
  int c = floor((mouseX - border)/colSize);
  int r = floor((mouseY - border)/rowSize);
 
  if (c >= 0 && r >= 0 && c < cols && r < rows)  {
    int index = r*cols + c;
    //println(index);
    if (index != previousSquare ) {
      squares[index] = !squares[index];
      previousSquare = index;
    }
  }
  // println(r+" "+c);
}
 
 
void keyPressed() {
   
  for (int i =0; i < squares.length; i++) {
     
    squares[i]= false;
  }
   
}
