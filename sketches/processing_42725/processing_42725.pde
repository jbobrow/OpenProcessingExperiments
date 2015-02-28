
PFont font;
Cell[][] grid; //holds the data cells in the graph
int[] oldGridCoord; //holds the original coordinates w/in the grid array of the cell being clicked on
int[] newGridCoord; //holds the new coordinates w/in the grid array of the cell being clicked on after transposition
Cell curCell;
SortButton[] sortUI;
int gridTop, gridBottom;
int cols, rows;

void setup() {
  size(870, 600);
  font = loadFont("Bodoni-14.vlw");
  textFont(font);
  gridTop = 170;
  gridBottom = 480;
  cols = 12;
  rows = 8;
  grid = new Cell[cols][rows];
  grid[0][0] = new Cell(56, gridBottom, 64, 40, "Pasta", "label", 0, 255, 255, 255, 17, 10);
  grid[1][0] = new Cell(120, gridBottom, 64, 40, "Bread", "label", 0, 255, 255, 255, 14, 10);
  grid[2][0] = new Cell(184, gridBottom, 64, 40, "Biscuit", "label", 0, 255, 255, 255, 12, 10);
  grid[3][0] = new Cell(248, gridBottom, 64, 40, "Pastry", "label", 0, 255, 255, 255, 12, 10);
  grid[4][0] = new Cell(312, gridBottom, 64, 40, "Cookie", "label", 0, 255, 255, 255, 13, 10);
  grid[5][0] = new Cell(376, gridBottom, 64, 40, "Pancake/ Waffle", "label", 0, 255, 255, 255, 8, 10);
  grid[6][0] = new Cell(440, gridBottom, 64, 40, "Sponge Cake", "label", 0, 255, 255, 255, 12, 10);
  grid[7][0] = new Cell(504, gridBottom, 64, 40, "Pound Cake", "label", 0, 255, 255, 255, 13, 10);
  grid[8][0] = new Cell(568, gridBottom, 64, 40, "Crepe/ Popover", "label", 0, 255, 255, 255, 13, 10);
  grid[9][0] = new Cell(632, gridBottom, 64, 40, "Layer Cake", "label", 0, 255, 255, 255, 14, 10);
  grid[10][0] = new Cell(696, gridBottom, 64, 40, "Chiffon Cake", "label", 0, 255, 255, 255, 10, 10);
  grid[11][0] = new Cell(760, gridBottom, 64, 40, "Angel Food Cake", "label", 0, 255, 255, 255, 2, 10);  
  grid[0][1] = new Cell(56, gridTop, 64, 2, "Pasta", "Salt", 0.7, 223, 0, 35, 30, 10);
  grid[1][1] = new Cell(120, gridTop, 64, 3, "Bread", "Salt", 1.1, 223, 0, 35, 30, 10);
  grid[2][1] = new Cell(184, gridTop, 64, 3, "Biscuit", "Salt", 1.0, 223, 0, 35, 30, 10);
  grid[3][1] = new Cell(248, gridTop, 64, 2, "Pastry", "Salt", 0.5, 223, 0, 35, 30, 10);
  grid[4][1] = new Cell(312, gridTop, 64, 2, "Cookie", "Salt", 0.5, 223, 0, 35, 30, 10);
  grid[5][1] = new Cell(376, gridTop, 64, 1, "Pancake/ Waffle", "Salt", 0.3, 223, 0, 35, 30, 10);
  grid[6][1] = new Cell(440, gridTop, 64, 2, "Sponge Cake", "Salt", 0.5, 223, 0, 35, 30, 10);
  grid[7][1] = new Cell(504, gridTop, 64, 2, "Pound Cake", "Salt", 0.5, 223, 0, 35, 30, 10);
  grid[8][1] = new Cell(568, gridTop, 64, 2, "Crepe/ Popover", "Salt", 0.5, 223, 0, 35, 30, 10);
  grid[9][1] = new Cell(632, gridTop, 64, 2, "Layer Cake", "Salt", 0.7, 223, 0, 35, 30, 10);
  grid[10][1] = new Cell(696, gridTop, 64, 2, "Chiffon Cake", "Salt", 0.4, 223, 0, 35, 30, 10);
  grid[11][1] = new Cell(760, gridTop, 64, 2, "Angel Food Cake", "Salt", 0.5, 223, 0, 35, 30, 10);
  grid[0][2] = new Cell(56, gridTop+2, 64, 0, "Pasta", "Milk Solids", 0, 38, 184, 73, 30, 10);
  grid[1][2] = new Cell(120, gridTop+3, 64, 6, "Bread", "Milk Solids", 2, 38, 184, 73, 30, 10);
  grid[2][2] = new Cell(184, gridTop+3, 64, 9, "Biscuit", "Milk Solids", 3, 38, 184, 73, 30, 10);
  grid[3][2] = new Cell(248, gridTop+2, 64, 0, "Pastry", "Milk Solids", 0, 38, 184, 73, 30, 10);
  grid[4][2] = new Cell(312, gridTop+2, 64, 3, "Cookie", "Milk Solids", 1, 38, 184, 73, 30, 10);
  grid[5][2] = new Cell(376, gridTop+1, 64, 9, "Pancake/ Waffle", "Milk Solids", 3, 38, 184, 73, 30, 10);
  grid[6][2] = new Cell(440, gridTop+2, 64, 0, "Sponge Cake", "Milk Solids", 0, 38, 184, 73, 30, 10);
  grid[7][2] = new Cell(504, gridTop+2, 64, 3, "Pound Cake", "Milk Solids", 1, 38, 184, 73, 30, 10);
  grid[8][2] = new Cell(568, gridTop+2, 64, 11, "Crepe/ Popover", "Milk Solids", 4, 38, 184, 73, 30, 10);
  grid[9][2] = new Cell(632, gridTop+2, 64, 6, "Layer Cake", "Milk Solids", 2, 38, 184, 73, 30, 10);
  grid[10][2] = new Cell(696, gridTop+2, 64, 0, "Chiffon Cake", "Milk Solids", 0, 38, 184, 73, 30, 10);
  grid[11][2] = new Cell(760, gridTop+2, 64, 0, "Angel Food Cake", "Milk Solids", 0, 38, 184, 73, 30, 10);
  grid[0][3] = new Cell(56, gridTop+2, 64, 12, "Pasta", "Eggs", 4, 158, 148, 129, 30, 10);
  grid[1][3] = new Cell(120, gridTop+3+6, 64, 0, "Bread", "Eggs", 0, 158, 148, 129, 30, 10);
  grid[2][3] = new Cell(184, gridTop+3+9, 64, 0, "Biscuit", "Eggs", 0, 158, 148, 129, 30, 10);
  grid[3][3] = new Cell(248, gridTop+2, 64, 0, "Pastry", "Eggs", 0, 158, 148, 129, 30, 10);
  grid[4][3] = new Cell(312, gridTop+2+3, 64, 7, "Cookie", "Eggs", 3, 158, 148, 129, 30, 10);
  grid[5][3] = new Cell(376, gridTop+1+9, 64, 53, "Pancake/ Waffle", "Eggs", 17, 158, 148, 129, 30, 10);
  grid[6][3] = new Cell(440, gridTop+2, 64, 83, "Sponge Cake", "Eggs", 27, 158, 148, 129, 30, 10);
  grid[7][3] = new Cell(504, gridTop+2+3, 64, 40, "Pound Cake", "Eggs", 13, 158, 148, 129, 30, 10);
  grid[8][3] = new Cell(568, gridTop+2+11, 64, 46, "Crepe/ Popover", "Eggs", 15, 158, 148, 129, 30, 10);
  grid[9][3] = new Cell(632, gridTop+2+6, 64, 33, "Layer Cake", "Eggs", 11, 158, 148, 129, 30, 10);
  grid[10][3] = new Cell(696, gridTop+2, 64, 77, "Chiffon Cake", "Eggs", 25, 158, 148, 129, 30, 10);
  grid[11][3] = new Cell(760, gridTop+2, 64, 124, "Angel Food Cake", "Eggs", 40, 158, 148, 129, 30, 10);  
  grid[0][4] = new Cell(56, gridTop+2+12, 64, 0, "Pasta", "Sugar", 0, 181, 231, 241, 30, 10);
  grid[1][4] = new Cell(120, gridTop+3+6, 64, 9, "Bread", "Sugar", 3, 181, 231, 241, 30, 10);
  grid[2][4] = new Cell(184, gridTop+3+9, 64, 3, "Biscuit", "Sugar", 2, 181, 231, 241, 30, 10);
  grid[3][4] = new Cell(248, gridTop+2, 64, 2, "Pastry", "Sugar", 1, 181, 231, 241, 30, 10);
  grid[4][4] = new Cell(312, gridTop+2+3+7, 64, 67, "Cookie", "Sugar", 21, 181, 231, 241, 30, 10);
  grid[5][4] = new Cell(376, gridTop+1+9+53, 64, 9, "Pancake/ Waffle", "Sugar", 3, 181, 231, 241, 30, 10);
  grid[6][4] = new Cell(440, gridTop+2+83, 64, 82, "Sponge Cake", "Sugar", 27, 181, 231, 241, 30, 10);
  grid[7][4] = new Cell(504, gridTop+2+3+40, 64, 81, "Pound Cake", "Sugar", 26, 181, 231, 241, 30, 10);
  grid[8][4] = new Cell(568, gridTop+2+11+46, 64, 0, "Crepe/ Popover", "Sugar", 0, 181, 231, 241, 30, 10);
  grid[9][4] = new Cell(632, gridTop+2+6+33, 64, 87, "Layer Cake", "Sugar", 28, 181, 231, 241, 30, 10);
  grid[10][4] = new Cell(696, gridTop+2+77, 64, 71, "Chiffon Cake", "Sugar", 23, 181, 231, 241, 30, 10);
  grid[11][4] = new Cell(760, gridTop+2+124, 64, 24, "Angel Food Cake", "Sugar", 7, 181, 231, 241, 30, 10);  
  grid[0][5] = new Cell(56, gridTop+2+12, 64, 0, "Pasta", "Shortening", 0, 50, 112, 208, 30, 10);
  grid[1][5] = new Cell(120, gridTop+3+6+9, 64, 7, "Bread", "Shortening", 2, 50, 112, 208, 30, 10);
  grid[2][5] = new Cell(184, gridTop+3+9+3, 64, 25, "Biscuit", "Shortening", 8, 50, 112, 208, 30, 10);
  grid[3][5] = new Cell(248, gridTop+2+2, 64, 102, "Pastry", "Shortening", 33, 50, 112, 208, 30, 10);
  grid[4][5] = new Cell(312, gridTop+2+3+7+67, 64, 58, "Cookie", "Shortening", 19, 50, 112, 208, 30, 10);
  grid[5][5] = new Cell(376, gridTop+1+9+53+9, 64, 19, "Pancake/ Waffle", "Shortening", 6, 50, 112, 208, 30, 10);
  grid[6][5] = new Cell(440, gridTop+2+83+82, 64, 0, "Sponge Cake", "Shortening", 0, 50, 112, 208, 30, 10);
  grid[7][5] = new Cell(504, gridTop+2+3+40+81, 64, 40, "Pound Cake", "Shortening", 13, 50, 112, 208, 30, 10);
  grid[8][5] = new Cell(568, gridTop+2+11+46, 64, 0, "Crepe/ Popover", "Shortening", 0, 50, 112, 208, 30, 10);
  grid[9][5] = new Cell(632, gridTop+2+6+33+87, 64, 27, "Layer Cake", "Shortening", 9, 50, 112, 208, 30, 10);
  grid[10][5] = new Cell(696, gridTop+2+77+71, 64, 22, "Chiffon Cake", "Shortening", 7, 50, 112, 208, 30, 10);
  grid[11][5] = new Cell(760, gridTop+2+124+24, 64, 0, "Angel Food Cake", "Shortening", 0, 50, 112, 208, 30, 10);  
  grid[0][6] = new Cell(56, gridTop+2+12, 64, 60, "Pasta", "Total Water", 19, 101, 27, 121, 30, 10);
  grid[1][6] = new Cell(120, gridTop+3+6+9+7, 64, 112, "Bread", "Total Water", 37, 101, 27, 121, 30, 10);
  grid[2][6] = new Cell(184, gridTop+3+9+3+25, 64, 110, "Biscuit", "Total Water", 36, 101, 27, 121, 30, 10);
  grid[3][6] = new Cell(248, gridTop+2+2+102, 64, 47, "Pastry", "Total Water", 15, 101, 27, 121, 30, 10);
  grid[4][6] = new Cell(312, gridTop+2+3+7+67+58, 64, 29, "Cookie", "Total Water", 9, 101, 27, 121, 30, 10);
  grid[5][6] = new Cell(376, gridTop+1+9+53+9+19, 64, 132, "Pancake/ Waffle", "Total Water", 43, 101, 27, 121, 30, 10);
  grid[6][6] = new Cell(440, gridTop+2+83+82, 64, 61, "Sponge Cake", "Total Water", 20, 101, 27, 121, 30, 10);
  grid[7][6] = new Cell(504, gridTop+2+3+40+81+40, 64, 63, "Pound Cake", "Total Water", 21, 101, 27, 121, 30, 10);
  grid[8][6] = new Cell(568, gridTop+2+11+46, 64, 175, "Crepe/ Popover", "Total Water", 57, 101, 27, 121, 30, 10);
  grid[9][6] = new Cell(632, gridTop+2+6+33+87+27, 64, 88, "Layer Cake", "Total Water", 28, 101, 27, 121, 30, 10);
  grid[10][6] = new Cell(696, gridTop+2+77+71+22, 64, 82, "Chiffon Cake", "Total Water", 27, 101, 27, 121, 30, 10);
  grid[11][6] = new Cell(760, gridTop+2+124+24, 64, 110, "Angel Food Cake", "Total Water", 36, 101, 27, 121, 30, 10);  
  grid[0][7] = new Cell(56, gridTop+2+12+60, 64, 237, "Pasta", "Flour", 76, 240, 170, 35, 30, 10);
  grid[1][7] = new Cell(120, gridTop+3+6+9+7+112, 64, 174, "Bread", "Flour", 56, 240, 170, 35, 30, 10);
  grid[2][7] = new Cell(184, gridTop+3+9+3+25+110, 64, 161, "Biscuit", "Flour", 51, 240, 170, 35, 30, 10);
  grid[3][7] = new Cell(248, gridTop+2+2+102+47, 64, 158, "Pastry", "Flour", 50, 240, 170, 35, 30, 10);
  grid[4][7] = new Cell(312, gridTop+2+3+7+67+58+29, 64, 145, "Cookie", "Flour", 47, 240, 170, 35, 30, 10);
  grid[5][7] = new Cell(376, gridTop+1+9+53+9+19+132, 64, 88, "Pancake/ Waffle", "Flour", 28, 240, 170, 35, 30, 10);
  grid[6][7] = new Cell(440, gridTop+2+83+82+61, 64, 83, "Sponge Cake", "Flour", 27, 240, 170, 35, 30, 10);
  grid[7][7] = new Cell(504, gridTop+2+3+40+81+40+63, 64, 82, "Pound Cake", "Flour", 26, 240, 170, 35, 30, 10);
  grid[8][7] = new Cell(568, gridTop+2+11+46+175, 64, 77, "Crepe/ Popover", "Flour", 25, 240, 170, 35, 30, 10);
  grid[9][7] = new Cell(632, gridTop+2+6+33+87+27+88, 64, 68, "Layer Cake", "Flour", 22, 240, 170, 35, 30, 10);
  grid[10][7] = new Cell(696, gridTop+2+77+71+22+82, 64, 57, "Chiffon Cake", "Flour", 18, 240, 170, 35, 30, 10);
  grid[11][7] = new Cell(760, gridTop+2+124+24+110, 64, 51, "Angel Food Cake", "Flour", 16, 240, 170, 35, 30, 10);
  curCell = new Cell(0, 0, 100, 100, "no recipe", "no category", 0, 0, 0, 0, 10, 30);
  sortUI = new SortButton[rows];
  sortUI[7] = new SortButton(90, 65, 100, 90, "Flour", 240, 170, 35, 35, 4);
  sortUI[6] = new SortButton(190, 65, 100, 90, "Total Water", 101, 27, 121, 20, 4);
  sortUI[5] = new SortButton(290, 65, 100, 90, "Shortening", 50, 112, 208, 22, 4);
  sortUI[4] = new SortButton(390, 65, 100, 90, "Sugar", 181, 231, 241, 35, 4);
  sortUI[3] = new SortButton(490, 65, 100, 90, "Eggs", 158, 148, 129, 38, 4);
  sortUI[2] = new SortButton(590, 65, 100, 90, "Milk Solids", 38, 184, 73, 20, 4);
  sortUI[1] = new SortButton(690, 65, 100, 90, "Salt", 223, 0, 35, 38, 4);
  oldGridCoord = new int[2];
  oldGridCoord[0] = 9999;
  oldGridCoord[1] = 9999;
  newGridCoord = new int[2];
  newGridCoord[0] = 9999;
  newGridCoord[1] = 9999;
}

