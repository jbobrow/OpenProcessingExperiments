
// Reversi / othello - Jim Bumgardner

// Todo: Work on relative weighting of mobility,stable squares, corners, etc.

// Commands are N Newgame T Takeback S Switch sides

// Add switch-sides, take-back.

// Add bonuses for stable squares

// make auto-turn skip & computer start part of basic idle handling (rather than side effects of
// other functions)

static final int pw = 8;
static final int ph = 8;
int lm, tm;
int tw, th;
static final int kMaxMoves = 130;      // maximum moves in a game (including skips)
                                       // actual number is probably lower than this...
int kMaxSearchDepth = 5;  // 7 is very hard, 3 is easy, 5 is medium
static final int kMaxStack = kMaxMoves;

static final int debugLevel = 1;

static final boolean kTest = false;
boolean stratB = true; // use strategy B

RBoard cgrid;
// int[] colors = {0xA41F62, 0xFFA300, 0x5F9F00, 0x001FA2};

int       playerColor = 0; // 0 = black, 1 = white
Opponent  opp;
boolean   isStopped = false;
boolean USE_RANDOM = false;

  static int[] bitCnt = new int[256];
  {
    for (int x = 0; x < 256; ++x) {
      bitCnt[x] = 0;
      for (int b = 0; b < 8; ++b) {
        if ((x & (1 << b)) != 0)
          bitCnt[x]++;
      }
    }
  }



// Init

// EASY = 1/3 random moves
// MEDIUM = 1/2 random moves
// HARD = no random moves


void setup()
{
  size(660,600);
  tw = width/(pw+2)+1;
  th = height/(ph+2)+1;
  lm = tw-(pw/2+1);
  tm = th-(ph/2+1);
  smooth();
  noLoop();

  PFont myFont = loadFont("ComicSansMS-24.vlw");
  textFont(myFont, 36);
  opp = new Opponent();
  newGame();
}

void newGame()
{
  cgrid = new RBoard();

  cgrid.addPiece(3,3,RBoard.WHITE);
  cgrid.addPiece(3,4,RBoard.BLACK);
  cgrid.addPiece(4,3,RBoard.BLACK);
  cgrid.addPiece(4,4,RBoard.WHITE);
  println("new game black:"+cgrid.nbrBlack+" white:"+cgrid.nbrWhite);
}

void draw()
{
  smooth();
  background(0x5b,0x23,0x09);

  //  background(0x32,0x75,0x3c);
  noStroke();
  ellipseMode(CORNER);
  int x1,y1,x2,y2,x3,y3,x4,y4,x5,y5;

  fill(0x32,0x75,0x3c);
  rect(lm, tm, pw*tw, ph*th);

  noFill();
  stroke(0x23,0x6a,0x29);
  for (int y = 1; y < ph; ++y)
  {
    line(lm,tm+y*th,lm+pw*tw,tm+y*th);
  }
  for (int x = 1; x < pw; ++x)
  {
    line(lm+x*tw,tm,lm+x*tw,tm+ph*th);
  }
  fill(128);
  for (int x = 0; x < pw; ++x) {
    text(String.valueOf((char) (65+x)), lm+x*tw+tw*.3,th*.66);
  }
  for (int y = 0; y < ph; ++y) {
    text(y+1, tw*.33,tm+y*th+th*.66);
  }
  smooth();
  noStroke();
  for (int y = 0; y < ph; ++y)
  {
    for (int x = 0; x < pw; ++x)
    {
      if ((cgrid.isStable[y] & (1 << x)) != 0)
      {
        fill(0,0,255);
        ellipse(lm+x*tw+tw-4,tm+y*th+th-4,4,4);
      }
      int pce = cgrid.getPiece(x,y);
      if (pce == RBoard.EMPTY)
        continue;
      int clr = (pce == RBoard.WHITE? 0xFFFFFF : 0x000000);
      int r = clr >> 16;
      int g = (clr >> 8) & 0xFF;
      int b = clr & 0xFF;
      fill(r,g,b);
      ellipse(lm+x*tw+2,tm+y*th+2,tw-3,th-3);
   }
  }
}

void handleGameOver()
{
            println("GAME OVER Black:" + cgrid.nbrBlack + " White:" + cgrid.nbrWhite);
            println("Current board score: " + scoreBoard(cgrid, 0));
            println("LAST MOVE TYPE-1: " + cgrid.moveHist[cgrid.turnIdx-1].moveType);
            println("LAST MOVE TYPE-2: " + cgrid.moveHist[cgrid.turnIdx-2].moveType);
}

void handlePlayerClick()
{
  int gx = (mouseX-lm)/tw;
  int gy = (mouseY-tm)/th;
  if (gx < 0 || gx >= pw || gy < 0 || gy >= ph)
    return;

  if (IsLegalMove(cgrid, (cgrid.turnIdx & 1), gx,gy))
  {
    Move ym = new Move(Move.NORMAL, gx, gy);
    cgrid.DoMove(ym);
    if (debugLevel >= 1)
      println(cgrid.turnIdx + ": Making your move " + ym.toString() + " black:"+cgrid.nbrBlack+" white:"+cgrid.nbrWhite);

      // 3/20 - detect computer pass & end of game
      MoveList ml = opp.getMoveList(cgrid, (cgrid.turnIdx & 1));
      if (ml.isPass()) {
        println((cgrid.turnIdx+1) + ": No moves for me\n");
        cgrid.moveHist[cgrid.turnIdx] = new Move(Move.PASS, -1, -1);
        ++cgrid.turnIdx;
        ml = opp.getMoveList(cgrid, (cgrid.turnIdx & 1));
        if (ml.isPass()) {
            cgrid.moveHist[cgrid.turnIdx] = new Move(Move.PASS, -1, -1);
            cgrid.turnIdx++;
            handleGameOver();
        }
        else {
          println("Skiped my turn...");
        }
      }
      else {
        // !!! check if game is over here...
        opp.startComputerMove();
      }
    redraw();
  }
  else {
    println("Illegal move - try again");
  }
}

