
Cell[][] grid = new Cell[4][4];
Grid field;
int loop = 0;
void setup() {
  size(600,600);
  background(255);
  fill(230);
  field = new Grid();
  field.spawn();
  field.spawn();
}
 
void draw() {
   
  //redraws the grid
  fill(230);
  rect(100,100,400,400);
  for(int i = 100; i<=500; i+=100) {
    smooth();
    strokeWeight(3);
    line(100,i,500,i);
    line(i,100,i,500);
  }
   
  //draws the tiles with a numeric value
  for(Cell c: field.getOccupiedCells()) {
    c.drawTile();
    //print(c.row + "," + c.col + "   ");
    //print(field.getOccupiedCells().size());
    //println(" C: " + cell.col + " R: " + cell.row + " X: " + cell.xCoor  + " Y: " + cell.yCoor + " " + cell.number);
    //println("X: " + round((mouseX-100)/100) + " Y: " + round((mouseY-100)/100));
    //println("X: " + mouseX + " Y: " + mouseY);
  }
   
  //moves tiles when arrow key is pressed
  if(field.getOccupiedCells().size() <= 16 && (keyCode == UP || keyCode == DOWN|| keyCode == LEFT || keyCode == RIGHT) ) {
    field.moveTiles();
  }
  //println(keyCode);
}
 
public class Grid {
  int startCoor = 100;
  int endCoor = 500;
   
  public Grid() {
    //draws the boundary and lines of the grid
    rect(startCoor,startCoor,400,400);
    for(int i = startCoor; i<=endCoor; i+=100) {
      smooth();
      strokeWeight(3);
      line(startCoor,i,endCoor,i);
      line(i,startCoor,i,endCoor);
    }
    //creates the 4x4 grid of cell objects
    int x = startCoor;
    int y = startCoor;
    for(int r = 0; r<grid.length; r++) {
      for(int c = 0; c<grid[0].length; c++) {
        grid[r][c] = new Cell(x,y,r,c);
        x += 100;
      }
      y += 100;
      x = startCoor;
    }
  }
   
  //gets the cells that have a numeric value
  public ArrayList<Cell> getOccupiedCells() {
    ArrayList<Cell> cells = new ArrayList<Cell>();
    for(int r = grid.length-1; r>=0; r--) {
      for(int c = grid[0].length-1; c>=0; c--) {
        if(grid[r][c].hasNumber) {
          cells.add(grid[r][c]);
        }
      }
    }
    return cells;
  }
  
  public void spawn() {
    int i = 0;
    while(i < 1) {
      int r = (int)random(0,4);
      int c = (int)random(0,4);
      if(!grid[r][c].hasNumber) {
        grid[r][c].hasNumber = true;
        grid[r][c].number *= (int)random(0,2) + 1;
        i++;
      }
    }
  }
  
   //moves the tiles based on arrow keys
   public void moveTiles() {
    if(loop < 10 && keyCode != 0) {
      for(Cell c : getOccupiedCells()) {
        if(keyCode == UP && c.yCoor > 100 && c.row !=0) {
          if(!grid[c.row-1][c.col].hasNumber) {
            c.yCoor -= 50;
            if(c.yCoor%100 == 0) {
              c.changeCell(c.row-1,c.col);
            }
          }
          else if(grid[c.row-1][c.col].number == c.number && c.merge){
            c.yCoor -= 100;
            c.number *= 2;
            grid[c.row-1][c.col].merge = false;
            c.changeCell(c.row-1,c.col);
          }
        }
        else if(keyCode == RIGHT && c.xCoor < 400 && c.col !=3) {
           if(!grid[c.row][c.col+1].hasNumber) {
            c.xCoor += 50;
            if(c.xCoor%100 == 0) {
             c.changeCell(c.row,c.col+1);
            }
          }
          else if(grid[c.row][c.col+1].number == c.number && c.merge){
            c.xCoor += 100;
            c.number *= 2;
            grid[c.row][c.col+1].merge = false;
            c.changeCell(c.row,c.col+1);
          }
        }
        else if(keyCode == LEFT && c.xCoor > 100 && c.col !=0) {
           if(!grid[c.row][c.col-1].hasNumber) {
            c.xCoor -= 50;
            if(c.xCoor%100 == 0) {
             c.changeCell(c.row,c.col-1);
            }
          }
          else if(grid[c.row][c.col-1].number == c.number && c.merge){
            c.xCoor -= 100;
            c.number *= 2;
            grid[c.row][c.col-1].merge = false;
            c.changeCell(c.row,c.col-1);
          }
        }
        else if(keyCode == DOWN && c.yCoor < 400 && c.row != 3) {
          if(!grid[c.row+1][c.col].hasNumber) {
            c.yCoor += 50;
            if(c.yCoor%100 == 0) {
             c.changeCell(c.row+1,c.col);
            }
          }
          else if(grid[c.row+1][c.col].number == c.number && c.merge){
            c.yCoor += 100;
            c.number *= 2;
            grid[c.row+1][c.col].merge = false;
            c.changeCell(c.row+1,c.col);
          }
        }
      }
    }
    else {
      field.spawn();
      loop = -1;
      keyCode = 0;
      for(Cell c: getOccupiedCells()) {
        c.merge = true;
      }
    }
    loop++;
  }
   
}
 
public class Cell {
  boolean hasNumber = false;
  int number;
  int xCoor;
  int yCoor;
  int row;
  int col;
  boolean merge = true;
   
  public Cell(int x, int y, int r, int c) {
    number = 2;
    xCoor = x;
    yCoor = y;
    row = r;
    col = c;
  }
   
  public void changeCell(int r, int c) {
    this.hasNumber = false;
    if(this.row == r) {
      this.xCoor -= 100 * (c-this.col);
    }
    else if(this.col == c) {
      this.yCoor -= 100 * (r-this.row);
    }
    //this.xCoor = this.xCoor;
    //this.yCoor = this.yCoor;
    grid[r][c].number = this.number;
    this.number = 2;
    grid[r][c].hasNumber = true;
    //println("This: " + " X: " + this.xCoor + " Y: " + this.yCoor + " C: " + this.col + " R: " + this.row);
    //println("New: " + " X: " + grid[r][c].xCoor + " Y: " + grid[r][c].yCoor + " C: " + grid[r][c].col + " R: " + grid[r][c].row);
  }
   
  public void drawTile() {
    fill(255,140,0);
    rect(xCoor,yCoor,100,100);
    textSize(45);
    fill(0, 102, 153, 204);
    if(number < 9) {
      text("" + number,xCoor+35,yCoor+65);
    }
    else if(number < 128){
      text("" + number,xCoor+25,yCoor+65);
    }
    else if(number < 1024) {
      textSize(40);
      text("" + number,xCoor+15,yCoor+65);
    }
    else {
      textSize(35);
      text("" + number,xCoor+5,yCoor+65);
    }
  }
  
}

