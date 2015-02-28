
BlockArray grid;
int adjustX, adjustY;
float theta = 0;
int radius = 30;
/**
Left click and drag to distort the grid
*/
void setup()
{
  size(500,500);
  adjustX = 250;
  adjustY = 250;
  frameRate(30);
}
void draw()
{
  theta += .1;
  fill(255);
  stroke(255);
  rect(0,0,500, 500);
  
  if(mousePressed == true && mouseButton == LEFT)
  {
    grid = new BlockArray(30,30,adjustX,adjustY);
  }
  else
  {
  grid = new BlockArray(30,30,int(radius * cos(theta*1.1)+250),int(radius * sin(theta)+250));
  }
  grid.draw();
}
void mouseDragged()
{
  adjustX = mouseX/2 + 125;
  adjustY = mouseY/2 + 125;
  redraw();
}
class Block
{
  int nWidth,nHeight,nX,nY;
  int col;
  Block(int nXco, int nYco, int nW, int nH, int c)
  {
    nX = nXco;
    nY = nYco;
    nWidth = nW;
    nHeight = nH;
    col = c;
  }
  void draw()
  {
    fill(col);
    stroke(col);
    rect(nX,nY,nWidth,nHeight);
  }
}
class BlockArray
{
  Block [][] blockArray;
  BlockArray(int rows, int cols, int nMouseX, int nMouseY)
  {
    int nY = 0;
    boolean bIsWhite = false;
    double dR = rows;
    double dC = cols;
    double dBeforeMouseX = nMouseX/250.0;
    double dAfterMouseX = (500-nMouseX)/250.0;
    double dBeforeMouseY = nMouseY/250.0;
    double dAfterMouseY = (500-nMouseY)/250.0;
    blockArray = new Block[rows][cols];
    for(int nR = 0; nR < blockArray.length;nR++)
    {
      int nHeight = (int)((825/dR) *Math.sin(nR/dR * Math.PI));
      if(nY < nMouseY)
        nHeight = (int)(nHeight * dBeforeMouseY);
      else
        nHeight = (int)(nHeight * dAfterMouseY);
      int nX = 0;
      bIsWhite = ! bIsWhite;
      for(int nC = 0; nC < blockArray[0].length; nC++)
      {
        int nWidth = (int)((825/dC) *Math.sin(nC/dC* Math.PI));
        if(nX < nMouseX)
          nWidth = (int)(nWidth * dBeforeMouseX);
        else
          nWidth = (int)(nWidth * dAfterMouseX);
        bIsWhite = ! bIsWhite;
        if(bIsWhite)
          blockArray[nR][nC] = new Block(nX,nY,nWidth,nHeight,255);
        else
          blockArray[nR][nC] = new Block(nX,nY,nWidth,nHeight,0);

        nX+=nWidth;

      }
      nX = 0;
      nY+=nHeight;
    }
  }
  void draw()
  {
    for(int nR = 0; nR < blockArray.length;nR++)
      for(int nC = 0; nC < blockArray[0].length; nC++)
        blockArray[nR][nC].draw();
  }	  
}