void mousePressed()
{
  // If player is black, and turnIdx is even, or player is white, and turnIdx is odd
  if ((cgrid.turnIdx & 1) == (playerColor & 1))
    handlePlayerClick();
  // or Player is

}

boolean MakesFlank(RBoard cgrid, int clr, int x, int y)
{
  int myBoardColor = clr+1;
  int oppBoardColor = (clr ^ 1) + 1;
  // WEST
  if (x > 1 && cgrid.getPiece(x-1,y) == oppBoardColor)
  {
    int dx = x-2;
    while (dx > 0 && cgrid.getPiece(dx,y) == oppBoardColor)
      --dx;
    if (cgrid.getPiece(dx,y) == myBoardColor)
      return true;
  }

  // NORTH
  if (y > 1 && cgrid.getPiece(x,y-1) == oppBoardColor)
  {
    int dy = y-2;
    while (dy > 0 && cgrid.getPiece(x,dy) == oppBoardColor)
      --dy;
    if (cgrid.getPiece(x,dy) == myBoardColor)
      return true;
  }

  // EAST
  if (x < pw-2 && cgrid.getPiece(x+1,y) == oppBoardColor)
  {
    int dx = x+2;
    while (dx < pw-1 && cgrid.getPiece(dx,y) == oppBoardColor)
      ++dx;
    if (cgrid.getPiece(dx,y) == myBoardColor)
      return true;
  }

  // SOUTH
  if (y < ph-2 && cgrid.getPiece(x,y+1) == oppBoardColor)
  {
    int dy = y+2;
    while (dy < ph-1 && cgrid.getPiece(x,dy) == oppBoardColor)
      ++dy;
    if (cgrid.getPiece(x,dy) == myBoardColor)
      return true;
  }
  // NORTHWEST
  if (x > 1 && y > 1 && cgrid.getPiece(x-1,y-1) == oppBoardColor)
  {
    int dx = x-2;
    int dy = y-2;
    while (dx > 0 && dy > 0 && cgrid.getPiece(dx,dy) == oppBoardColor)
    {
      --dx;
      --dy;
    }
    if (cgrid.getPiece(dx,dy) == myBoardColor)
      return true;
  }
  // NORTHEAST
  if (x < pw-2 && y > 1 && cgrid.getPiece(x+1,y-1) == oppBoardColor)
  {
    int dx = x+2;
    int dy = y-2;
    while (dx < pw-1 && dy > 0 && cgrid.getPiece(dx,dy) == oppBoardColor)
    {
      ++dx;
      --dy;
    }
    if (cgrid.getPiece(dx,dy) == myBoardColor)
      return true;
  }
  // SOUTH EAST
  if (x < pw-2 && y < ph-2 && cgrid.getPiece(x+1,y+1) == oppBoardColor)
  {
    int dx = x+2;
    int dy = y+2;
    while (dx < pw-1 && dy < ph-1 && cgrid.getPiece(dx,dy) == oppBoardColor)
    {
      ++dx;
      ++dy;
    }
    if (cgrid.getPiece(dx,dy) == myBoardColor)
      return true;
  }
  // SOUTH WEST
  if (x > 1 && y < ph-2 && cgrid.getPiece(x-1,y+1) == oppBoardColor)
  {
    int dx = x-2;
    int dy = y+2;
    while (dx > 0 && dy < ph-1 && cgrid.getPiece(dx,dy) == oppBoardColor)
    {
      --dx;
      ++dy;
    }
    if (cgrid.getPiece(dx,dy) == myBoardColor)
      return true;
  }

  return false;
}

boolean IsLegalMove(RBoard cgrid, int clr, int x, int y)
{
  // println("Trying " + x + ", " + y + " for color " + clr);
  if (cgrid.getPiece(x,y) != RBoard.EMPTY)
    return false;
  if (MakesFlank(cgrid, clr, x, y))
  {
    // Check if there is a flank...
    return true;
  }
  return false;
}


void keyPressed()
{
  if (key == 'n' || key == 'N')
  {
    newGame();
    redraw();
  }
  else if (key == 'h' || key == 'H') {
      // Hint
  }
  else if (key == '\b' || key == 't' || key == 'T')
  {
     if ((cgrid.turnIdx & 1) == (playerColor & 1))  // is it our turn?
     {
       if (cgrid.turnIdx > 1) {
          println("Take back\n");
          cgrid.UndoMove();
          cgrid.UndoMove();
          redraw();
       }
       else {
           println("Nothing to take back\n");
       }
     }
  }
  else if (key == 's' || key == 'S') {
     if ((cgrid.turnIdx & 1) == (playerColor & 1))  // is it our turn?
     {
       println("Switching sides");
       // switch sides
       playerColor ^= 1;
       // start computer move
       // stratB = (playerColor == 1);
       // kMaxSearchDepth = (stratB? 3 : 7);
       // println("Strategy B? " + (stratB? "Yes" : "No"));
       opp.startComputerMove();
     }
  }
  else if (key == 'x') {
    isStopped = true;
  }
  else
    println("Key: " + keyCode);
}