void draw() {
  background(255);
  drawOtherText();
  if((oldGridCoord[0] != 9999) && (oldGridCoord[1] != 9999)) {
    if(oldGridCoord[1] != 0) {
      drawGridMinusCell(oldGridCoord[0], oldGridCoord[1]);
      drawGridLines();
      for(int z = 1; z < rows; z++) {
        sortUI[z].drawButton();
      }
      curCell.drawCellDrag(mouseX, mouseY);
      for(int p = 0; p < cols; p++) {
        for(int q = 1; q < rows; q++) {
          if(grid[p][q].mouseIsOverMe(mouseX, mouseY)) {
            if(((p != oldGridCoord[0]) || (q != oldGridCoord[1])) && ((p != newGridCoord[0]) || (q != newGridCoord[1]))) {
              transpose(oldGridCoord[0], p, oldGridCoord[1], q);
              newGridCoord[0] = oldGridCoord[0];
              newGridCoord[1] = oldGridCoord[1];
              oldGridCoord[0] = p;
              oldGridCoord[1] = q;
              drawGridMinusCell(oldGridCoord[0], oldGridCoord[1]);
              drawGridLines();
              for(int z = 1; z < rows; z++) {
                sortUI[z].drawButton();
              }
              curCell.drawCellDrag(mouseX, mouseY);
            } else if(((p == oldGridCoord[0]) && (q == oldGridCoord[1])) && ((p != newGridCoord[0]) || (q != newGridCoord[1]))) {
              newGridCoord[0] = 9999; 
              newGridCoord[1] = 9999;
            }
          }
        }
      }
    } else {
      drawGridMinusCol(oldGridCoord[0]);
      drawGridLines();
      for(int z = 1; z < rows; z++) {
        sortUI[z].drawButton();
      }
      drawCol(mouseX, mouseY);
      for(int p = 0; p < cols; p++) {
        for(int q = 0; q < rows; q++) {
          if(grid[p][q].mouseIsOverMe(mouseX, mouseY)) {
            if(((p != oldGridCoord[0]) || (q != oldGridCoord[1])) && ((p != newGridCoord[0]) || (q != newGridCoord[1]))) {
              transpose(oldGridCoord[0], p, 0, 0);
              newGridCoord[0] = oldGridCoord[0];
              oldGridCoord[0] = p;
              drawGridMinusCol(oldGridCoord[0]);
              drawGridLines();
              drawCol(mouseX, mouseY);
            } else if(((p == oldGridCoord[0]) && (q == oldGridCoord[1])) && ((p != newGridCoord[0]) || (q != newGridCoord[1]))) {
              newGridCoord[0] = 9999; 
              newGridCoord[1] = 9999;
            }
          }
        }
      }
    }
  } else {
    drawGrid();
    drawGridLines();
    for(int j = 0; j < cols; j++) {
      for(int k = 1; k < rows; k++) {
        if(grid[j][k].mouseIsOverMe(mouseX, mouseY)) {
          drawGrid();
          drawGridLines();
          grid[j][k].drawInfoCell(mouseX, mouseY);
        }
      }
    }
    for(int z = 1; z < rows; z++) {
      if(sortUI[z].mouseIsOverMe(mouseX, mouseY) > 0) {
        sortUI[z].drawButtonMouseOver(mouseX, mouseY);
        fill(0);
        textSize(14);
        text("Sort:", 55, 115);
      } else {
        sortUI[z].drawButton();
      }
    }
  }
}

