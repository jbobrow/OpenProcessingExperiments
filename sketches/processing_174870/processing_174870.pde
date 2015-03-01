
public class Maze {
  public final int SQUARE_WIDTH = 25;
  int topSquareX;
  int topSquareY;
  int[][] gameBoard;
  int[][] stoppers;
  Puck[] pucks;
  boolean playerMove;
  boolean gameWon;
  boolean seeStrategy;
  boolean moving;

  public Maze () {
    pucks = new Puck[1];
    gameBoard = new int[10][10];
    stoppers = new int[10][10];
    moving= false;
    seeStrategy = false;
    topSquareX = gameBoard.length*SQUARE_WIDTH;
    topSquareY = SQUARE_WIDTH;
    playerMove = true;
    gameWon = false;
    for (int t = 0; t < gameBoard.length; t++) {
      for (int i = 0; i < gameBoard[t].length; i++) {
        gameBoard[t][i] = -1;
      }
    }
    makeStoppers();
    initializeValues();
    makePucks();
    removeFinishedPucks();
  }

  public void makePucks () {
    Random rand = new Random();
    for (int i = 0; i < pucks.length; i++) {
      int rowNum = rand.nextInt(gameBoard.length);
      int colNum = rand.nextInt(gameBoard[rowNum].length);
      pucks[i] = new Puck(rowNum, colNum, gameBoard[rowNum][colNum]);
    }
    if (getGraphNimber() == 0)
      makePucks();
  }

  public ArrayList<Integer> getGoodMoves() {
    ArrayList<Integer> goodMoves = new ArrayList<Integer>();
    if (getGraphNimber() == 0)
      return null;
    int currentPosition = getGraphNimber();
    for (int i = 0; i < pucks.length; i++) {
      int numLookingFor = pucks[i].curValue ^ currentPosition;
      ArrayList<Integer> possibles  = getPossibles(pucks[i].rowPos, pucks[i].colPos);
      for (int t = 0; t < possibles.size()-1; t+=2) {
        if (gameBoard[possibles.get(t)][possibles.get(t+1)] == numLookingFor) {
          goodMoves.add(i);
          goodMoves.add(possibles.get(t));
          goodMoves.add(possibles.get(t+1));
        }
      }
    }
    return goodMoves;
  }

  public void drawGoodMove() {
    ArrayList<Integer> possibles = getGoodMoves();
    if (possibles == null)
      return;
    fill(0, 0, 200, 100);
    for (int t = 0; t < possibles.size()-2; t += 3)
      drawDiamond(topSquareX-(possibles.get(t+1)*SQUARE_WIDTH)+possibles.get(t+2)*SQUARE_WIDTH, topSquareY+(possibles.get(t+1)*SQUARE_WIDTH)+possibles.get(t+2)*SQUARE_WIDTH);
  }

  public int getCol () {
    int lineStartX = topSquareX;
    int lineStartY = topSquareY-SQUARE_WIDTH;

    int nextPointX = lineStartX - SQUARE_WIDTH;
    int nextPointY = lineStartY + SQUARE_WIDTH;

    if ((nextPointX - lineStartX)*(mouseY-lineStartY) - (nextPointY-lineStartY)*(mouseX-lineStartX) > 0) {
      return -1;
    }
    for (int i = 0; i < gameBoard[0].length; i++) {
      lineStartX = lineStartX+SQUARE_WIDTH;
      lineStartY = lineStartY + SQUARE_WIDTH;
      nextPointX = nextPointX + SQUARE_WIDTH;
      nextPointY = nextPointY + SQUARE_WIDTH;
      if ((nextPointX - lineStartX)*(mouseY-lineStartY) - (nextPointY-lineStartY)*(mouseX-lineStartX) > 0)
        return i;
    }
    return -1;
  }

  public void drawGameAnalysis() {
    int startPointX = width/2;
    fill(255, 255, 255);
    noStroke();
    rect(startPointX, 0, width/2, height);
    textSize(20);
    fill(0, 0, 0);
    text("Maze", 23 * width/32, 50);
    writeInstructions();
    stroke(0, 0, 0);
  }