// Bonus squares in North-West Octant (x < 4, y < 4, x > y)
int[][] bsq = {{0,0,20},{1,0,-6},{1,1,-12}};
// static final int kCornerBonus = 20;

int scoreBoard(RBoard cgrid, int depth)
{
  // score for black (then reverse at end, if necessary)
  // !!!
  if (stratB)
    return scoreBoardB(cgrid, depth);

  int score;
  // no pieces of one color?
  if (cgrid.nbrBlack == 0)
    score = -(16000 - depth);
  else if (cgrid.nbrWhite == 0)
    score = 16000 - depth;
  else if (cgrid.turnIdx >= 2 && cgrid.moveHist[cgrid.turnIdx-1].moveType == Move.PASS &&
                              cgrid.moveHist[cgrid.turnIdx-2].moveType == Move.PASS)
  {
      // no moves for both sides
      //    score infinitely for winning side
    if (cgrid.nbrBlack > cgrid.nbrWhite) {
        score = 16000 - depth;
    }
    else if (cgrid.nbrWhite > cgrid.nbrBlack) {
        score = -(16000 - depth);
    }
    else {
        score = depth; // draw
    }
  }
  else {
    // +1 for each piece
    // +X for each stable piece (depends on max number of pieces that can be contained by the piece, based on location,
    // only count stable-bonus if piece is stable after capture
    // not counting other end-cap

    // something along these lines...
    //  18 16 15 14 14 15 16 18
    //  16 15 13 13 13 13 15 16
    //  15 13 14 ?  ?  14 13 15
    //  14 13 ?  ?  ?  ?  13 14
    //  14 13 ?  ?  ?  ?  13 14
    //  15 13 14  ?  ? 14 13 15
    //  16 15 13 13 13 13 15 16
    //  18 16 15 14 14 15 16 18
    score = cgrid.nbrBlack - cgrid.nbrWhite;

    for (int i = 0; i < bsq.length; ++i) {
      int x = bsq[i][0];
      int y = bsq[i][1];
      int v = bsq[i][2];
      if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
        if ((cgrid.isWhite[0] & (1 << x)) > 0)
          score -= v;
         else
          score += v;
      }
      x = 7-x;
      if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
        if ((cgrid.isWhite[0] & (1 << x)) > 0)
          score -= v;
         else
          score += v;
      }
      y = 7-y;
      if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
        if ((cgrid.isWhite[0] & (1 << x)) > 0)
          score -= v;
         else
          score += v;
      }
      x = 7-x;
      if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
        if ((cgrid.isWhite[0] & (1 << x)) > 0)
          score -= v;
         else
          score += v;
      }
      y = 7-y;
      // Now reverse x and y if they are not equal
      if (x != y) {
          int t = x;
          x = y;
          y = t;
        if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
          if ((cgrid.isWhite[0] & (1 << x)) > 0)
            score -= v;
           else
            score += v;
        }
        x = 7-x;
        if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
          if ((cgrid.isWhite[0] & (1 << x)) > 0)
            score -= v;
           else
            score += v;
        }
        y = 7-y;
        if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
          if ((cgrid.isWhite[0] & (1 << x)) > 0)
            score -= v;
           else
            score += v;
        }
        x = 7-x;
        if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
          if ((cgrid.isWhite[0] & (1 << x)) > 0)
            score -= v;
           else
            score += v;
        }
      }
    }
    if (USE_RANDOM)
      score = (score*10)+(int)(Math.random()*9)-4;
    else
       score = score*10;
  }
  // flip score if we're white
  if ((cgrid.turnIdx & 1) != 0)
    score = -score;
  return score;
}

boolean cornerIsCaptured(RBoard cgrid)
{
    if (   !( (cgrid.isEmpty[0] & (1 << 0)) > 0) ||
           !( (cgrid.isEmpty[0] & (1 << 7)) > 0) ||
           !( (cgrid.isEmpty[7] & (1 << 0)) > 0) ||
           !( (cgrid.isEmpty[7] & (1 << 7)) > 0) )
           return true;
    else
           return false;
}

int nbrWhiteStable(RBoard cgrid)
{
  int sum = 0;
  for (int y = 0; y < 8; ++y)
  {
    sum += bitCnt[cgrid.isWhite[y] & cgrid.isStable[y]];
  }
  return sum;
}

int nbrBlackStable(RBoard cgrid)
{
  int sum = 0;
  for (int y = 0; y < 8; ++y)
  {
    sum += bitCnt[~cgrid.isWhite[y] & cgrid.isStable[y]];
  }
  return sum;
}

int nbrWhiteEdges(RBoard cgrid)
{
  int  sum = 0;
  int  x,y;
  for (y = 0; y < 7; ++y) {
     for (x = 0; x < 7; ++x) {
       if ((cgrid.isEmpty[y] & (1 << x)) > 0) // skip empty
         continue;
       if ((cgrid.isWhite[y] & (1 << x)) == 0) // skip black
         continue;
       if ((y > 0 && ( (cgrid.isEmpty[y-1] & (1 << x)) > 0)) ||
           ((y < 7 && ( (cgrid.isEmpty[y+1] & (1 << x)) > 0))) ||
           ((x > 0 && ( (cgrid.isEmpty[y] & (1 << (x-1))) > 0))) ||
           ((x < 7 && ( (cgrid.isEmpty[y] & (1 << (x+1))) > 0))))
           sum++;
     }
  }
  return sum;
}