void mousePressed() {
  for(int m = 0; m < cols; m++) {
    for(int n = 0; n < rows; n++) {
      if(grid[m][n].mouseIsOverMe(mouseX, mouseY)) {
        oldGridCoord[0] = m;
        oldGridCoord[1] = n;
        copyCell(grid[m][n], curCell);
        curCell.setMouseOffset(mouseX, mouseY);
      }
    }
  }
  for(int w = 1; w < rows; w++) {
    if(sortUI[w].mouseIsOverMe(mouseX, mouseY) > 1) {
      if(sortUI[w].mouseIsOverMe(mouseX, mouseY) == 2) {
        for(int a = 1; a < cols; a++) {
          if(grid[a][w].getData() < grid[a - 1][w].getData()) {
            int i = a - 1;
            while((i >= 0) && (grid[a][w].getData() < grid[i][w].getData())) {
              i--;
            }
            transpose(a, i + 1, w, w);
          }
        }          
      } else if(sortUI[w].mouseIsOverMe(mouseX, mouseY) == 3) {
        for(int a = 1; a < cols; a++) {
          if(grid[a][w].getData() > grid[a - 1][w].getData()) {
            int i = a - 1;
            while((i >= 0) && (grid[a][w].getData() > grid[i][w].getData())) {
              i--;
            }
            transpose(a, i + 1, w, w);
          }
        }
      }
    }
  }
}