  public void writeInstructions() {
    textSize(12);
    String line1 = "The rules of the game are simple. You and the computer will take turns moving";
    String line2 = "pucks (the red circles) in two directions. Each puck can only move diagonally, ";
    String line3 = "down to the right or down to the left. Each puck can move until they hit a \"wall\",";
    String line4 = "in this case the bolded lines.  Pucks cannot move past the walls, but can still ";
    String line5= "change directions The player who moves last wins.";
    String instructTitle = "Instructions";
    String instruct = "Click on a puck to select it, and every move it can take will be highlighted";
    String instruct2 = "Then, click on one of the highlighted squares to move the puck.";
    text(line1, width/2 + 10, 75);
    text(line2, width/2 + 10, 87); 
    text(line3, width/2 + 10, 99);
    text(line4, width/2 + 10, 111);
    text(line5, width/2 + 10, 123);
    textSize(20);
    text(instructTitle, 22*width/32, 145);
    textSize(12);
    text(instruct, width/2 + 10, 160);
    text(instruct2, width/2 + 10, 172);
    String line6 = "There is an optimum strategy to this game, that if a player uses the strategy";
    String line7 = "then the opposing player will not be able to win. For this exercise, the human";
    String line8 = "player can mathmatically win each and every time the game is played.";
    String line9 = "Play through the game a couple times and see if you can figure out a strategy";
    String line10 = "where you will win every time. If you get stumpped, click the buttons below";
    String line11 = "for hints. I recomend clicking the \"See Values \" button first, then the See";
    String line12 = "Strategy button. Good luck!";
    text(line6, width/2 + 10, 214);
    text(line7, width/2 + 10, 226); 
    text(line8, width/2 + 10, 238);
    text(line9, width/2 + 10, 250);
    text(line10, width/2 + 10, 262);
    text(line11, width/2 + 10, 274);
    text(line12, width/2 + 10, 286);

    if (!drawNumbers) {
      fill(200, 200, 200);
    }
    else {
      fill(100, 100, 100);
    }
    rect(width/2+10, 320+(pucks.length+2)*12, width/4-10, 30);
    fill(0, 0, 0);
    textSize(20);
    text("See Values", width/2+(width/4)/3, 342+(pucks.length+2)*12);
    fill(200, 200, 200);
    rect(width/2+width/4+10, 320+(pucks.length+2)*12, width/4-20, 30);
    fill(0, 0, 0);
    text("See Strategy", width/2+(4*width/13)+10, 342+(pucks.length+2)*12);
    if (seeStrategy) {
      drawStrategy();
      drawGoodMove();
    }
  }

  public void drawStrategy() {
    textSize(12);
    for (int i = 0; i < pucks.length; i++) {
      if (pucks[i].drawThis) {
        String lineInfo = "Puck " + i + " is at location " + pucks[i].rowPos + ", " + pucks[i].colPos +" with value " + pucks[i].curValue;
        text(lineInfo, width/2 + 10, + 320 + i*12);
      } 
      else {
        String lineInfo = "Puck " + i + " is done and no longer has a move.";
        text(lineInfo, width/2 + 10, + 320 + i*12);
      }
    }
    String xored = "(";
    for (int i = 0; i < pucks.length-1; i++)
      xored  = xored + pucks[i].curValue + " XOR ";
    xored = xored +pucks[pucks.length-1].curValue + "  = " + getGraphNimber()+ " )";
    text("The current game Nimber is : " + getGraphNimber() +".", width/2+10, 320+pucks.length*12);
    text(xored, width/2+10, 320+(pucks.length+1)*12);

    ArrayList<Integer> goodMoves = getGoodMoves();
    for (int i = 0; i < pucks.length; i++) {
      text("There is no good move for Puck " + i + ".", width/2+width/4+10, 320+12*(i));
    }
    if (goodMoves == null)
      return;


    for (int i = 0; i < goodMoves.size(); i+=3) {
      fill(255, 255, 255);
      rect(width/2+width/4, 310+goodMoves.get(i)*12, width, 12);
      if (pucks[goodMoves.get(i)].drawThis) {
        fill(0, 0, 0);
        text("A good move for Puck " + goodMoves.get(i) + " is moving to : " + goodMoves.get(i+1) + "," + goodMoves.get(i+2), width/2+width/4, 320+12*goodMoves.get(i));
      }
    }
  }
  public int getRow () {
    int lineStartX = topSquareX;
    int lineStartY = topSquareY - SQUARE_WIDTH;
    int nextPointX = lineStartX + SQUARE_WIDTH;
    int nextPointY = lineStartY + SQUARE_WIDTH;

    if ((nextPointX - lineStartX)*(mouseY-lineStartY) - (nextPointY-lineStartY)*(mouseX-lineStartX) < 0) {
      return -1;
    }
    for (int i = 0; i < gameBoard.length; i++) {
      lineStartX = lineStartX-SQUARE_WIDTH;
      lineStartY = lineStartY + SQUARE_WIDTH;
      nextPointX = nextPointX - SQUARE_WIDTH;
      nextPointY = nextPointY + SQUARE_WIDTH;
      if ((nextPointX - lineStartX)*(mouseY-lineStartY) - (nextPointY-lineStartY)*(mouseX-lineStartX) < 0)
        return i;
    }
    return -1;
  }

