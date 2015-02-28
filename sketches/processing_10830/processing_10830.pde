

static int BOARD_WIDTH = 15;
static int BOARD_HEIGH = 9;
static int BOX_WIDTH = 20;
static int BOX_HEIGH = 20;
color[] colors = { color(10,20,30), 
                   color(34,139,34),
                   color(20,98,122),
                   color(100,19,80),
                   color(200,1,34),
                   color(250,250,60) };

int[] board = new int[BOARD_WIDTH * BOARD_HEIGH];
int colorIdx = 0;
int countMoves = 0;

void setup()
{
//initialize board
//size(BOX_WIDTH * BOARD_WIDTH, BOX_HEIGH * BOARD_HEIGH + 40);
size(300, 220); // just for the export. i dont want to touch the html ;)


for (int i = 0;  i < BOARD_WIDTH * BOARD_HEIGH; i++)
 board[i] = int(random(colors.length));

drawBoard();
drawLegend();
//queedFF(0, color(20,40,43));

}


void drawBoard()
{
  for (int i = 0;  i < BOARD_WIDTH * BOARD_HEIGH; i++)
  {
    int y = i / BOARD_WIDTH;
    int x = i - (y * BOARD_WIDTH);
    
    fill (color ( colors[board[i]]));
    noStroke();
    rect(x*BOX_HEIGH, y*BOX_WIDTH, BOX_HEIGH, BOX_WIDTH);
  }
}

/**
 * Queed flood fill 
 * Receivs a position in the board and a new color 
 */
void queedFF(int i, int myColor)
{

  if (board[i] == myColor) return;
  
   
  int cellQueue[] = new int[BOX_WIDTH * BOX_HEIGH];
  int cellQueueSize = 0;
  int oldColor = board[i];
  
  board[i]=myColor;
  countMoves++;
  
  cellQueue[0] = i;
  cellQueueSize = 1;
   
  while (cellQueueSize > 0) {
 
   int y = cellQueue[0] / BOARD_WIDTH;
   int x = cellQueue[0] - (y * BOARD_WIDTH);
     
   cellQueueSize--;
   cellQueue[0] = cellQueue[cellQueueSize];
   
   
   
   if ( x-1 >= 0 ) { // W
     if (board[x-1+(y*BOARD_WIDTH)] == oldColor ) // i-1
     {
       board[x-1+(y*BOARD_WIDTH)] = myColor;
       cellQueue[cellQueueSize]=x-1+(y*BOARD_WIDTH);
       cellQueueSize++;
     }
   }
   
   
   
   if ( y-1 >= 0 ) { // N
    if (board[x+((y-1)*BOARD_WIDTH)] == oldColor ) // i - BOARD_WIDTH
     {
       board[x+((y-1)*BOARD_WIDTH)] = myColor;
       cellQueue[cellQueueSize]=x+((y-1)*BOARD_WIDTH);
       cellQueueSize++;
     }
   }
   
   
   if ( x+1 < BOARD_WIDTH ) { // E
     if (board[x+1+(y*BOARD_WIDTH)] == oldColor ) // i-1
     {
       board[x+1+(y*BOARD_WIDTH)] = myColor;
       cellQueue[cellQueueSize]=x+1+(y*BOARD_WIDTH);
       cellQueueSize++;
     }
   }
 
   if ( y+1 < BOARD_HEIGH ) { // S
    if (board[x+((y+1)*BOARD_WIDTH)] == oldColor ) // i - BOARD_WIDTH
     {
       board[x+((y+1)*BOARD_WIDTH)] = myColor;
       cellQueue[cellQueueSize]=x+((y+1)*BOARD_WIDTH);
       cellQueueSize++;
     }
   }
 
   
  } // While

//drawBoard();
}


boolean checkWin()
{
  for (int i = 0;  i < BOARD_WIDTH * BOARD_HEIGH; i++)
  {
    if (board[i] != board[0]) return false; 
  }
  
  return true;

}

void markCell(int x, int y)
{
              
               fill (color(255,255,255));
               noStroke();
               ellipseMode(CENTER);
               ellipse(((x+1)*BOX_HEIGH)-BOX_HEIGH/2, ((y+1)*BOX_WIDTH)-BOX_WIDTH/2, 10, 10);

}

void drawLegend()
{
  int sep =  (BOARD_WIDTH * BOX_WIDTH) / ((colors.length * 2) +1)  ;
  int space = sep;
  
    fill ( 255,255,255);
    rect(0, (BOARD_HEIGH*BOX_HEIGH), (BOARD_WIDTH*BOX_WIDTH), (BOARD_HEIGH*BOX_HEIGH)+40);
 
  if (checkWin())
  {
   
   PFont myFont = createFont("FFScala", 20);
   textFont(myFont);
   fill ( 0,0,0);
   textAlign(CENTER);
   text("You win in "+ countMoves +" moves", (BOARD_WIDTH*BOX_WIDTH)/2, BOARD_HEIGH*BOX_HEIGH + 25);
   myFont = createFont("FFScala", 15);
   textFont(myFont);
   text("Press enter...", (BOARD_WIDTH*BOX_WIDTH)/2, BOARD_HEIGH*BOX_HEIGH +38);
  
  } else {  
  
  for (int i=0; i!=colors.length; i++)
  {
     
     if (colorIdx==i) { 
      fill ( 100,100,100);
     rect( space + (i * BOX_WIDTH)-5, (BOARD_HEIGH*BOX_HEIGH)+5, BOX_WIDTH+10, BOX_HEIGH+10);
     }
      fill (color (colors[i]));
    rect( space + (i * BOX_WIDTH), (BOARD_HEIGH*BOX_HEIGH)+10, BOX_WIDTH, BOX_HEIGH);  
    space += sep;   
  }
  }

}


void draw()
{
}


void keyPressed(){
  
  if (key == '1') {
     queedFF(0, 0 );
    
  } else 
    if (key == '2') {
       queedFF(0, 1 ); 
     
  }
  else 
    if (key == '3') {
       queedFF(0, 2 );
  }
  else 
    if (key == '4') {
       queedFF(0, 3 );
  }
   else 
    if (key == '5') {
       queedFF(0, 4 );
  }
   else 
    if (key == '6') {
       queedFF(0, 5 );
  }
   else 
    if (key ==  ENTER) {
      
  if (checkWin())
  {
    setup();
    countMoves=0;
   }
   else {
   queedFF(0, colorIdx );
   }
  }
  else 
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (colorIdx==0)  {
           colorIdx=colors.length-1;
      } else { colorIdx--; } 
          
  }
           
    
     
    if (keyCode == RIGHT) {
           if (colorIdx==colors.length-1)  {
           colorIdx=0;
      } else { colorIdx++; } 
          
          
    
    }
  
  }  
drawLegend();
       
drawBoard();  

}