void mouseReleased() {
  oldGridCoord[0] = 9999;
  oldGridCoord[1] = 9999;
}

void copyCell(Cell source, Cell target) {
  target.setX(source.getX());
  target.setY(source.getY());
  target.setW(source.getW());
  target.setH(source.getH());
  target.setStrings(source.getRecipe(), source.getCategory());
  target.setColor(source.getColorR(), source.getColorG(), source.getColorB());
  target.setData(source.getData());
  target.setTextCoords(source.getTextX(), source.getTextY());
}
  
  
void transpose(int curCol, int targCol, int curRow, int targRow) {
  if(curCol != targCol) {
    if(curCol < targCol) {
      for(int a = 0; a < rows; a++) {
        int tempX = grid[targCol][a].getX();
        for(int c = targCol; c > curCol; c--) {
          grid[c][a].setX(grid[c - 1][a].getX());
        }  
        grid[curCol][a].setX(tempX);
        Cell tempCell = grid[curCol][a];
        for(int b = curCol; b < targCol; b++) {
          grid[b][a] = grid[b + 1][a];
        }
        grid[targCol][a] = tempCell;        
      }
    } else {
      for(int a = 0; a < rows; a++) {
        int tempX = grid[targCol][a].getX();
        for(int c = targCol; c < curCol; c++) {
          grid[c][a].setX(grid[c + 1][a].getX());
        }  
        grid[curCol][a].setX(tempX);
        Cell tempCell = grid[curCol][a];
        for(int b = curCol; b > targCol; b--) {
          grid[b][a] = grid[b - 1][a];
        }
        grid[targCol][a] = tempCell;
      }
    }
  }
  if(curRow != targRow) {
    if(curRow < targRow) {
      for(int a = 0; a < cols; a++) {
        int tempY = grid[a][targRow].getY();
        for(int c = targRow; c > curRow; c--) {
          grid[a][c].setY(grid[a][c - 1].getY());
        }  
        grid[a][curRow].setY(tempY);
        Cell tempCell = grid[a][curRow];
        for(int b = curRow; b < targRow; b++) {
          grid[a][b] = grid[a][b + 1];
        }
        grid[a][targRow] = tempCell;
        for(int d = 2; d < rows; d++) {
          grid[a][d].setY(grid[a][d - 1].getY() + grid[a][d - 1].getH());
        }
      }
      SortButton tempButton = sortUI[curRow];
      for(int e = curRow; e < targRow; e++) {
        sortUI[e] = sortUI[e + 1];
      }
      sortUI[targRow] = tempButton;
    } else {
      for(int a = 0; a < cols; a++) {
        int tempY = grid[a][targRow].getY();
        for(int c = targRow; c < curRow; c++) {
          grid[a][c].setY(grid[a][c + 1].getY());
        }  
        grid[a][curRow].setY(tempY);
        Cell tempCell = grid[a][curRow];
        for(int b = curRow; b > targRow; b--) {
          grid[a][b] = grid[a][b - 1];
        }
        grid[a][targRow] = tempCell;
        for(int d = 2; d < rows; d++) {
          grid[a][d].setY(grid[a][d - 1].getY() + grid[a][d - 1].getH());
        }
      }
      SortButton tempButton = sortUI[curRow];
      for(int e = curRow; e > targRow; e--) {
        sortUI[e] = sortUI[e - 1];
      }
      sortUI[targRow] = tempButton;
    }
  }
}

