
int size_of_board = 10; //Width and Height of board
int[][] board = new int[size_of_board][size_of_board];
int[][] tempBoard;
boolean drawPieces =true;
int size_of_squares;
String turn = "black";
int doneChecker=0;

//DETERMINES WHICH WAY THE PLAYER HAS TO MOVE 0=TOP LEFT, 1 =TOP RIGHT , 2=BOTTOM LEFT , 3=BOTTOM RIGHT
int black_rules=0;
int white_rules=3;

void setup()
{
  size(600,600); 
  drawBoardAndBackground();
  setStaringPieces();
  ellipseMode(CORNER);
  smooth();
}

void startOver()
{
    size_of_board+=10;
    board = new int[size_of_board][size_of_board];
    drawBoardAndBackground();
    setStaringPieces();

}

void drawBoardAndBackground()
{
  size_of_squares = floor(width/size_of_board);
  int length_of_board = size_of_squares * size_of_board;
  fill(0,115,0);
  rect(0,0,width,height);
  
  for(int y=0;y<=length_of_board;y+=size_of_squares) //Horizontal Lines
  line(0,y,length_of_board,y);
  
  for(int x=0;x<=length_of_board;x+=size_of_squares) //Vertical Lines
  line(x,0,x,length_of_board);
}

void setStaringPieces()
{
  int TL = size_of_board/2 -1; //Top Left Starting Square
  board[TL][TL]=1;
  board[TL+1][TL]=2;
  board[TL][TL+1]=2;
  board[TL+1][TL+1]=1;
}

void draw()
{
  
  if(drawPieces)
  {
    for(int x=0;x<board.length;x++)
      for(int y=0;y<board[0].length;y++)
        if(board[x][y] == 1) //White
        {
          fill(255,255,255);
          ellipse(x*size_of_squares+2,y*size_of_squares+2,size_of_squares-4,size_of_squares-4);
        //  rect(x*size_of_squares,y*size_of_squares,size_of_squares,size_of_squares);
        }
        else if(board[x][y]==2) //Black
        {
          fill(0,0,0);
          ellipse(x*size_of_squares+2,y*size_of_squares+2,size_of_squares-4,size_of_squares-4);
         // rect(x*size_of_squares,y*size_of_squares,size_of_squares,size_of_squares);
        }
        /*else if(board[x][y]==3) //Can Play Here
        {
         fill(100,200,255);
         rect(x*size_of_squares,y*size_of_squares,size_of_squares,size_of_squares);
        }
        */
          
    drawPieces = false; //Don't redraw board if it doesn't need to be drawn.
  }
  nextMove();
  
}

void nextMove()
{
  int searcher_piece;
  tempBoard = new int[size_of_board][size_of_board];
  
  if(turn == "black")
  searcher_piece = 2;
  else
  searcher_piece = 1;
  
  
  for(int x=0;x<board.length;x++) //Searches board for piece to move for current player
      for(int y=0;y<board[0].length;y++)
        if(board[x][y] != 1 && board[x][y] !=2) //Don't look at places that already have a square
          if(searchForNeighbors(x,y,searcher_piece)) //Only look at places that have neighbors
            if(canMoveThere(x,y,searcher_piece)) //Only places that the player can actually move
             {
              tempBoard[x][y]=3;
             }
  
  findCorrectMove(searcher_piece); //Finds and MAKES correct move
           
           
  
  drawPieces=true;
  if(turn == "black") //Switch turns
    turn = "white";
   else
     turn ="black";
}

boolean searchForNeighbors(int x,int y,int searcher_piece)
{
   int looking_for;
  
  if(searcher_piece%2==0)
    looking_for = 1;
   else
    looking_for = 2;
    
 
  if(x-1>=0) //LEFT
    if(board[x-1][y]==looking_for)
      return true;
      
  if(x+1<board.length) //RIGHT
    if(board[x+1][y]==looking_for)
      return true;
      
   if(y+1<board.length) //DOWN
    if(board[x][y+1]==looking_for)
      return true;
      
   if(y-1>=0) //UP
    if(board[x][y-1]==looking_for)
      return true;
      
   if(x-1>=0 && y-1>=0) //LEFTUP
    if(board[x-1][y-1]==looking_for)
      return true;
      
   if(x-1>=0 && y+1<board.length) //LEFTDOWN
    if(board[x-1][y+1]==looking_for)
      return true;
      
   if(x+1<board.length && y-1>=0) //RIGHTUP
    if(board[x+1][y-1]==looking_for)
      return true;
      
   if(x+1<board.length && y+1<board.length) //RIGHTDOWN
    if(board[x+1][y+1]==looking_for)
      return true;
      
      return false;
}

