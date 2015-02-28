
class Cell { //Class for the cells
  PVector location; //Location of the cell

  boolean mineCell = false; //If the cell is a mine cell or not
  boolean openCell = false; //If the cell is open or not
  boolean flagCell = false; //If the cell is flagged or not
  boolean perimeterCleared = false; //If the cell has cleared around it yet (only applies to those with no adjacent mines)
  int adjacentMines = 0; //The number of adjacent mines to the cell
  int adjacentFlags = 0; //The number of adjacent flags to the cell

  Cell(int locationInputX, int locationInputY) { //Creates a new cell
    this.location = new PVector(locationInputX, locationInputY); //Sets location to inputed co-ordinates
  }

  void updateCell() { //Renders the cell
    strokeWeight(SCREEN_SIZE/400); //Sets the stroke weight
    if (!this.openCell) fill(#5C62F0); //If the cell isn't open, fills light
    else fill(230); //If it is open, fills darker
    rect(this.location.x, this.location.y, CELL_SIZE, CELL_SIZE); //Draws the cell

    if (this.openCell) {
      if (this.mineCell) {
        fill(0); //Fills black
        ellipse(this.location.x + CELL_SIZE/2, this.location.y + CELL_SIZE/2, CELL_SIZE/2, CELL_SIZE/2); //Draws the mine
      } 
      else if (this.adjacentMines > 0) { //Else if there is at least one adjacent mine block
        textSize(CELL_SIZE*5/7); //Sets the font size of the cells
        switch(this.adjacentMines) { //Checks the number of adjacent mines, and colors accordingly
          case 1: fill(#0000FF); break;
          case 2: fill(#009500); break;
          case 3: fill(#FF0000); break;
          case 4: fill(#000090); break;
          case 5: fill(#550000); break;
          case 6: fill(#0089AA); break;
          case 7: fill(#AD00A2); break;
          case 8: fill(#000000); break;
        }
        text(this.adjacentMines, this.location.x + SCREEN_SIZE*3/200, this.location.y + SCREEN_SIZE*11/500); //Writes the number of adjacent blocks
      }
    } else if(this.flagCell) { //If it is a flag cell
        fill(#FF0000); //Fills black
        ellipse(this.location.x + CELL_SIZE/2, this.location.y + CELL_SIZE/2, CELL_SIZE/2, CELL_SIZE/2); //Draws the flag
    }
  }
}