void drawGrid() {
  for(int j = 0; j < cols; j++) {
    for(int k = 0; k < rows; k++) {
      if(k == 0) {
        grid[j][k].drawTextCell();
      } else {
        grid[j][k].drawCell();
      }
    }
  }
}

void drawGridMinusCell(int s, int t) {
  for(int j = 0; j < cols; j++) {
    for(int k = 0; k < rows; k++) {
      if((s != j) || (t != k)) {
        if(k == 0) {
          grid[j][k].drawTextCell();
        } else {
          grid[j][k].drawCell();
        }
      }
    }
  }
}

void drawGridMinusCol(int c) {
  for(int j = 0; j < cols; j++) {
    for(int k = 0; k < rows; k++) {
      if(c != j) {
        if(k == 0) {
          grid[j][k].drawTextCell();
        } else {
          grid[j][k].drawCell();
        }
      }
    }
  }
}

void drawCol(int inX, int inY) {
  Cell[] tempCol = new Cell[rows];
  for(int s = 1; s < rows; s++) {
    tempCol[s - 1] = new Cell(grid[oldGridCoord[0]][s].getX(), grid[oldGridCoord[0]][s].getY(), grid[oldGridCoord[0]][s].getW(), grid[oldGridCoord[0]][s].getH(), grid[oldGridCoord[0]][s].getColorR(), grid[oldGridCoord[0]][s].getColorG(), grid[oldGridCoord[0]][s].getColorB());
  }
  curCell.drawTextCellDrag(inX, inY); 
  int curCellX = curCell.getX();
  int curCellY = curCell.getY();
  for(int t = rows - 2; t >= 0; t--) {
    curCellY = curCellY - tempCol[t].getH();
    tempCol[t].drawCellDrag(curCellX, curCellY);
  }
}

