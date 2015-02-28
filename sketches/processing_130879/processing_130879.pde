
/* 2 Player connect four game with win detection for procressing.
Controllable with the keyboard arrow keys.
Orginal connect four coins used.
By Jan Stapler (DotAku) */
int waitforkey=0;
int roundend = 0;                // if 1 round is over
int a,b = 0;                     // for loop
int winner = 0;                  // changes when someone won
 
int cols = 7;                   // columns and row count
int rows = 6;
 
int[][] grid = new int[100][100];  //2D array for win detection
PImage img,img2;                   //red and yellow coin images
 
//ints most of them used for possitions
int rx,ry,x,y,yx,yy,r1,r2,r3,r4,r5,r6,r7,fall,lx,ly,round,resetpressed;
 
 
void setup() {
   
   
  //initiated 2D array
  for (int a = 0; a < cols; a++) {
  for (int b = 0; b < rows; b++) {
    grid[a][b] = 21;
  }
}
    
  round =1;
  r1= 1;
  r2= 1;
  r3= 1;
  r4= 1;
  r5= 1;
  r6 = 1;
  r7 = 1;
  lx = 1;
  ly = 1;
  size(350, 450);
  ry=25;
  rx=25;
  yx=25;
  yy=25;
  x=5;
  y=5;
  noStroke();
  fill(176,240,240);
  rect(0,0,400,600);
  fill(129,60,27);
  rect(0,150,350,350,0);
    
  for(y=5;y<450;y+=50)
  {
   for(x=5;x<450;x+=50)
   {
   fill(176,240,240);
   rect(x,y,40,40);
   }
  }
}
 
 
//resets game if 'R' is pressed
void resetthegame(){ 
  if (keyPressed) {
    if (key == 'r' || key == 'R' )
  {
  resetpressed = 1;
  }
  }
if (resetpressed == 1)
{
  roundend = 0;
  winner = 0;
  round =1;
  r1= 1;
  r2= 1;
  r3= 1;
  r4= 1;
  r5= 1;
  r6 = 1;
  r7 = 1;
 
  size(350, 450);
  ry=25;
  rx=25;
  yx=25;
  yy=25;
  x=5;
  y=5;
  noStroke();
  fill(176,240,240);
  rect(0,0,400,600);
  fill(129,60,27);
  rect(0,150,350,350,0);
    
  for(y=5;y<450;y+=50)
  {
   for(x=5;x<450;x+=50)
   {
   fill(176,240,240);
   rect(x,y,40,40);
   }
  }
    for (int a = 0; a < 10; a++) {
    for (int b = 0; b < 10; b++) {
    grid[a][b] = 21;
  }
}
  resetpressed = 0;
}
};
 
 
//win detection. checks if 4 coins of the same coler are connected
void checkWin()
{
  //horizontal check
  for (a=0; a < 7;a++){
    for (b = 0; b<7;b++){
        int Check = (grid[b][a]) + (grid[b+1][a]) + (grid[b+2][a]) + (grid[b+3][a]);
        if (Check == 20 || Check == 4)
        {
          winner = 1;
           lx = a*50+25;
          ly = b*50+25;
        }
    }
  }
   
  //vertical check
    for (a=0; a < 7;a++){
    for (b = 0; b<8;b++){
        int Check = (grid[b][a]) + (grid[b][a+1]) + (grid[b][a+2]) + (grid[b][a+3]);
        if (Check == 20 || Check == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
    }
  }
   
  // diagonal check
  for (int a =0; a < 7-3; a++) {
      for (int b=0; b < 7-3; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a+1]) + (grid[b+2][a+2]) + (grid[b+3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
  
    for (int a=0; a < 7-3; a++) {
      for (int b=3; b < 7; b++) {
        int tCheck = (grid[b][a]) + (grid[b-1][a+1]) + (grid[b-2][a+2]) + (grid[b-3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
        }
      }
    }
   
  for (int a=0; a < 7-3; a++) {
      for (int b=0; b < 7-3; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a+1]) + (grid[b+2][a+2]) + (grid[b+3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
        }
      }
    }
 
};
 
// executed at the begin of every round
void beginround(){
  ry= 75;
  yy= 75;
  fall=0;
       
if (keyPressed) {
   
  // resets game if 'R' is pressed
  if (key == 'r' || key == 'R' )
  {
   resetpressed = 1;
  }
    
    //if right key is pressed moves coin to the right
    if (key == CODED && keyCode == RIGHT) {
    rx+=50;
    yx+=50;
    while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
  }
  
    //if left key is pressed moves coin to the left
    if (key == CODED && keyCode == LEFT) {
    rx-=50;
    yx-=50;
       while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
   }
     
    //makes coin drop if down is pressend
    if (key == CODED && keyCode == DOWN) {
     fall = 1;
    }
}
 // overrides old coin frame
 for(y=55;y<100;y+=50)
  {
   for(x=5;x<450;x+=50)
   {
   fill(176,240,240);
   rect(x,y,40,40);
   }
  }
};
 
//loades and places red coin image
void redcoin(){
  fill(193,2,2);
  ellipse(rx,ry,40,40);
};
 
//loades and places yellow coin image
void yellowcoin(){
  fill(245,250,13);
  ellipse(rx,ry,40,40);
};
 
 
 
 
void draw() {
 
  beginround();
  textSize(20);             
  fill(0);                       
  text("Control with arrow keys \n     Press 'R' to reset",60,20);
 
  if (winner == 1 && roundend == 0)
 {
   roundend = 1;
     
   textSize(45);
 
   if(round%2 == 0)
   {
     text("Red Wins!",3,130);
     roundend = 1;
   }
   
   if(round%2 == 1)
  {
     text("Yellow Wins!",3,130);
     roundend = 1;
  }
    
 }
    //when coin is droped
    if (fall == 1){
         
       
      if (rx == 25)
      {
        ry = 475-50*r1;
        yy = ry;
        //adds valure to 2D arry for in detection
        //adds 1 if yellow if red
        if(round%2 == 1) grid[1][r1] = 1;
        if(round%2 == 0) grid[1][r1] = 5;
        r1++;                      //increases row in this column
           while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
        round++;
      }
         
                 
      if (rx == 75)
      {
        ry = 475-50*r2;
        yy = ry;
        if(round%2 == 1) grid[2][r2] = 1;
        if(round%2 == 0) grid[2][r2] = 5;
        r2++;
           while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
        round++;
      }
       
      if (rx == 125)
      {
        ry = 475-50*r3;
        yy = ry;
        if(round%2 == 1) grid[3][r3] = 1;
        if(round%2 == 0) grid[3][r3] = 5;
        r3++;
           while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
        round++;
      }
  
      if (rx == 175)
      {
        ry = 475-50*r4;
        yy = ry;
        if(round%2 == 1) grid[4][r4] = 1;
        if(round%2 == 0) grid[4][r4] = 5;
        r4++;
           while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
        round++;
      }
       
 
      if (rx == 225)
      {
        ry = 475-50*r5;
        yy = ry;
        if(round%2 == 1) grid[5][r5] = 1;
        if(round%2 == 0) grid[5][r5] = 5;
        r5++;
           while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
        round++;
      }
       
      if (rx == 275)
      {
        ry = 475-50*r6;
        yy = ry;
        if(round%2 == 1) grid[6][r6] = 1;
        if(round%2 == 0) grid[6][r6] = 5;
        r6++;
           while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
        round++;
      }
 
      if (rx == 325)
      {
        ry = 475-50*r7;
        yy = ry;
        if(round%2 == 1) grid[7][r7] = 1;
        if(round%2 == 0) grid[7][r7] = 5;
        r7++;
           while(waitforkey < 100000000) waitforkey++;
   waitforkey = 0;
        round++;
      } 
 }      
   
   
  //decides if red or yellow coin will drop        
  if(round%2 == 1)
 {
  redcoin();
 if (fall == 1) yellowcoin();
 }
 
  if(round%2 == 0)
 {
  yellowcoin();
  if (fall == 1) redcoin();
 }
  
resetthegame();          //resets game if 'R'is pressed
checkWin();       // checks if someone and who won
}


