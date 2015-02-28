
boolean pieceSet=false;
int numHorizontalCells;
int numVerticalCells;
int widthOfCells;
int heightOfCells;
int[][] knightBoard; 
int[][] movePositions;
 
void setup()
{
  numHorizontalCells=45;
  numVerticalCells=45;
  widthOfCells=10;
  heightOfCells=10;
  knightBoard=new int[numHorizontalCells][numVerticalCells];
  movePositions=new int[9][9];
  movePositions[4][4]=1;
  size(450,450);
  drawBoard();
}
 
void drawBoard()
{
  stroke(0);
  for(int x=0;x<numHorizontalCells;x++)
  for(int y=0;y<numVerticalCells;y++)
  {
    if(y%2==0)  //Checkerboard pattern
      if(x%2==0)
      fill(0);else fill(255);
    else if(x%2==1)
      fill(0);else fill(255);
       
   rect(x*widthOfCells,y*heightOfCells,widthOfCells,heightOfCells);
  }
}
 
void draw()
{
   
  if(pieceSet)
  {
  drawKnightPositions();
  }
  else
  drawPiecePositions();
}
 
 
int turn=1;
void drawKnightPositions()
{
  //Sets middle position to be where the piece starts
  if(turn == 1)
  knightBoard[floor(knightBoard.length/2)][floor(knightBoard[0].length/2)]=1;
   
    //Drawing Board
  for(int x=0;x<knightBoard.length;x++)
  for(int y=0;y<knightBoard.length;y++)
  {
   if(knightBoard[x][y]>0)
   {
     //Cool colors
     noStroke();
     fill(abs(sin(frameCount/53.0))*255-knightBoard[x][y]*5 + 24,abs(sin(frameCount/60.0))*255-knightBoard[x][y]*10 +10,abs(sin(frameCount/76.0))*255-knightBoard[x][y]*11 +20);
     rect(x*widthOfCells,y*heightOfCells,widthOfCells,heightOfCells);
   }
  }
   
  int[][] tempKnightBoard=new int[45][45];
   
  for(int x=0;x<knightBoard.length;x++)
  for(int y=0;y<knightBoard.length;y++)
  {
   if(knightBoard[x][y]==turn)
   {
      
    for(int a=0;a<movePositions.length;a++)
    for(int b=0;b<movePositions[0].length;b++)
    if(movePositions[a][b]==1)
    if(x+(a-4)>=0&&x+(a-4)<knightBoard.length&&y+(b-4)>=0&&y+(b-4)<knightBoard[0].length)
    {
    tempKnightBoard[x+(a-4)][y+(b-4)]=turn+1;
    }
     
   }
  }
   
  for(int x=0;x<knightBoard.length;x++)
  for(int y=0;y<knightBoard.length;y++)
  if(knightBoard[x][y]==0)
  knightBoard[x][y]=tempKnightBoard[x][y];
   
 
   
  turn++;
}
 
void drawPiecePositions()
{
  fill(100,255,255,1);
  rect(180,180,90,90);
   
  for(int x=0;x<movePositions.length;x++)
  for(int y=0;y<movePositions[0].length;y++)
  if(movePositions[x][y]==1)
  {
  fill(255,0,0);
  rect(180+x*widthOfCells,180+y*heightOfCells,widthOfCells,heightOfCells);
  }
}
 
void mouseClicked()
{
  if(mouseX>=180&&mouseX<=270&&mouseY>=180&&mouseY<=270)
  movePositions[floor((mouseX-180)/widthOfCells)][floor((mouseY-180)/heightOfCells)]=1;
}
 
void keyPressed()
{
 if(key=='f')
 {
 pieceSet=true;
 drawBoard();
 }
  
 if(key=='r')
 {
  knightBoard=new int[numHorizontalCells][numVerticalCells];
  movePositions=new int[9][9];
  pieceSet=false;
  movePositions[4][4]=1;
  drawBoard();
  turn=1;
 }
}