void drawGridLines() {
  stroke(30);
  line(56, 201, 824, 201);
  line(56, 232, 824, 232);
  line(56, 263, 824, 263);
  line(56, 294, 824, 294);
  line(53, 326, 824, 326);
  line(56, 356, 824, 356);
  line(56, 387, 824, 387);
  line(56, 418, 824, 418);
  line(56, 449, 824, 449);
}

void drawOtherText() {
  fill(0);
  stroke(0);
  textSize(12);
  text("100%", 24, 175);
  text("50%", 28, 329);
  text("0%", 35, 484);
  textSize(10);
  text("Based on standardized recipes; individual recipes vary substantially. Source: Harold McGee, On Food and Cooking, New York: Charles Scribner's Sons, 1984. Page 301.", 75, 580);
  textSize(24);
  text("RELATIVE COMPOSITION OF COMMON DOUGHS AND BATTERS", 80, 62);
}

class Cell {
  int x, y;
  int w, h;
  String recipe, category;
  float data;
  int colorR, colorG, colorB;
  int textX, textY;
  int mouseDX, mouseDY;
  
  Cell(int tempx, int tempy, int tempw, int temph, String temprecipe, String tempcategory, float tempdata, int tempcolorR, int tempcolorG, int tempcolorB, int temptextX, int temptextY) {
    x = tempx;
    y = tempy;
    w = tempw;
    h = temph;
    recipe = temprecipe;
    category = tempcategory;
    data = tempdata;
    colorR = tempcolorR;
    colorG = tempcolorG;
    colorB = tempcolorB;
    textX = temptextX;
    textY = temptextY;
    mouseDX = w/2;
    mouseDY = h/2;
  }
  
