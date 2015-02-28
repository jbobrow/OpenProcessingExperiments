
int[][] bd= new int[5][5]; 
int[][] board = new int[5][5];
boolean dead;

int count;
void setup() {
  size(450, 450);
  newGame();
}
 
void randnum() {
  int j = (int)(random(11));
  int x = (int)(random(4));
  int y = (int)(random(4));
  while (bd[x][y] != 0) {
    x = (int)(random(4));
    y = (int)(random(4));
  }
  if (j < 9) {
    bd[x][y] = 2;  
  }
  else {
    bd[x][y] = 4;
  }
} 
 

void newGame() {
  bd = new int[5][5];
  dead = false;
  randnum();
}

void keyPressed() {
    if(keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN) {
      move();
    }
    if(count == 1) {
       randnum();
    }
}
void move() {
  count = 0;
  
  for(int r = 0; r < board.length; r++) {
   for(int c = 0; c < 4; c++) {
    board[r][c] = bd[r][c];
   }
  }
    if (keyCode == LEFT) {
      for (int i = 1; i<bd.length - 1;i++) {
        for (int j = 0; j<bd[0].length - 1;j++) {
          if ((bd[j][i] != 0 && bd[j][i-1] == 0) ||  bd[j][i] == bd[j][i-1]) {
            if (bd[j][i-1] == bd[j][i]) {
              bd[j][i-1] = bd[j][i-1] + bd[j][i];
              //bd[j][i+1] = 0;
              bd[j][i]= 0;
              count = 1;
              continue;
            }
            else  {
              bd[j][i-1] = bd[j][i];
              bd[j][i] = 0;
              count =1;
            }
          }
        }
     
      }
 
    }
    else if (keyCode == RIGHT) {
      for (int i = 0; i<bd.length - 2;i++) {
        for (int j = 0; j<bd[0].length  ;j++) {
          if (bd[j][i] != 0 && bd[j][i+1] == 0 || bd[j][i] == bd[j][i+1]) {
              
           
            if (bd[j][i+1] == bd[j][i]) {
              bd[j][i+1] = bd[j][i+1] + bd[j][i];
              //bd[j][i-1] = 0;
              bd[j][i]= 0;
              count = 1;
            }
            else {
              bd[j][i+1] = bd[j][i];
              bd[j][i] = 0;
              count = 1;
            }
          }
        }
      }
    }
    else if (keyCode == UP) {
      for (int i = 0; i<bd.length - 1 ;i++) {
        for (int j = 1; j<bd[0].length - 1 ;j++) {
          if (bd[j][i] != 0 && bd[j-1][i] == 0 || bd[j][i] == bd[j-1][i]) {
            
      
            if (bd[j-1][i] == bd[j][i]) {
              bd[j-1][i] = bd[j-1][i] + bd[j][i];
              //bd[j+1][i] = 0;
              bd[j][i]= 0;
              count = 1;
            }
            else {
              bd[j-1][i] = bd[j][i];
              bd[j][i] = 0;
              count = 1;
            }
          }
        }
      }
    }
    else if (keyCode == DOWN) {
 
      for (int i = 0; i< bd.length - 1  ;i++) {
        for (int j = 0; j<bd[0].length - 2 ;j++) {
          if (bd[j][i] != 0 && bd[j+1][i] == 0 || bd[j][i] == bd[j+1][i]) {
           
             
            if (bd[j+1][i] == bd[j][i]) {
              bd[j+1][i] = bd[j+1][i] + bd[j][i];
              //bd[j+1][i] = 0;
              bd[j][i]= 0;
              count = 1;
            }
            else {
              bd[j+1][i] = bd[j][i];
              bd[j][i] = 0;
              count = 1;
            }
          }
        }
      }
    }
     
   
}
 
 
 
 
void draw() {
  background(100);
  for (int i = 0; i < bd.length - 1; i++) {
    for (int c = 0; c < bd[0].length - 1; c++) {
      fill(200);
      int x = 10+(110)*c;
      int y = 10+(110)*i;
      textAlign(CENTER);
      rect(x, y, 100, 100);
 
 
      if (bd[i][c] == 2) {
        
        fill(255, 0, 0);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("2", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 4) {
         
        fill(0, 255, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("4", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 8) {
        fill(0, 0, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("8", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 16) {
        fill(0, 100, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("16", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 32) {
        fill(50, 0, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("32", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 64) {
        fill(255, 200, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("64", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 128) {
        fill(20, 255, 10);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("128", x+(100/2), y+(100/1.5));
      } else if (bd[i][c] == 256) {
         
        fill(#B8CB07);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("256", x+(100/2), y+(100/1.5));
      } else if (bd[i][c] == 512) {
        fill(#DDF314);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("512", x+(100/2), y+(100/1.5));
      }
    }
  }
   
  
}