  public Puck getSelected() {
    for (int i = 0; i < pucks.length; i++) {
      if (pucks[i].selected)
        return pucks[i];
    }
    return null;
  }

  public void compMove() {
    boolean over = true;
    for (int i = 0; i < pucks.length; i++) {
      if (getPossibles(pucks[i].rowPos, pucks[i].colPos).size() != 0) {
        over = false;
      }
    }
    if (over) {
      endingScreen(true);
      return;
    }
    ArrayList<Integer> possibles;
    int computerPuck = -1;
    do {
      computerPuck = (int) random(0, pucks.length);
      possibles = getPossibles(pucks[computerPuck].rowPos, pucks[computerPuck].colPos);
    } 
    while (possibles.size () == 0);

    int selection = (int) random(0, possibles.size());
    println(computerPuck);
    if (selection %2 == 1)
      selection--;
    pucks[computerPuck].movePuck(possibles.get(selection), possibles.get(selection+1), gameBoard[possibles.get(selection)][possibles.get(selection+1)]);
    drawBoard();
    over = true;
    for (int i = 0; i < pucks.length; i++) {
      if (getPossibles(pucks[i].rowPos, pucks[i].colPos).size() != 0) {
        over = false;
      }
    }
    
    if (over) {
      endingScreen(false);
      return;
    }
  }

  public void removeFinishedPucks() {
    for (int i = 0; i < pucks.length; i++) {
      ArrayList<Integer> moves = getPossibles(pucks[i].rowPos, pucks[i].colPos);
      if (moves.size() == 0)
        pucks[i].drawThis = false;
    }
  }

  public void movePuck (int rowNum, int colNum, int newRowNum, int newColNum) {
    Puck selected = null;
    for (int i = 0; i < pucks.length; i++) {
      if (pucks[i].rowPos == rowNum && pucks[i].colPos == colNum)
        selected = pucks[i];
    }
    if (selected != null) {
      selected.movePuck(newRowNum, newColNum, gameBoard[newRowNum][newColNum]);
    }

    boolean cont = false;
    removeFinishedPucks();
    for (int i = 0; i < pucks.length; i++) {
      if (!pucks[i].drawThis)
        cont = true;
    }
    compMove();
    removeFinishedPucks();
    cont = false;
    for (int i = 0; i < pucks.length; i++) {
      if (!pucks[i].drawThis)
        cont = true;
    }
  }

  public void endingScreen(boolean won) {
    this.nukeSelected();
    drawBoard();
    fill(220, 220, 220, 200);
    rect(0, 0, width, height);
    fill(0, 0, 0);
    textSize(30);
    if (won) {
      text("YOU WIN!", width/2 - 50, height/2 - 50);
    } 
    else {
      text("You lost :(", width/2 - 50, height/2 - 50);
    }
    this.gameWon = true;
  }

  public void makeStoppers() {
    Random rand = new Random();
    for (int t = stoppers.length-1; t >= 0; t--) {
      for (int i = stoppers[t].length-1; i >= 0; i--) {
        int stop = rand.nextInt(10);
        if (stop < 7)
          stoppers[t][i] = 0;
        if (stop == 7)
          stoppers[t][i] = 1;
        if (stop == 8)
          stoppers[t][i] = 2;
        if (stop == 9)
          stoppers[t][i] = 3;
      }
    }
  }


  public void initializeValues () {
    for (int t = gameBoard.length-1; t >= 0; t--) {
      for (int i = gameBoard[t].length-1; i >= 0; i--) {
        gameBoard[t][i] = mex(t, i);
      }
    }
  }

  private int mex (int row, int col) {
    int minimum = 0;
    boolean proceed = false;
    while (!proceed) {
      proceed = true;
      for (int i = col; i < gameBoard[row].length; i++) {
        if (gameBoard[row][i] == minimum) {
          minimum++;
          proceed = false;
        }
        if (stoppers[row][i]!= 0 && stoppers[row][i]%2 == 1)
          break;
      }
      for (int i = row; i < gameBoard.length; i++) {
        if (gameBoard[i][col] == minimum) {
          minimum++;
          proceed = false;
        }
        if (stoppers[i][col] != 0 && stoppers[i][col]%2 == 0 || stoppers[i][col] == 3)
          break;
      }
    }

    return minimum;
  }