int nbrBlackEdges(RBoard cgrid)
{
  int  sum = 0;
  int  x,y;
  for (y = 0; y < 7; ++y) {
     for (x = 0; x < 7; ++x) {
       if ((cgrid.isEmpty[y] & (1 << x)) > 0) // skip empty
         continue;
       if ((cgrid.isWhite[y] & (1 << x)) != 0) // skip white
         continue;
       if ((y > 0 && ( (cgrid.isEmpty[y-1] & (1 << x)) > 0)) ||
           ((y < 7 && ( (cgrid.isEmpty[y+1] & (1 << x)) > 0))) ||
           ((x > 0 && ( (cgrid.isEmpty[y] & (1 << (x-1))) > 0))) ||
           ((x < 7 && ( (cgrid.isEmpty[y] & (1 << (x+1))) > 0))))
           sum++;
     }
  }
  return sum;
}

int ComputeSquareBonus(RBoard cgrid, int x, int y, int v)
{
  if (v < 0) {     // only compute penalties if adjacent corner is empty
    int cx,cy;
    cx = x < 4? 0 : 7;
    cy = y < 4? 0 : 7;
    if (!( (cgrid.isEmpty[cy] & (1 << cx)) > 0))
      return 0;
  }
  if (   !(  (cgrid.isEmpty[y] & (1 << x)) > 0)  ) {
     if ((cgrid.isWhite[y] & (1 << x)) > 0)
       return -v;
     else
       return v;
  }
  return 0;
}

// 20 for corner, -20 for X square, -10 for side square
int[][] bsqB = {{0,0,20},{1,0,-10},{1,1,-20}};
int scoreBoardB(RBoard cgrid, int depth)
{
  // score for black (then reverse at end, if necessary)
  // !!!
  int score;
  // no pieces of one color?
  if (cgrid.nbrBlack == 0)
    score = -(16000 - depth);
  else if (cgrid.nbrWhite == 0)
    score = 16000 - depth;
  else if (cgrid.turnIdx >= 2 && cgrid.moveHist[cgrid.turnIdx-1].moveType == Move.PASS &&
                              cgrid.moveHist[cgrid.turnIdx-2].moveType == Move.PASS)
  {
      // no moves for both sides
      //    score infinitely for winning side
    if (cgrid.nbrBlack > cgrid.nbrWhite) {
        score = 16000 - depth;
    }
    else if (cgrid.nbrWhite > cgrid.nbrBlack) {
        score = -(16000 - depth);
    }
    else {
        score = depth; // draw
    }
  }
  else {
    // +1 for each piece
    // +X for each stable piece (depends on max number of pieces that can be contained by the piece, based on location,
    // only count stable-bonus if piece is stable after capture
    // not counting other end-cap

    if (cornerIsCaptured(cgrid))
    { // score for stable captures
      score = (nbrBlackStable(cgrid) - nbrWhiteStable(cgrid))*5; // 5 points per stable square
    }
    else {
      score = 0;
    }
    // quick mobility estimate
    score += nbrWhiteEdges(cgrid) - nbrBlackEdges(cgrid); // 1 point for negative edge

    for (int i = 0; i < bsqB.length; ++i) {
      int x = bsqB[i][0];
      int y = bsqB[i][1];
      int v = bsqB[i][2];
      score += ComputeSquareBonus(cgrid, x,y,v);
      score += ComputeSquareBonus(cgrid, 7-x,y,v);
      score += ComputeSquareBonus(cgrid, x,7-y,v);
      score += ComputeSquareBonus(cgrid, 7-x,7-y,v);
      // Now reverse x and y if they are not equal
      if (x != y) {
          int t = x;
          x = y;
          y = t;
          score += ComputeSquareBonus(cgrid, x,y,v);
          score += ComputeSquareBonus(cgrid, 7-x,y,v);
          score += ComputeSquareBonus(cgrid, x,7-y,v);
          score += ComputeSquareBonus(cgrid, 7-x,7-y,v);
      }
    }
    if (USE_RANDOM)
      score = (score*10)+(int)(Math.random()*9)-4;
    else
      score = score*10;
  }
  // flip score if we're white
  if ((cgrid.turnIdx & 1) != 0)
    score = -score;
  return score;
}


public class Move
{
  public byte moveType;
  public byte x;
  public byte y;
  public static final int NORMAL = 0;
  public static final int PASS = 1;

  public Move(int moveType, int x, int y)
  {
    this.moveType = (byte) moveType;
    this.x = (byte) x;
    this.y = (byte) y;
  }

  public String toString()
  {
    if (moveType == PASS)
      return "PASS";
    else
      return String.valueOf((char) (65+x)) + (y+1);
  }
}

public class MoveList
{
  Vector moves;

  public MoveList()
  {
    moves = new Vector();
  }