  Cell(int tempx, int tempy, int tempw, int temph, int tempcolorR, int tempcolorG, int tempcolorB) {
    x = tempx;
    y = tempy;
    w = tempw;
    h = temph;
    colorR = tempcolorR;
    colorG = tempcolorG;
    colorB = tempcolorB;
  }
  
  boolean mouseIsOverMe(int a, int b) {
    if(((a >= x) && (a <= (x + w))) && ((b >= y) && (b <= (y + h)))) {
      return true;
    } else {
      return false;
    }
  }
  
  void drawCell() {
    stroke(colorR, colorG, colorB);
    fill(colorR, colorG, colorB);
    rect(x, y, w, h);
  }
  
  void drawCellDrag(int c, int d) {
    x = c - mouseDX;
    y = d - mouseDY;
    stroke(colorR, colorG, colorB, 191);
    fill(colorR, colorG, colorB, 191);
    rect(x, y, w, h);
  }
  
  void drawTextCell() {
    stroke(colorR, colorG, colorB);
    fill(colorR, colorG, colorB);
    rect(x, y, w, h);
    stroke(0);
    fill(0);
    textSize(12);
    text(recipe, x + textX, y + textY, w - textX, h - textY);
  }
  
  void drawTextCellDrag(int e, int f) {
    x = e - mouseDX;
    y = f - mouseDY;
    stroke(colorR, colorG, colorB, 191);
    fill(colorR, colorG, colorB, 191);
    rect(x, y, w, h);
    stroke(0);
    fill(0);
    textSize(12);
    text(recipe, x + textX, y + textY, w - textX, h - textY);
  }  
  
  void drawInfoCell(int i, int j) {
    stroke(0, 0, 0, 150);
    fill(255, 255, 255, 150);
    rect(i, j, 100, 75);
    fill(0);
    textSize(12);
    text(recipe, i + 10, j + 20);
    text(category, i + 10, j + 40);
    String dataString = data+"%";
    text(dataString, i + 10, j + 60);
  }
  