  public ArrayList<Integer> getPossibles (int rowNum, int colNum) {
    ArrayList<Integer> possibles = new ArrayList<Integer>();

    for (int r = rowNum; r < gameBoard.length; r++) {
      if (r != rowNum) {
        possibles.add(r);
        possibles.add(colNum);
      }
      if (stoppers[r][colNum] == 2 || stoppers[r][colNum] == 3)
        break;
    }
    for (int c = colNum; c < gameBoard[rowNum].length; c++) {
      if (c != colNum ) {
        possibles.add(rowNum);
        possibles.add(c);
      }
      if (stoppers[rowNum][c] == 1 || stoppers[rowNum][c] == 3)
        break;
    }
    return possibles;
  }

  public void drawPossibles (int rowNum, int colNum) {
    fill(100, 100, 0, 100);
    ArrayList<Integer> possibles = getPossibles(rowNum, colNum);
    for (int i = 0; i < possibles.size()-1; i= i+2) {
      drawDiamond(topSquareX-(possibles.get(i)*SQUARE_WIDTH)+possibles.get(i+1)*SQUARE_WIDTH, topSquareY+(possibles.get(i)*SQUARE_WIDTH)+possibles.get(i+1)*SQUARE_WIDTH);
    }
  }

  public void nukeSelected() {
    for (int i = 0; i < pucks.length; i++)
      pucks[i].selected= false;
  }

  public Puck getPuck(int rowNum, int colNum) {
    for (int i = 0; i < pucks.length; i++) {
      if (pucks[i].rowPos == rowNum && pucks[i].colPos == colNum)
        return pucks[i];
    }
    return null;
  }


  public void drawBoard() {
    if (this.gameWon)
      return;
    fill(255, 255, 255);
    for (int i = 0; i < gameBoard.length; i++) {
      for (int t = 0; t < gameBoard[i].length; t++) {
        drawDiamond(topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH);
        if (stoppers[i][t] == 1) {
          strokeWeight(4);
          line(topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH+SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH, topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH+SQUARE_WIDTH);
          strokeWeight(1);
        }
        if (stoppers[i][t] == 2) {
          strokeWeight(4);
          line( topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH+SQUARE_WIDTH, topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH-SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH);
          strokeWeight(1);
        }
        if (stoppers[i][t] == 3) {
          strokeWeight(4);
          line(topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH+SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH, topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH+SQUARE_WIDTH);
          line( topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH+SQUARE_WIDTH, topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH-SQUARE_WIDTH, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH);
          strokeWeight(1);
        }

        fill(0, 0, 0);
        textSize(12);
        if (MazeGame.drawNumbers )
          text(Integer.toString(gameBoard[i][t]), topSquareX-(i*SQUARE_WIDTH)+t*SQUARE_WIDTH-6, topSquareY+(i*SQUARE_WIDTH)+t*SQUARE_WIDTH+3);
        fill(255, 255, 255);
      }
    }
    fill(255, 0, 0, 100);
    for (int i = 0; i < pucks.length; i++) {
      if (pucks[i].selected == true) {
        fill(0, 0, 255);
        drawDiamond(topSquareX-(pucks[i].rowPos*SQUARE_WIDTH)+pucks[i].colPos*SQUARE_WIDTH, topSquareY+(pucks[i].rowPos*SQUARE_WIDTH)+pucks[i].colPos*SQUARE_WIDTH);
        fill(255, 0, 0, 100);
      }
      if (pucks[i].drawThis)
        ellipse(topSquareX-(pucks[i].rowPos*SQUARE_WIDTH)+pucks[i].colPos*SQUARE_WIDTH, topSquareY+(pucks[i].rowPos*SQUARE_WIDTH)+pucks[i].colPos*SQUARE_WIDTH, 30, 30);
    }
    drawGameAnalysis();
  }

  public void drawDiamond (int xCenter, int yCenter) {
    quad(xCenter, yCenter-SQUARE_WIDTH, xCenter+SQUARE_WIDTH, yCenter, xCenter, yCenter+SQUARE_WIDTH, xCenter-SQUARE_WIDTH, yCenter);
  }

  public int getGraphNimber() {
    int nimber = 0;
    for (int i = 0; i < pucks.length; i++) {
      nimber ^= pucks[i].curValue;
    }
    return nimber;
  }
}


