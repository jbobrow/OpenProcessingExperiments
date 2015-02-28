
int birthCondition = 3;                 // default 3
int lonelyCondition = 1;                // default 1 
int overpopCondition = 4;               // default 4 


int sizeX = 800;
int sizeY = 800;
int numRow = 40;
int numCol = 40;
int iterationLimit = 3;
  
int sizeRow = sizeY/numRow;
int sizeCol = sizeX/numCol;

cell[][] myCell;

boolean GameOfLife;
void setup()
{
  size(sizeX,sizeY);
  stroke(255);
  background(0);
  frameRate(10);
  GameOfLife = false;
  
  myCell = new cell[numRow][numCol];
  for (int j = 0; j < numRow; j++)
  {
    for (int i = 0; i < numCol;i++)
    {
      myCell[j][i] = new cell();
    }
  }
  
}

void createGrid()
{  
  stroke(0,255,0);
  strokeWeight(1);
  for (int i = 0; i < numCol ;i++)
  line((sizeCol*(i+1)),0,(sizeCol*(i+1)),sizeY);
  
  for (int i = 0; i < numRow; i++)
  line(0,(sizeRow*(i+1)),sizeX,(sizeRow*(i+1)));
}

void draw()
{
  
  if (GameOfLife)
  {
    sayHello();
    decide();
    execute();
  }
  createGrid();
}
 
void keyPressed()
{
  if (key == 'p')
  {
    GameOfLife = !GameOfLife;
  }
}
 
void mouseReleased()
{
  int Rindex = mouseY/sizeRow;
  int Cindex = mouseX/sizeCol;
  
  myCell[Rindex][Cindex].Row = Rindex;
  myCell[Rindex][Cindex].Col = Cindex;
  myCell[Rindex][Cindex].iteration = 0;
  myCell[Rindex][Cindex].birth = true;
  myCell[Rindex][Cindex].death = false;
  paintWhite(Rindex,Cindex);
}

void paintWhite(int r, int c)
{
  fill(123,234,170);
  rect((c*sizeCol),(r*sizeRow),sizeCol,sizeRow);
}

void paintRed(int r, int c)
{
  fill(255,0,0);
  rect((c*sizeCol),(r*sizeRow),sizeCol,sizeRow);
}  

void paintBlack(int r, int c)
{
  fill(0);
  rect((c*sizeCol),(r*sizeRow),sizeCol,sizeRow);
}  

class cell
{
  public
  int Row,Col;
  int neighbours;
  int iteration;
  boolean birth,death;
  
  cell()
  {
    Row = -1;
    Col = -1;
    neighbours = 0;
    iteration = -1;
    birth = false;
    death = false;
  }
};

void sayHello()
{
  for (int j = 0; j < numRow;j++)
  {
    for (int i = 0; i < numCol;i++)
    {
      if (myCell[j][i].birth == true)
      {
        if(j!= 0)
        {
          if (i!=0)
          myCell[j-1][i-1].neighbours++;
          
          myCell[j-1][i].neighbours++;
          
          if (i != numCol-1)
          myCell[j-1][i+1].neighbours++;
        }
        if (i !=numCol -1)
        myCell[j][i+1].neighbours++;
        
        if (i !=0)
        myCell[j][i-1].neighbours++;
        
        if (j != numRow-1)
        {
          if (i != 0)
          myCell[j+1][i-1].neighbours++;
          
          myCell[j+1][i].neighbours++;
          
          if (i != numCol-1)
          myCell[j+1][i+1].neighbours++;
        }
      }
    }
  }
}
 

void decide()
{
  for (int j=0;j<numRow;j++)
  {
    for (int i=0;i<numCol;i++)
    {
      if (myCell[j][i].iteration < 0)
      {
         if(myCell[j][i].neighbours == birthCondition)
         {
           myCell[j][i].birth = true;
           myCell[j][i].death = false;
           paintWhite(j,i);
         }
         else
         { 
           myCell[j][i].birth = false;
           myCell[j][i].death = false;
         }
       }
      else if (myCell[j][i].iteration >= 0)
      {
        if (myCell[j][i].neighbours <= lonelyCondition)
        {
          myCell[j][i].death = true;
          myCell[j][i].birth = false;
        }
        else if (myCell[j][i].neighbours >=overpopCondition )
        {
          myCell[j][i].death = true;
          myCell[j][i].birth = false;
        }
        else 
        {
          myCell[j][i].birth = false;
          myCell[j][i].death = false;
        }
      }
    }
  }
}

void execute()
{
  for (int j=0;j<numRow;j++)
  {
    for (int i=0;i<numCol;i++)
    {
      if (myCell[j][i].birth == true)
      {
        myCell[j][i].iteration = 0;
      }
      else if (myCell[j][i].death == true)
      {
        myCell[j][i].iteration = -1;
        paintBlack(j,i);
        sayBye(j,i);
      }
    }
  }
}

void sayBye(int j,int i)
{ 
  if(j!= 0)
  {
    if (i!=0)
    myCell[j-1][i-1].neighbours--;
    
    myCell[j-1][i].neighbours--;
        
    if (i != numCol-1)
    myCell[j-1][i+1].neighbours--;
    
  }
  
  if (i !=numCol -1)
  myCell[j][i+1].neighbours--;
  
  if (i !=0)
  myCell[j][i-1].neighbours--;
  
  if (j != numRow-1)
  {
    if (i != 0)
    myCell[j+1][i-1].neighbours--;
     
    myCell[j+1][i].neighbours--;
    
    if (i != numCol-1)
    myCell[j+1][i+1].neighbours--;
  }
}

  

