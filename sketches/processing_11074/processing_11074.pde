


int cellsize = 5;
int cols, rows, life1, life2, abs1, abs2;
float wk1=0.01;
float wk2=0.01;


int[][][] old_board, new_board, neigh;

void setup()
{
  size(700, 350);
  cols = width/cellsize;
  rows = height/cellsize;
  life1=100;
  life2=100;
  old_board = new int[cols][rows][3];
  new_board = new int[cols][rows][3];
  //0: hauptboard
// 1: boolean culture1
// 2: boolean culture2


  
  colorMode(RGB,255,255,255,100);
  background(111,111,111);
  initBoard();
  frameRate(25);
}

void draw()
{
  fill(255,255,255);
  rectMode(CORNER);
  rect(0,0,width, height);
  check();
  culture();
  render();
  swap();
}

void initBoard() {
  int x1 =round(random(0,cols));
  int y1 =round(random(0,rows));
  int x2 =round(random(0,cols));
  int y2 =round(random(0,rows));
  
  old_board[x1][y1][0] = 1;
  old_board[x1][y1][1] = 1;
  old_board[x2][y2][0] = 2;
  old_board[x2][y2][2] = 1;
  
}
  
void swap() {
   int[][][] tmp = old_board;
  old_board = new_board;
  new_board = new int[cols][rows][3];
  }


void culture() {
  for (int x = 0; x < cols;x++) {
    for (int y = 0; y < rows;y++) {

      if (old_board[x][y][1]==0 && old_board[x][y][2]==0){
      new_board[x][y][0]=0;
    }

      if (old_board[x][y][1]>0 && old_board[x][y][2]==0){
      new_board[x][y][0]=1;
    }
  
        if (old_board[x][y][1]==0 && old_board[x][y][2]>0){
      new_board[x][y][0]=2;
          }   
          
        if (old_board[x][y][1]>0 && old_board[x][y][2]>0){
          float gewicht=(old_board[x][y][1])/(old_board[x][y][2]);
          float prob3=random(0,gewicht);
          float absall=abs1 + abs2;
          float abb1=(abs1/absall);
          println(abb1);
          if ( prob3 <abb1) {
          new_board[x][y][0]=2;
          }

          else {
            new_board[x][y][0]=1;
          }
          }   

          
    }}
  }

void render() {


  for ( int i = 0; i < cols;i++) {
    for ( int j = 0; j < rows;j++) {
      if ((new_board[i][j][0] == 1)) {
//        fill(113, 204, 233);
                fill(252,197,156);
        noStroke();
  rect(i*cellsize,j*cellsize,cellsize,cellsize);
    }
            if ((new_board[i][j][0] == 2)) {
        fill(246, 152, 142);

        noStroke();
        rect(i*cellsize,j*cellsize,cellsize,cellsize);
      }
      

  }
    } 
  }

void check() {
abs1=0;
abs2=0;
for (int x = 0; x < cols;x++) {
    for (int y = 0; y < rows;y++) {
      if (old_board[x][y][0]==1) {
      old_board[x][y][1]=1;
      abs1++;
    }}}

for (int x = 0; x < cols;x++) {
    for (int y = 0; y < rows;y++) {
      if (old_board[x][y][0]==2) {
      old_board[x][y][2]=1;
        abs2++;
    }}}
  
  //die kulturen melden ihre ansprüche an
for (int x = 0; x < cols;x++) {
    for (int y = 0; y < rows;y++) {

      for (int i=-2; i<3; i++) {       
        for (int j=-2; j<3; j++) {
          if (((x+i)>-1) && ((x+i)<cols) && ((y+j)>-1) && ((y+j)<rows)) {   
          if ((i != 0) || (j != 0)) {
           
            if (old_board[x+i][y+j][0] == 1) {      
                float prob1=random(0,1);
                if (prob1<wk1){
                  old_board[x][y][1]++;
                }               }

            if (old_board[x+i][y+j][0] == 2) {      
                float prob2=random(0,1);
                if (prob2<wk2){
                  old_board[x][y][2]++;
                } 
            }
          }}}}     
        }}
} 
      



