
//Jesse Campbell
//jcamp@gmx.com
//Wallington, NJ, USA
//Dec. 26, 2010

Boolean[][] board;
Integer[] win;
Boolean winner;
Boolean last;
int[]score = new int[3];
float theta;

void setup(){
  size(600,600);
  smooth();
  strokeWeight(5);
  board = new Boolean[3][3];
  win = new Integer[4];
  winner = null;
  last = (round(random(0,1)) == 0) ? true : false;
  textAlign(CENTER, CENTER);
  score[2]++;
}

void draw(){
  drawgrid();
  drawboard();
  drawwin();
  drawcursor();
}

void mousePressed(){
  int x = mouseX/200;
  int y = mouseY/200;
    
  if (winner != null || full() )
      setup();
  
  else if (board[x][y] == null){
    if (mouseButton == LEFT)
       if (last == false){
         board[x][y] = true;
         last = true;
       }
       else{
         board[x][y] = false;
         last = false;
       }
    findwin();
  }
}

void drawboard(){
  for (int i=0; i<3; i++)
    for (int j=0; j<3; j++)
      if (board[i][j] != null){
        if (board[i][j] == true)
          drawo(i,j);
        else if (board[i][j] == false)
          drawx(i,j);
      }
}

void drawgrid(){
  background(200);
  stroke(0);
  line(200, 0, 200, 599);
  line(400, 0, 400, 599);
  line(0, 200, 599, 200);
  line(0, 400, 599, 400);
}

void drawo(int x, int y){
  stroke(255,0,0);
  fill(0,0,0,0);
  ellipse(100+x*200,100+y*200, 180, 180);
}

void drawx(int x, int y){
  stroke(0,0,255);
  line(x*200+20,y*200+20,x*200+180,y*200+180);
  line(x*200+180,y*200+20,x*200+20,y*200+180);
}

void findwin(){
  for (int i=0; i<3; i++){
    if (board[i][0] != null && board[i][1] != null && board[i][2] != null)
      if (board[i][0] == board[i][1] && board[i][0] == board[i][2])
        setwin(100+200*i, 0, 100+200*i, 599, board[i][0]);
  
    if (board[0][i] != null && board[1][i] != null && board[2][i] != null)
      if (board[0][i] == board[1][i] && board[0][i] == board[2][i])
        setwin(0, 100+200*i, 599, 100+200*i, board[0][i]);
  }
  
  if (board[0][0] != null && board[1][1] != null && board[2][2] != null)
    if (board[0][0] == board[1][1] && board[0][0] == board[2][2])
      setwin(0, 0, 599, 599, board[0][0]);

  if (board[0][2] != null && board[1][1] != null && board[2][0] != null)  
    if (board[0][2] == board[1][1] && board[0][2] == board[2][0])
      setwin(0, 599, 599, 0, board[1][1]);
}

void setwin(int a, int b, int c, int d, Boolean w){
   win[0] = a; win[1] = b; win[2] = c; win[3] = d; winner = w;
   if (w == false)
     score[0]++;
   else if (w == true)
     score[1]++;
 }

void drawwin(){ 
  if (win[0] != null || full()){
    stroke(100,200,0);
    if (win[0] !=null)
      line(win[0], win[1], win[2], win[3]);
    writewinner();
  }
}

void writewinner(){
    String s;
    PFont font = loadFont("JasmineUPCBold-48.vlw");
    textFont(font, 96);
    if (winner != null){
      if (winner == false)
        s = "X wins";
      else
        s = "O wins";
    }
    else
      s = "Stalemate!";
    noStroke();
    fill(255,200);
    rect(0,0,599,599);
    shadowtext(s, width/2, height/2, 3);
    textFont(font, 24);
    shadowtext("Click to play again", width/2, height*.2, 1);
    shadowtext("Games played: " + score[2] + "\nX: " + score[0] + ", O: " + score[1] + ", Tie: " + (score[2]-score[1]-score[0]), width/2, height*.90, 1);
}

void shadowtext (String s, float x, float y, int o){
    fill(100,100);
    text(s, x+o, y+o);
    fill(0);
    text(s, x, y);
}

void drawcursor(){
  if (board[mouseX/200][mouseY/200] == null && winner==null)
    if (last == false)
      drawo(mouseX/200, mouseY/200);
    else
      drawx(mouseX/200, mouseY/200);
}

boolean full(){
  boolean full = true;
  for (int i=0; i<3; i++)
    for (int j=0; j<3; j++)
      if (board[i][j] == null)
        full = false;
  return full;
}

