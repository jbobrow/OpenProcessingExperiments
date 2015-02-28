
public class Game{
  final int BLOCK_SIZE = 35;
  final int WIDTH = 10;
  final int HEIGHT = 17;
  final int GOAL = 10;
  int score;
  boolean[][] gr;
  int[][] block;
  int[] blockTL;
  boolean needNewBlock;
  int moveDown;
  int blockNum;
   
  final int[][][] newBlockCoords = {
    {{0,0},{1,0},{2,0},{3,0}}, // line
    {{0,0},{1,0},{2,0},{1,1}}, // T
    {{0,0},{1,0},{2,0},{2,1}}, // L
    {{1,0},{1,1},{1,2},{0,2}}, // L
    {{0,0},{0,1},{1,1},{1,2}}, // Z
    {{0,1},{1,1},{1,0},{2,0}}, // Z
    {{0,0},{0,1},{1,0},{1,1}}};// square
   
  public Game(){
    size(BLOCK_SIZE*WIDTH, BLOCK_SIZE*HEIGHT);
    fill(#FF0000);
    blockTL=new int[]{0,0};
    frameRate(3);
    gr = new boolean[WIDTH][HEIGHT];
    block = makeBlock();
    blockNum=0;
    needNewBlock = false;
    moveDown = 0;
    score=0;
  }
   
  public void increment(){
    
    // sometimes the stupid user moves
    // a block between frames. This will
    // make sure it goes down all the way.
    if(canMove(0,1)) needNewBlock=false;
    
    println("block #"+blockNum);
    drawBlocks();
     
    if(needNewBlock) block = makeBlock();
     
    if(canMove(0,1) && !needNewBlock) {moveBlock(0,1);needNewBlock = false;}
    else needNewBlock = true;
     
    moveDown();
     
    if(score >= GOAL) endGame(true);
     
    deleteFullRows();
    println("------------------------");
  }
   
  public boolean keyPress(int key, int code){
    if(code==LEFT) moveBlock(-1, 0);
    if(code==RIGHT) moveBlock(1,0);
    if(code==32) rotateBlock();
    if(key=='r') return true;
    return false;
  }
   
  //////////////////////////////////////////////////////////////////////////
   
  // returns the coords of a new block in a randomly chosen form
  // and places the new block in the grid
  private int[][] makeBlock(){
    blockNum++;
    if(tooHigh()) endGame(false);
    println("Making block");
    int[][] temp = newBlockCoords[(int)random(7)];
//    int[][] temp = newBlockCoords[3];
    blockTL=new int[]{0,0};
    int[][] coords = new int[4][2];
    for(int ii=0;ii<4;ii++)
      for(int i=0;i<2;i++)
        coords[ii][i] = temp[ii][i];
//    int[][] coords = newBlockCoords[3];
    for(int[] i : coords)
      gr [i[0]] [i[1]] = true;
    println("done");
    return coords;
  }
   
  // checks to see whether the current block has room to move down
  private boolean canMove(int x, int y){
    println("testing canMove");
    boolean isPart;
    for(int[] i : block)
      if(i[0] > WIDTH-1-x || i[1] > HEIGHT-1-y || (gr [i[0]+x] [i[1]+y])){
          isPart=false;
          for(int[] b : block)
            if(b[0] == i[0]+x && b[1] == i[1]+y) isPart=true;
          if(!isPart) return false;
      }
    return true;
  }
   
  // move the block
  private void moveBlock(int x, int y){
    println("moving");
    if(!canMove(x,y)) return;
    for(int[] i : block)
      gr [i[0]] [i[1]] = false;
    for(int[] i : block)
      gr [i[0]+x] [i[1]+y] = true;
    for(int i=0;i<4;i++){
      block[i][0] += x;
      block[i][1] += y;
    }
    blockTL[0] += x;
    blockTL[1] += y;
    println("done");
  }
   
  // draw everything to the screen
  private void drawBlocks(){
    println("drawing blocks");
    background(#99BBFF);
    line(0,2*BLOCK_SIZE, WIDTH*BLOCK_SIZE, 2*BLOCK_SIZE);
    text(blockNum, 200,10);
    for(int i=0;i<WIDTH;i++)
      for(int j=0;j<HEIGHT;j++)
        if(gr[i][j]) rect(i*BLOCK_SIZE, j*BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
    fill(#0000FF);
    for(int i=0;i<4;i++)
      rect(block[i][0]*BLOCK_SIZE, block[i][1]*BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
    fill(#FF0000);
    println("done");
  }
   
  // changes block's coords to rotate it a specified direction
  private void rotateBlock(){
     int[][] temp = new int[4][2];
     clearBlock();
     for(int i=0;i<4;i++){
       block[i][0] -= blockTL[0];
       block[i][1] -= blockTL[1];
     }
     for(int i=0;i<4;i++){
       temp[i][0] = block[i][1];
       temp[i][1] = 0- block[i][0];
     }
     for(int i=0;i<4;i++){
       temp[i][0] += blockTL[0];
       temp[i][1] += blockTL[1];
     }
     System.arraycopy(temp,0,block,0,4);
     placeBlock();
     findNewTL();
  }
  
  private void clearBlock(){
    for(int[] i : block)
      gr [i[0]] [i[1]] = false;
  }
  
  private void placeBlock(){
    for(int[] i : block)
      gr [i[0]] [i[1]] = true;
  }
  
  private void findNewTL(){
    int x,y;
    int minX=Integer.MAX_VALUE;
    int minY=Integer.MAX_VALUE;
    for(int i=0;i<4;i++){
      x=block[i][0];
      y=block[i][1];
      if(x<minX) minX=x;
      if(y<minY) minY=y;
    }
    blockTL = new int[]{minX, minY};
  }
   
  // moves everything in the game down as many times as needed
  private void moveDown(){
    println("moveDown = "+moveDown);
    if(moveDown == 0) return;
    
    for(int i=HEIGHT-1;i>0;i--)
      for(int j=0;j<WIDTH;j++)
        gr[j][i] = gr[j][i-1];
    for(int i=0;i<WIDTH;i++)
      gr[i][0] = false;
    
    moveDown--;
    moveDown();
    println("  done");
  }
   
  // displays win or lose message and stops looping
  private void endGame(boolean winner){
    println("game ended");
    background(0);
    noLoop();
  }
   
  // checks whether anything is above the upper bounds
  private boolean tooHigh(){
    for(int i=0;i<WIDTH;i++)
      if(gr[i][0] || gr[i][1]) return true;
      return false;
  }
   
  // deletes full rows
  private void deleteFullRows(){
    println("deleting full rows");
    boolean full;
     for(int i=HEIGHT-1;i>=0;i--){
       full=true;
       for(int j=0;j<WIDTH;j++)
         if(!gr[j][i]){ full=false; break; }
       if(full) { moveDown++; deleteRow(i); }
       else break;
     }
     println("done");
  }
  
  private void deleteRow(int row){
    println("  deleting row "+row);
    for(int i=0;i<WIDTH;i++){
      gr[i][row] = false;
      println(i);
    }
    score ++;
  }
}