  int GenerateLegalMoves(RBoard cgrid, int clr)
  {
    int n = 0;
    if (cgrid.turnIdx >= 2 && cgrid.moveHist[cgrid.turnIdx-1].moveType == Move.PASS &&
                              cgrid.moveHist[cgrid.turnIdx-2].moveType == Move.PASS)
    {
       return 0;
    }
     for (int y = 0; y < ph; ++y) {
       if (cgrid.isEmpty[y] == 0)
         continue;
       for (int x = 0; x < pw; ++x) {
          if (cgrid.getPiece(x,y) == 0 && IsLegalMove(cgrid, clr, x, y))
          {
            moves.add(new Move(Move.NORMAL, x, y));
            ++n;
          }
       }
     }
     if (n == 0) {
       moves.add(new Move(Move.PASS, -1, -1));
     }
     return n;
  }

  boolean isPass()
  {
    return moves.size() == 1 && ((Move) moves.firstElement()).moveType == Move.PASS;
  }

  void Dump(int depth)
  {
    String oStr = "";
    for (int i = 0; i < depth; ++i)
      oStr += "  ";
    oStr += (depth+1) + ": ";
    for (int i = 0; i < moves.size(); ++i) {
      Move m = (Move) moves.elementAt(i);
      if (m.moveType == Move.PASS) {
        oStr += "PASS";
      }
      else {
        oStr += m.toString();
      }
      oStr += ' ';
    }
    println(oStr);
  }
}

public class Opponent implements Runnable
{
  private volatile Thread oppThread = null;

  public Opponent()
  {
  }

  public void startComputerMove()
  {
      oppThread = new Thread(this, "Opponent");
      oppThread.start();
  }

  MoveList getMoveList(RBoard cgrid, int clr)
  {
      MoveList ml = new MoveList();
      ml.GenerateLegalMoves(cgrid, clr);
      return ml;
  }

  // this is only faster if we do incrementing PVS search (searching principal variation first)

  public int negascout(RBoard cgrid, int lowerBound, int upperBound, int depth)
  {
    // println("AB " + lowerBound + " to " + upperBound + " depth " + depth);
    if (depth >= kMaxSearchDepth) // leaf node?
    {
      return scoreBoard(cgrid, depth);
    }
    MoveList ml = getMoveList(cgrid, (cgrid.turnIdx & 1));
    // detect if game over here...
    if (ml.moves.size() == 0) {
      return scoreBoard(cgrid, depth);
    }
    if (debugLevel > 1)
      ml.Dump(depth);
    int a = lowerBound;
    int b = upperBound;
    for (int i = 0; i < ml.moves.size() && lowerBound < upperBound; ++i)
    {
        if (depth < 2)
          delay(5);
        Move m = (Move) ml.moves.elementAt(i);
        // do the move
        cgrid.DoMove(m);
        int score = -negascout(cgrid, -b, -a, depth+1);
        if (score > a && score < upperBound && i > 0 && depth < kMaxSearchDepth-2)
          score = -negascout(cgrid, -upperBound, -score, depth+1);
        // undo the move
        cgrid.UndoMove();

        if (score > a) {
          a = score;
          // set principal variation (this saves pvars from ununused moves)
          if (depth < kMaxSearchDepth-1) {
            // println ("Copying  at depth " + depth);
            System.arraycopy(cgrid.pVar[depth+1], 0, cgrid.pVar[depth], 1, kMaxSearchDepth-(depth+1));
          }
          cgrid.pVar[depth][0] = m;
        }
        b = a + 1;
    }
    return a;
  }

  public int alphabeta(RBoard cgrid, int lowerBound, int upperBound, int depth)
  {
    // println("AB " + lowerBound + " to " + upperBound + " depth " + depth);
    if (depth >= kMaxSearchDepth) // leaf node?
    {
      return scoreBoard(cgrid, depth);
    }
    MoveList ml = getMoveList(cgrid, (cgrid.turnIdx & 1));
    // detect if game over here...
    if (ml.moves.size() == 0)
      return scoreBoard(cgrid, depth);

        // 3/20 don't search if one choice at depth 0
    if (depth == 0 && ml.moves.size() == 1) {
      cgrid.pVar[0][0] = (Move) ml.moves.elementAt(0);
      return scoreBoard(cgrid, depth);
    }
    
    if (debugLevel > 1)
      ml.Dump(depth);
    
    for (int i = 0; i < ml.moves.size() && lowerBound < upperBound; ++i)
    {
        if (depth < 2)
          delay(5);
        Move m = (Move) ml.moves.elementAt(i);
        // do the move
        cgrid.DoMove(m);
        int score = -alphabeta(cgrid, -upperBound, -lowerBound, depth+1);
        // undo the move
        cgrid.UndoMove();
        if (score > lowerBound) {
          lowerBound = score;
          // set principal variation (this saves pvars from ununused moves)
          if (depth < kMaxSearchDepth-1) {
            // println ("Copying  at depth " + depth);
            System.arraycopy(cgrid.pVar[depth+1], 0, cgrid.pVar[depth], 1, kMaxSearchDepth-(depth+1));
          }
          cgrid.pVar[depth][0] = m;
        }
    }
    return lowerBound;
  }

