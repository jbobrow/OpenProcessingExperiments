
void setup() {
  size(1050, 500);     
}
int leftoffset = 40;
int topoffset = 20;
int colwidth = 40;
int rowheight = colwidth;
int[][] grid = new int [11][11];
 
int leftoffset1=leftoffset+colwidth*13;
int topoffset1 = topoffset;
int[][] grid1 = new int[11][11];
void draw() {
 
  for ( int r = 0;r<=10;r++) {
    for (int c = 0;c<=10;c++) {
      rect(leftoffset+r*colwidth, topoffset+c*rowheight, colwidth, rowheight); 
      rect(leftoffset1+r*colwidth, topoffset1+c*rowheight, colwidth, rowheight);
       
      if (grid[r][c] ==1 ) {
        fill(0);
      }
      else if (grid[r][c] == 0) {
        noFill();
      }
      else {
      }
    }
  }
}
void mousePressed() {
  int i=(int)((mouseX-leftoffset)/colwidth);  
  int j = (int)((mouseY-topoffset)/rowheight);
  int i1 = (int)((mouseX-leftoffset1)/colwidth);
  int j1 = (int)((mouseY-topoffset1)/rowheight);
 
 
 
  if (i >10&&j>10 ) {
    System.out.println(-1);
  }
  else if (mouseX <30 ||mouseY <21 ) {
    System.out.println(-1);
  }
  else if  ( mouseX > 470 && mouseX < 570 ) {
    System.out.println(-1);
  }
  else if (mouseX < leftoffset) {
    System.out.println(-1);
  }
 
  else if (mouseX< topoffset) {
    System.out.println(-1);
  }
  else if (mouseX>=1010) {
    System.out.println(-1);
  }
  else if (i >=13 && i <24) {
    i=i-13;
    System.out.println("x:"+i+"y:"+j);
  }
  else if ( mouseX >leftoffset1+colwidth*11) {
    System.out.println(-1);
  }
  else if (i >= 11) {
    System.out.println(-1);
  }
   
  else  {
    System.out.println("x:"+i + "y:"+j);
  }
   
}