  void setMouseOffset(int newMouseX, int newMouseY) {
    mouseDX = newMouseX - x;
    mouseDY = newMouseY - y;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  int getW() {
    return w;
  }
  
  int getH() {
    return h;
  }
  
  int getTextX() {
    return textX;
  }
  
  int getTextY() {
    return textY;
  }
  
  String getRecipe() {
    return recipe;
  }
  
  String getCategory() {
    return category;
  }
  
  float getData() {
    return data;
  }
  
  int getColorR() {
    return colorR;
  }
  
  int getColorG() {
    return colorG;
  }
  
  int getColorB() {
    return colorB;
  }
  
  void setX(int newX) {
    x = newX;
  }
  
  void setY(int newY) {
    y = newY;
  }
  
  void setW(int newW) {
    w = newW;
  }
  
  void setH(int newH) {
    h = newH;
  }
  
  void setStrings(String newRecipe, String newCategory) {
    recipe = newRecipe;
    category = newCategory;
  }
  
  void setTextCoords(int newTextX, int newTextY) {
    textX = newTextX;
    textY = newTextY;
  }
  
  void setData(float newData) {
    data = newData;
  }
  
  void setColor(int newColorR, int newColorG, int newColorB) {
    colorR = newColorR;
    colorG = newColorG;
    colorB = newColorB;
  }
  
}

class SortButton {
  int x, y, w, h;
  int colorR, colorG, colorB;
  int textX, textY;
  String category;
  
  SortButton(int tempX, int tempY, int tempW, int tempH, String tempCategory, int tempColorR, int tempColorG, int tempColorB, int tempTextX, int tempTextY) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    category = tempCategory;
    colorR = tempColorR;
    colorG = tempColorG;
    colorB = tempColorB;
    textX = tempTextX;
    textY = tempTextY;
  }
  
  void drawButtonMouseOver(int c, int d) {
    stroke(255);
    fill(255);
    rect(x, y, w, h);
    stroke(colorR, colorG, colorB);
    fill(colorR, colorG, colorB);
    rect(x, y + h/2 - 10, w, 20);
    fill(0);
    textSize(12);
    text(category, x + textX, y + h/2 + textY);
    if(((c > x) && (c < x+w)) && ((d > y) && (d < y+h/2-10))) {
      stroke(colorR, colorG, colorB, 150);
      fill(colorR, colorG, colorB, 150);
      triangle(x + w/2, y + 10, x + 25, y + h/2 - 15, x + w - 25, y + h/2 - 15);
      stroke(colorR, colorG, colorB);
      fill(colorR, colorG, colorB);
      triangle(x + w/2, y + h - 10, x + 25, y + h/2 + 15, x + w - 25, y + h/2 + 15);
    } else if(((c > x) && (c < x+w)) && ((d > y+h/2+10) && (d < y+h))) {
      stroke(colorR, colorG, colorB, 150);
      fill(colorR, colorG, colorB, 150);
      triangle(x + w/2, y + h - 10, x + 25, y + h/2 + 15, x + w - 25, y + h/2 + 15);
      stroke(colorR, colorG, colorB);
      fill(colorR, colorG, colorB);
      triangle(x + w/2, y + 10, x + 25, y + h/2 - 15, x + w - 25, y + h/2 - 15);
    } else {
      stroke(colorR, colorG, colorB);
      fill(colorR, colorG, colorB);
      triangle(x + w/2, y + h - 10, x + 25, y + h/2 + 15, x + w - 25, y + h/2 + 15);
      triangle(x + w/2, y + 10, x + 25, y + h/2 - 15, x + w - 25, y + h/2 - 15);
    }
  }
  
  void drawButton() {
    stroke(colorR, colorG, colorB);
    fill(colorR, colorG, colorB);
    rect(x, y + h/2 - 10, w, 20);
    fill(0);
    textSize(12);
    text(category, x + textX, y + h/2 + textY);
  }
  
  int mouseIsOverMe(int a, int b) {
    if(((a >= x+2) && (a <= x+w-2)) && ((b >= y+2) && (b <= y+h/2-6))) {
      return 2;
    } else if(((a >= x+2) && (a <= x+w-2)) && ((b >= y+h/2+6) && (b <= y+h-2))) {
      return 3;
    } else if(((a > x) && (a < x+w)) && ((b > y) && (b < y+h))){
      return 1;
    } else {
      return 0;
    }
  }
  
}