  public Move searchBestMove()
  {
    RBoard  sgrid = cgrid.clone();
     // do minimax alpha-beta search for best move
     // !! generate list of legal moves
     int easy = 0;
     if (easy != 0) {
       delay(2000);
       MoveList ml = getMoveList(sgrid, (cgrid.turnIdx & 1));
       // placeholder - pick one randomly...
       if (ml.moves.size() > 0) {
         int r = int(random(ml.moves.size()));
         Move m = (Move) ml.moves.elementAt(r);
         return m;
       }
       else {
         println("No Moves! (shouldn't happen)");
         return null;
       }
     }
     else {
       if (debugLevel > 1)
         println("Alpha beta: " + sgrid.turnIdx + " " + sgrid.stackCtr);
       float startTime = millis();
       int score = alphabeta(sgrid, -32000, 32000, 0);
       // float score = negascout(sgrid, -32000.0, 32000.0, 0);
       float elapsed = (millis() - startTime) / 1000.0;
       if (debugLevel >= 1)
       {
         println("Score = "  + score + " " + elapsed + " seconds elapsed");
         String	ps = "";
         for (int i = 0; i < 3 && sgrid.pVar[0][i] != null; ++i)
	        ps += (i+1)+":" + sgrid.pVar[0][i].toString()+" ";
          println("PVAR: " + ps);
       }
       return sgrid.pVar[0][0];
     }
  }

  public void run()
  {
    // make the move
    boolean redoOpp = true;
    while (redoOpp) {
      redoOpp = false;
      Move bestMove = searchBestMove();
      if (bestMove == null) {
        println("Search best move returned null!");
      }
      cgrid.DoMove(bestMove);
      if (debugLevel > 0) {
        println(cgrid.turnIdx + ": Made opp move " + bestMove.toString() + " black:"+cgrid.nbrBlack+" white:"+cgrid.nbrWhite);
      }
      MoveList ml = getMoveList(cgrid, (cgrid.turnIdx & 1));
      if (ml.isPass()) {
        println((cgrid.turnIdx+1) + ": No moves for you\n");
        cgrid.moveHist[cgrid.turnIdx] = new Move(Move.PASS, -1, -1);
        ++cgrid.turnIdx;
        ml = getMoveList(cgrid, (cgrid.turnIdx & 1));
        if (ml.isPass()) {
            cgrid.moveHist[cgrid.turnIdx] = new Move(Move.PASS, -1, -1);
            cgrid.turnIdx++;
            handleGameOver();
        }
        else {
          println("Skipping your turn...");
          redoOpp = true;
        }
      }
      else {
        println("Your move");
        if (kTest) {
           playerColor ^= 1;
           if ((cgrid.turnIdx & 1) != 0)
             kMaxSearchDepth = 7;
           else
             kMaxSearchDepth = 5;
           // start computer move
           opp.startComputerMove();
        }
      }
      redraw();
    }
  }
}

// Represents board using 16 bytes of storage

public class RBoard
{
  public static final int EMPTY = 0;
  public static final int BLACK = 1;
  public static final int WHITE = 2;
  private int[] isEmpty;
  private int[] isWhite;
  private int[] isStable;

  private int[] emptyStack;
  private int[] whiteStack;
  private int[] stableStack;
  private int[] nbrBlackStack;
  private int[] nbrWhiteStack;
  private Move[] moveHist; // move history (indexed with turnIdx)
  private Move[][] pVar;     // principal variation (indexed with search depth)

  public int turnIdx, nbrBlack, nbrWhite, stackCtr;


  public RBoard()
  {
    isEmpty = new int[8];
    isWhite = new int[8];
    isStable = new int[8];

    pVar = new Move[kMaxSearchDepth][];
    for (int i = 0; i < kMaxSearchDepth; ++i) {
      pVar[i] = new Move[kMaxSearchDepth];
    }
    for (int i = 0; i < 8; ++i)
    {
      isEmpty[i] = 0xFF;
      isWhite[i] = 0x00;
      isStable[i] = 0x00;
    }
    turnIdx = 0;
    nbrBlack = 0;
    nbrWhite = 0;
    emptyStack = new int[8*kMaxStack];
    whiteStack = new int[8*kMaxStack];
    stableStack = new int[8*kMaxStack];
    nbrBlackStack = new int[kMaxStack];
    nbrWhiteStack = new int[kMaxStack];
    moveHist = new Move[kMaxMoves];
//    pVar = new Move[kMaxStack];
    stackCtr = 0;
  }

  public RBoard clone()
  {
    RBoard c = new RBoard();
    try {
      System.arraycopy(this.isEmpty, 0, c.isEmpty, 0, 8);
      System.arraycopy(this.isWhite, 0, c.isWhite, 0, 8);
      System.arraycopy(this.isStable, 0, c.isStable, 0, 8);
      System.arraycopy(this.emptyStack, 0, c.emptyStack, 0, 8*this.stackCtr);
      System.arraycopy(this.whiteStack, 0, c.whiteStack, 0, 8*this.stackCtr);
      System.arraycopy(this.stableStack, 0, c.stableStack, 0, 8*this.stackCtr);
      System.arraycopy(this.moveHist, 0, c.moveHist, 0, this.turnIdx);
      System.arraycopy(this.nbrWhiteStack, 0, c.nbrWhiteStack, 0, this.stackCtr);
      System.arraycopy(this.nbrBlackStack, 0, c.nbrBlackStack, 0, this.stackCtr);
    }
    catch (Exception e) {
      println("Arraycopy error in clone: sctr=" + this.stackCtr + " " + e.toString());
    }
    c.turnIdx = this.turnIdx;
    c.nbrBlack = this.nbrBlack;
    c.nbrWhite = this.nbrWhite;
    c.stackCtr = this.stackCtr;
    return c;
  }

  boolean isUnknown(int x, int y)
  {
    return (isEmpty[y] & (1 << x)) > 0;
  }