boolean canMoveThere(int x,int y,int searcher_piece)
{  
  int looking_for;
  
  if(searcher_piece%2==0)
    looking_for = 1;
   else
    looking_for = 2;
  
  if(x-1>=0) //LEFT
    if(board[x-1][y]==looking_for)
      {
        int left = 2;
        while(x-left>=0)
        {
          if(board[x-left][y]==searcher_piece)
            return true;
        
          if(board[x-left][y]==0)
            break;
            
           left++;
        }
      }
      
  if(x+1<board.length) //Right
    if(board[x+1][y]==looking_for)
      {
        int right = 2;
        while(x+right<board.length)
        {
          if(board[x+right][y]==searcher_piece)
            return true;
        
          if(board[x+right][y]==0)
            break;
            
           right++;
        }
      }
  
  if(y+1<board.length) //Down
    if(board[x][y+1]==looking_for)
      {
        int down = 2;
        while(y+down<board.length)
        {
          if(board[x][y+down]==searcher_piece)
            return true;
        
          if(board[x][y+down]==0)
            break;
            
           down++;
        }
      }      
      
   if(y-1>=0) //UP
    if(board[x][y-1]==looking_for)
      {
        int up = 2;
        while(y-up>=0)
        {
          if(board[x][y-up]==searcher_piece)
            return true;
        
          if(board[x][y-up]==0)
            break;
            
           up++;
        }
      }
      
   if(x-1>=0 && y-1>=0) //LEFT AND UP
    if(board[x-1][y-1]==looking_for)
      {
        int leftAndUp = 2;
        while(x-leftAndUp>=0 && y-leftAndUp>=0)
        {
          if(board[x-leftAndUp][y-leftAndUp]==searcher_piece)
            return true;
        
          if(board[x-leftAndUp][y-leftAndUp]==0)
            break;
            
           leftAndUp++;
        }
      }
      
   if(x-1>=0 && y+1<board.length) //LEFT AND DOWN
    if(board[x-1][y+1]==looking_for)
      {
        int leftAndDown = 2;
        while(x-leftAndDown>=0 && y+leftAndDown<board.length)
        {
          if(board[x-leftAndDown][y+leftAndDown]==searcher_piece)
            return true;
        
          if(board[x-leftAndDown][y+leftAndDown]==0)
            break;
            
           leftAndDown++;
        }
      }   
      
   if(x+1<board.length && y-1>=0) //RIGHT AND UP
    if(board[x+1][y-1]==looking_for)
      {
        int rightAndUp = 2;
        while(x+rightAndUp<board.length && y-rightAndUp>=0)
        {
          if(board[x+rightAndUp][y-rightAndUp]==searcher_piece)
            return true;
        
          if(board[x+rightAndUp][y-rightAndUp]==0)
            break;
            
           rightAndUp++;
        }
      }
      
    if(x+1<board.length && y+1<board.length) //RIGHT AND DOWN
    if(board[x+1][y+1]==looking_for)
      {
        int rightAndDown = 2;
        while(x+rightAndDown<board.length && y+rightAndDown<board.length)
        {
          if(board[x+rightAndDown][y+rightAndDown]==searcher_piece)
            return true;
        
          if(board[x+rightAndDown][y+rightAndDown]==0)
            break;
            
           rightAndDown++;
        }
      }
      
      return false;
}


void findCorrectMove(int searcher_piece)
{
  //2 is black , 1 is white
  int ruleSet;
  
  if(searcher_piece == 2)
    ruleSet = black_rules;
  else
    ruleSet = white_rules;
    
  int correct_x=-1;
  int correct_y=-1;
  
  switch(ruleSet){//DETERMINES WHICH WAY THE PLAYER HAS TO MOVE 0=TOP LEFT, 1 =TOP RIGHT , 2=BOTTOM LEFT , 3=BOTTOM RIGHT
   case 0: //TOP LEFT
    outerloop:
    for(int y=0;y<board[0].length;y++)  
     for(int x=0;x<board.length;x++)
       if(tempBoard[x][y]==3)
         {
          correct_x =x;
          correct_y =y;
          break outerloop; 
         }
     break;
   case 1: //TOP RIGHT
   outerloop:
    for(int y=0;y<board[0].length;y++)  
     for(int x=board.length-1;x>=0;x--)
       if(tempBoard[x][y]==3)
         {
          correct_x =x;
          correct_y =y;
          break outerloop; 
         }
     break;
   case 2: //BOTTOM LEFT
    outerloop:
    for(int y=board[0].length-1;y>=0;y--)
     for(int x=0;x<board.length;x++)
       if(tempBoard[x][y]==3)
         {
          correct_x =x;
          correct_y =y;
          break outerloop; 
         }
     break;
   case 3: //BOTTOM RIGHT
    outerloop:
    for(int y=board[0].length-1;y>=0;y--)
     for(int x=board.length-1;x>=0;x--)
       if(tempBoard[x][y]==3)
         {
          correct_x =x;
          correct_y =y;
          break outerloop; 
         }
     break;   
  }
  
  if(correct_x>=0)
  {
  makeCorrectMove(correct_x,correct_y,searcher_piece); 
  doneChecker=0;
  }
  else if(doneChecker++ == 2)
  {
  startOver();
  /* Determine the winnner
  int black =0;
  int white=0;
  for(int y=board[0].length-1;y>=0;y--)
     for(int x=board.length-1;x>=0;x--)
     if(board[x][y]==1)
       white++;
       else if(board[x][y]==2)
       black++;
       
    println("white:" +white);
    println("black:" +black);
    */
  }
}

