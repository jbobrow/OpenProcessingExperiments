
int count = 0;
int rows = 6;
int cols = 7;
int winner = 0;
CircleButton[][] grid = new CircleButton[cols][rows];
int[][] gridChecker = new int[cols][rows];
boolean locked = false;
boolean gameOn = true;

void setup()
{
  smooth();
  for (int a = 0; a<cols; a++) {
    for (int b = 0; b<rows; b++) {
      gridChecker[a][b] = 10;
    }
  }
  int a;
  int b;
  for ( a = 0; a<cols; a++) {
    for (b = 0; b<rows; b++) {
      grid[a][b] = new CircleButton(100*a + 50, 100*b + 50, 80, color(255), color(153));
    }
  }
  
  color buttoncolor = color(204);
  color highlight = color(153);
  ellipseMode(CENTER);

  size(700, 600);
  background(255, 204, 0);
 
  
  stroke(126);
  for ( int c = 1; c <= cols; c++) {
    line( c*(width/cols), 0, c*(width/cols), height);
  }
  for (int c = 1; c<=rows; c++) {
    line(0, c*(height/rows), width, c*(height/rows));
  }
}
void draw()
{
  update(mouseX, mouseY);
  for (int c = 0; c<cols; c++) {
    for (int d = 0; d<rows; d++) {
      grid[c][d].display();
    }
  }
  if (checkWin() == true) {
    gameOn = false;
    PFont font = loadFont("ARCARTER-78.vlw");
    textFont(font, 85);
    if (winner == 4) {
      shadowtext("Red Wins!", width/4, height/2, 3);
    }
    else if(winner == 8) {
      shadowtext("Black Wins!", width/3.5, height/2, 3);
    }
    shadowtext("Click to play again", width/5.5, height*.3, 1);
  }

}
  void shadowtext (String s, float x, float y, int o) {
    fill(100,100);
    text(s, x+o, y+o);
    fill(58,12,247);
    text(s, x, y);
  }
  void mousePressed() {
    if(gameOn == false) {
      gameOn = true;
      setup();
    }
  }

  boolean checkWin()
  {

    int counter;
    //horizontal
    for (int a=0; a < rows; a++) {
      for (int b=0; b < cols-3; b++) {
        int tCheck = (gridChecker[b][a]) + (gridChecker[b+1][a]) + (gridChecker[b+2][a]) + (gridChecker[b+3][a]);
        if (tCheck == 8 || tCheck == 4)
        {
          winner = tCheck;
          return true;
        }
      }
    }


    //vertical
    for (int a=0; a < rows-3; a++) {
      for (int b=0; b < cols; b++) {
        int tCheck = (gridChecker[b][a]) + (gridChecker[b][a+1]) + (gridChecker[b][a+2]) + (gridChecker[b][a+3]);
        if (tCheck == 8 || tCheck == 4)
        {
          winner = tCheck;
          return true;
        }
      }
    }


    //diagonals
    for (int a=0; a < rows-3; a++) {
      for (int b=0; b < cols-3; b++) {
        int tCheck = (gridChecker[b][a]) + (gridChecker[b+1][a+1]) + (gridChecker[b+2][a+2]) + (gridChecker[b+3][a+3]);
        if (tCheck == 8 || tCheck == 4)
        {
          winner = tCheck;
          return true;
        }
      }
    }


    for (int a =0; a < rows-3; a++) {
      for (int b=0; b < cols-3; b++) {
        int tCheck = (gridChecker[b][a]) + (gridChecker[b+1][a+1]) + (gridChecker[b+2][a+2]) + (gridChecker[b+3][a+3]);
        if (tCheck == 8 || tCheck == 4)
        {
          winner = tCheck;
          return true;
        }
      }
    }

    for (int a=0; a < rows-3; a++) {
      for (int b=3; b < cols; b++) {
        int tCheck = (gridChecker[b][a]) + (gridChecker[b-1][a+1]) + (gridChecker[b-2][a+2]) + (gridChecker[b-3][a+3]);
        if (tCheck == 8 || tCheck == 4)
        {
          winner = tCheck;
          return true;
        }
      }
    }

    return false;
  }



  void update(int x, int y)
  {

    if (mousePressed && gameOn) {
      for (int c = 0; c<cols; c++) {
        for (int d = 0; d<rows; d++) {
          if (grid[c][d].pressed() && (grid[c][d].getColor() == color(255)|| grid[c][d].getColor() == color(153)) ) {
            if (d == 5 || (gridChecker[c][d + 1] == 1 || gridChecker[c][d+1] == 2)) {
              grid[c][d].setHighlight();
              count++;
              if (count % 2 == 0) {
                grid[c][d].setColor(color(255, 0, 0));
                gridChecker[c][d] = 1;
              }
              else {
                grid[c][d].setColor(color(0));
                gridChecker[c][d] = 2;
              }
            }
          }
        }
      }
    }
    if (locked == false && gameOn) {
      for (int c = 0; c<cols; c++) {
        for (int d = 0; d<rows; d++) {
          //grid[c][d].canHighlight();
          grid[c][d].update();
        }
      }
    }
    else {
      locked = false;
    }
  }

  class CircleButton
  {

    color basecolor;
    int x, y;
    int size;
    color highlightcolor;
    color currentcolor;
    boolean highlight;
    boolean over = false;
    boolean pressed = false;  
    CircleButton(int ix, int iy, int isize, color icolor, color ihighlight)
    {
      x = ix;
      y = iy;
      size = isize;
      highlightcolor = ihighlight;
      currentcolor = icolor;
      highlight = true;
    }
    void setHighlight() {
      highlight = false;
    }

    void update()
    {
      if (over() && highlight == true ) {
        currentcolor = highlightcolor;
      }
      else if (currentcolor == highlightcolor && !over()) {
        currentcolor = color(255);
      }
      else {
        currentcolor = currentcolor;
      }
    }

    boolean pressed()
    {
      if (over) {
        locked = true;
        return true;
      }
      else {
        locked = false;
        return false;
      }
    }


    boolean overCircle(int x, int y, int diameter)
    {
      float disX = x - mouseX;
      float disY = y - mouseY;
      if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
        return true;
      }
      else {
        return false;
      }
    }



    void setColor(color a) {
      currentcolor = a;
    }
    color getColor() {
      return currentcolor;
    }

    boolean over()
    {
      if ( overCircle(x, y, size) ) {
        over = true;
        return true;
      }
      else {
        over = false;
        return false;
      }
    }

    void display()
    {
      smooth();
      stroke(currentcolor);
      fill(currentcolor);
      ellipse(x, y, size, size);
    }
  }