  int getPiece(int x, int y)
  {
    if (  (isEmpty[y] & (1 << x)) > 0 )
      return EMPTY;
    if (  (isWhite[y] & (1 << x)) > 0 )
      return WHITE;
    else
      return BLACK;
  }

  void addPiece(int x, int y, int clr)
  {
    if (clr == EMPTY) {
      isEmpty[y] |= (1 << x);
    }
    else {
      isEmpty[y] &= ~(1 << x);
      if (clr == WHITE) {
        isWhite[y] |= (1 << x);
        ++nbrWhite;
      }
      else {
        isWhite[y] &= ~(1 << x);
        ++nbrBlack;
      }
    }
  }

  void flipPiece(int x, int y)
  {
    if ((isEmpty[y] & (1 << x)) != 0) {
      println("BAD FLIP!");
    }
    else {
      isWhite[y] ^= (1 << x);
      if ((isWhite[y] & (1 << x)) != 0)
      {
        nbrWhite++;
        --nbrBlack;
      }
      else {
        nbrBlack++;
        --nbrWhite;
      }
    }
  }

	void TurnFlank(int clr, int x, int y)
	{
	  int myBoardColor = clr+1;
	  int oppBoardColor = (clr ^ 1) + 1;
	  // WEST
	  if (x > 1 && getPiece(x-1,y) == oppBoardColor)
	  {
      int dx = x-2;
      while (dx > 0 && getPiece(dx,y) == oppBoardColor)
        --dx;
      if (getPiece(dx,y) == myBoardColor)
      {
        while (++dx < x)
          flipPiece(dx,y);
      }
	  }
	  // NORTH
	  if (y > 1 && getPiece(x,y-1) == oppBoardColor)
	  {
      int dy = y-2;
      while (dy > 0 && getPiece(x,dy) == oppBoardColor)
        --dy;
      if (getPiece(x,dy) == myBoardColor)
      {
        while (++dy < y)
          flipPiece(x,dy);
      }
	  }
	  // EAST
	  if (x < pw-2 && getPiece(x+1,y) == oppBoardColor)
	  {
      int dx = x+2;
      while (dx < pw-1 && getPiece(dx,y) == oppBoardColor)
        ++dx;
      if (getPiece(dx,y) == myBoardColor)
      {
        while (--dx > x)
          flipPiece(dx,y);
      }
	  }
	  // SOUTH
	  if (y < ph-2 && getPiece(x,y+1) == oppBoardColor)
	  {
      int dy = y+2;
      while (dy < ph-1 && getPiece(x,dy) == oppBoardColor)
        ++dy;
      if (getPiece(x,dy) == myBoardColor)
      {
        while (--dy > y)
          flipPiece(x,dy);
      }
	  }
	  // NORTH-WEST
	  if (x > 1 && y > 1 && getPiece(x-1,y-1) == oppBoardColor)
	  {
      int dx = x-2;
      int dy = y-2;
      while (dx > 0 && dy > 0 && getPiece(dx,dy) == oppBoardColor)
      {
        --dx;
        --dy;
      }
      if (getPiece(dx,dy) == myBoardColor)
      {
        while (++dx < x && ++dy < y)
          flipPiece(dx,dy);
      }
	  }
	  // SOUTH-EAST
	  if (x < pw-2 && y < ph-2 && getPiece(x+1,y+1) == oppBoardColor)
	  {
      int dx = x+2;
      int dy = y+2;
      while (dx < pw-1 && dy < ph-1 && getPiece(dx,dy) == oppBoardColor)
      {
        ++dx;
        ++dy;
      }
      if (getPiece(dx,dy) == myBoardColor)
      {
        while (--dx > x && --dy > y)
          flipPiece(dx,dy);
      }
	  }
	  // NORTH-EAST
	  if (x < pw-2 && y > 1 && getPiece(x+1,y-1) == oppBoardColor)
	  {
      int dx = x+2;
      int dy = y-2;
      while (dx < pw-1 && dy > 0 && getPiece(dx,dy) == oppBoardColor)
      {
        ++dx;
        --dy;
      }
      if (getPiece(dx,dy) == myBoardColor)
      {
        while (--dx > x && ++dy < y)
          flipPiece(dx,dy);
      }
	  }
	  // SOUTH-WEST
	  if (x > 1 && y < ph-2 && getPiece(x-1,y+1) == oppBoardColor)
	  {
      int dx = x-2;
      int dy = y+2;
      while (dx > 0 && dy < ph-1 && getPiece(dx,dy) == oppBoardColor)
      {
        --dx;
        ++dy;
      }
      if (getPiece(dx,dy) == myBoardColor)
      {
        while (++dx < x && --dy > y)
          flipPiece(dx,dy);
      }
	  }
	}

  void MakeMove( int x, int y)
  {
    addPiece(x,y,(turnIdx & 1)+1);
    TurnFlank((turnIdx & 1), x, y);
  }

  boolean ISSTABLE(int x, int y)
  {
    return (isStable[y] & (1 << x)) != 0;
  }  
  boolean ISWHITE(int x, int y)
  {
    return (isWhite[y] & (1 << x)) != 0;
  }  
  boolean ISEMPTY(int x, int y)
  {
    return (isEmpty[y] & (1 << x)) != 0;
  }  
  
  boolean isFullRow(int y)
  {
    return isEmpty[y] == 0;
  }