void makeCorrectMove(int correct_x,int correct_y,int searcher_piece)
{
  board[correct_x][correct_y] = searcher_piece;//Puts the piece down.  
  
  int looking_for;
  int x=correct_x;
  int y=correct_y;
  
  if(searcher_piece%2==0)
    looking_for = 1;
   else
    looking_for = 2;
  
  if(x-1>=0) //LEFT
    if(board[x-1][y]==looking_for)
      {
        int left = 2;
        while(x-left>=0)
        {
          if(board[x-left][y]==searcher_piece)
          {
            left--;
            while(left>0)
            {
             board[x-left][y]=searcher_piece;
             left--; 
            }
            break;
          }
        
          if(board[x-left][y]==0)
            break;
            
           left++;
        }
      }
  
  if(x+1<board.length) //Right
    if(board[x+1][y]==looking_for)
      {
        int right = 2;
        while(x+right<board.length)
        {
          if(board[x+right][y]==searcher_piece)
           {
            right--;
            while(right>0)
            {
             board[x+right][y]=searcher_piece;
             right--; 
            }
            break;
           }
        
          if(board[x+right][y]==0)
            break;
            
           right++;
        }
      }
  
  if(y+1<board.length) //Down
    if(board[x][y+1]==looking_for)
      {
        int down = 2;
        while(y+down<board.length)
        {
          if(board[x][y+down]==searcher_piece)
            {
            down--;
            while(down>0)
            {
             board[x][y+down]=searcher_piece;
             down--; 
            }
            break;
           }
        
          if(board[x][y+down]==0)
            break;
            
           down++;
        }
      }      
      
   if(y-1>=0) //UP
    if(board[x][y-1]==looking_for)
      {
        int up = 2;
        while(y-up>=0)
        {
          if(board[x][y-up]==searcher_piece)
           {
            up--;
            while(up>0)
            {
             board[x][y-up]=searcher_piece;
             up--; 
            }
            break;
           }
        
          if(board[x][y-up]==0)
            break;
            
           up++;
        }
      }
      
   if(x-1>=0 && y-1>=0) //LEFT AND UP
    if(board[x-1][y-1]==looking_for)
      {
        int leftAndUp = 2;
        while(x-leftAndUp>=0 && y-leftAndUp>=0)
        {
          if(board[x-leftAndUp][y-leftAndUp]==searcher_piece)
           {
            leftAndUp--;
            while(leftAndUp>0)
            {
             board[x-leftAndUp][y-leftAndUp]=searcher_piece;
             leftAndUp--; 
            }
            break;
           }
        
          if(board[x-leftAndUp][y-leftAndUp]==0)
            break;
            
           leftAndUp++;
        }
      }
      
   if(x-1>=0 && y+1<board.length) //LEFT AND DOWN
    if(board[x-1][y+1]==looking_for)
      {
        int leftAndDown = 2;
        while(x-leftAndDown>=0 && y+leftAndDown<board.length)
        {
          if(board[x-leftAndDown][y+leftAndDown]==searcher_piece)
           {
            leftAndDown--;
            while(leftAndDown>0)
            {
             board[x-leftAndDown][y+leftAndDown]=searcher_piece;
             leftAndDown--; 
            }
            break;
           }
        
          if(board[x-leftAndDown][y+leftAndDown]==0)
            break;
            
           leftAndDown++;
        }
      }   
      
   if(x+1<board.length && y-1>=0) //RIGHT AND UP
    if(board[x+1][y-1]==looking_for)
      {
        int rightAndUp = 2;
        while(x+rightAndUp<board.length && y-rightAndUp>=0)
        {
          if(board[x+rightAndUp][y-rightAndUp]==searcher_piece)
           {
            rightAndUp--;
            while(rightAndUp>0)
            {
             board[x+rightAndUp][y-rightAndUp]=searcher_piece;
             rightAndUp--; 
            }
            break;
           }
        
          if(board[x+rightAndUp][y-rightAndUp]==0)
            break;
            
           rightAndUp++;
        }
      }
      
    if(x+1<board.length && y+1<board.length) //RIGHT AND DOWN
    if(board[x+1][y+1]==looking_for)
      {
        int rightAndDown = 2;
        while(x+rightAndDown<board.length && y+rightAndDown<board.length)
        {
          if(board[x+rightAndDown][y+rightAndDown]==searcher_piece)
           {
            rightAndDown--;
            while(rightAndDown>0)
            {
             board[x+rightAndDown][y+rightAndDown]=searcher_piece;
             rightAndDown--; 
            }
            break;
           }
        
          if(board[x+rightAndDown][y+rightAndDown]==0)
            break;
            
           rightAndDown++;
        }
      }
            
}