  boolean isFullCol(int x)
  {
    int b = (1 << x);
    return (isEmpty[0] & b) == 0 &&
           (isEmpty[1] & b) == 0 &&
           (isEmpty[2] & b) == 0 &&
           (isEmpty[3] & b) == 0 &&
           (isEmpty[4] & b) == 0 &&
           (isEmpty[5] & b) == 0 &&
           (isEmpty[6] & b) == 0 &&
           (isEmpty[7] & b) == 0;
  }

 boolean isFullDiagonalSE(int ox, int oy)
 {
   int x = ox-1;
   int y = oy-1;
   while (x >= 0 && y >= 0) {
     if ((isEmpty[y] & (1 << x)) != 0)
       return false;
    --x;
    --y;
   }
   x = ox+1;
   y = oy+1;
   while (x <= 7 && y <= 7) {
     if ((isEmpty[y] & (1 << x)) != 0)
       return false;
    ++x;
    ++y;
   }
   return true;
 }

  boolean isFullDiagonalSW(int ox, int oy)
 {
   int x = ox+1;
   int y = oy-1;
   while (x <= 7 && y >= 0) {
     if ((isEmpty[y] & (1 << x)) != 0)
       return false;
    ++x;
    --y;
   }
   x = ox-1;
   y = oy+1;
   while (x >= 0 && y <= 7) {
     if ((isEmpty[y] & (1 << x)) != 0)
       return false;
    --x;
    ++y;
   }
   return true;
 }

   void Stabilize()
   {
     // println("Checking stable");
     long startTime = millis();
    int  nbrChanged = 0;
    int  sum = 0;
     do {
       nbrChanged = 0;
       for (int y = 0; y < 8; ++y) {
         for (int x = 0; x < 8; ++x) {
           if (  ISEMPTY(x,y) || ISSTABLE(x,y))
            continue;
            // check if x axis is stable
           if ((x== 0 || x == 7 ||
                (ISSTABLE(x-1,y) && ISWHITE(x-1,y) == ISWHITE(x,y)) || 
                (ISSTABLE(x+1,y) && ISWHITE(x+1,y) == ISWHITE(x,y)) ||
                 isFullRow(y)) 
                
                &&
            // check if y axis is stable
                 
		(y== 0 || y == 7 ||
		(ISSTABLE(x,y-1) && ISWHITE(x,y-1) == ISWHITE(x,y)) || 
		(ISSTABLE(x,y+1) && ISWHITE(x,y+1) == ISWHITE(x,y)) ||
                isFullCol(x)) 
                  
                  &&

            // check if diagonal south-east

                 (x == 0 || y == 0 || x == 7 || y == 7 ||
                  (ISSTABLE(x-1,y-1) && ISWHITE(x-1,y-1) == ISWHITE(x,y)) ||
		(ISSTABLE(x+1,y+1) && ISWHITE(x+1,y+1) == ISWHITE(x,y)) ||
                 isFullDiagonalSE(x,y))
                  
                  &&
            // check if diagonal axis TR -> BL is stable

                 (x == 0 || y == 0 || x == 7 || y == 7 ||
                  (ISSTABLE(x-1,y+1) && ISWHITE(x-1,y+1) == ISWHITE(x,y)) ||
		(ISSTABLE(x+1,y-1) && ISWHITE(x+1,y-1) == ISWHITE(x,y)) ||
                   isFullDiagonalSW(x,y))
                )
           {
                  // check diagonals?
                  isStable[y] |= (1 << x);
                  nbrChanged++;
                  ++sum;
           }
         }
       }
     } while (nbrChanged > 0);
     // println("Stabilized: " + sum + " " + (millis() - startTime));
   }

  // Do move in an undoable way...
  void DoMove(Move m)
  {
    // println("DO " + m.moveType + ": x:" + m.x + " y:" + m.y);
    if (stackCtr >= kMaxStack) {
       println("END OF STACK!");
       return;
    }
    // push existing state onto stack
    try {
      System.arraycopy(isEmpty, 0, emptyStack, 8*stackCtr, 8);
      System.arraycopy(isWhite, 0, whiteStack, 8*stackCtr, 8);
      System.arraycopy(isStable, 0, stableStack, 8*stackCtr, 8);
      nbrWhiteStack[stackCtr] = nbrWhite;
      nbrBlackStack[stackCtr] = nbrBlack;
    }
    catch (Exception e) {
      println("Arraycopy error in doMove: " + e.toString());
    }

    moveHist[turnIdx] = m;
    stackCtr++;

    // apply the move
    if (m.moveType != Move.PASS)
    {
      MakeMove(m.x, m.y);
      Stabilize();
    }

    // increment the turn counter
    turnIdx++;

  }

  // Undo move
  void UndoMove()
  {
    if (turnIdx == 0) {
       println("EMPTY STACK!");
       return;
    }
    // pop state off stack
    --stackCtr;
    try {
      System.arraycopy(emptyStack, 8*stackCtr, isEmpty, 0, 8);
      System.arraycopy(whiteStack, 8*stackCtr, isWhite, 0, 8);
      System.arraycopy(stableStack, 8*stackCtr, isStable, 0, 8);
      nbrWhite = nbrWhiteStack[stackCtr];
      nbrBlack = nbrBlackStack[stackCtr];
    }
      catch (Exception e) {
      println("Arraycopy error in undoMove: stackCtr = " + stackCtr + " " + e.toString());
    }

    // decrement the turn counter
    turnIdx--;
  }

}

