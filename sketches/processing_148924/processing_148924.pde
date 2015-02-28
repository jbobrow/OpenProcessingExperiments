
int[][] bd= new int[5][5]; 


int merged = 0;
int count;
int score;
public void setup() {
  size(450, 450);
  randnum();
  randnum();
  frameRate(20);
 // bd[0][1] = 2;
  //bd[0][2] = 2;
  //bd[0][3] = 2;
  //bd[0][3] = 16;
  //bd[1][3] = 8;
  //bd[2][3] = 8;
  //bd[1][0] = 4;
  //bd[1][3] = 4;
  
  
 
  //newGame();
}
 
public void randnum() {
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
 
 
public void gameDone() { //not being used
  
    fill(150, 0, 0, 60);
    rect(0, 0, width, height);
    textSize(20);
    text("Do you want to play again", width/2, height/2);
    if (mousePressed) {
      newGame();
    }
   
}
public void newGame() {
  bd = new int[5][5];
  //dead = false;
  //randnum();
}
public void dead() { //not being used
  int[][] dead = new int[4][4];
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 4; j++) {
        dead[i][j] = bd[i][j];
    }
  }
}
public void keyPressed() {
    if(keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN) {
      move();
    }
    if(count == 1) {
       randnum();
    }
}

public void move() {
  count = 0;
  
  if (keyCode == LEFT) {
     
      for(int i = 0; i < bd.length - 1; i++) {
        for (int j = 0; j<bd[0].length - 1;j++) {
         if(bd[i][0] == 0 && bd[i][1] != 0) {
           bd[i][0] = bd[i][1];
           bd[i][1] = 0;
           draw();
         } else if(bd[i][0] == bd[i][1]) {
           bd[i][0] *= 2;
           score = bd[i][0];
           bd[i][1] = 0;
           draw();
         }
         if(bd[i][j] == 0 && bd[i][j+1] != 0) {
            bd[i][j] = bd[i][j+1];
            bd[i][j+1]= 0;
            draw();
            j = 0;
            //println(j);
            count = 2;
          } else if (bd[i][j] == bd[i][j+1] && (bd[i][j]) * 2 != merged  ) {
            bd[i][j] *= 2;
            score = bd[i][j];
            merged = bd[i][j];
            bd[i][j+1] = 0;
            draw();
            j = 0;
            count = 2;
          }
          
        }
      }
      if(count == 2) {
        count = 1;
      }
        
 
    }
    else if (keyCode == RIGHT) {
      for(int i = 0; i < bd.length - 1; i++) {
        for (int j = 3; j > 0;j--) {
         if(bd[i][3] == 0 && bd[i][2] != 0) {
           bd[i][3] = bd[i][2];
           bd[i][2] = 0;
         } else if(bd[i][3] == bd[i][2]) {
           bd[i][3] *= 2;
           score = bd[i][3];
           bd[i][2] = 0;
         }
         if(bd[i][j] == 0 && bd[i][j-1] != 0) {
            bd[i][j] = bd[i][j-1];
            bd[i][j-1]= 0;
            draw();
            j = 3;
            //println(j);
            count = 2;
          } else if (bd[i][j] == bd[i][j-1] && (bd[i][j]) * 2 != merged  ) {
            bd[i][j] *= 2;
            merged = bd[i][j];
            bd[i][j-1] = 0;
            draw();
            j = 3;
            
            count = 2;
          }
          
        }
      }
      if(count == 2) {
        count = 1;
      }
      
    }
    else if (keyCode == UP) {
      for(int i = 0; i < bd.length - 1; i++) {
        for (int j = 0; j<bd[0].length - 1;j++) {
          //println(merged);
         if(bd[0][i] == 0 && bd[1][i] != 0) {
           bd[0][i] = bd[1][i];
           bd[1][i] = 0;
         } else if(bd[0][i] == bd[1][i]) {
           bd[0][i] *= 2;
           bd[1][i] = 0;
         }
         if(bd[j][i] == 0 && bd[j+1][i] != 0) {
            bd[j][i] = bd[j+1][i];
            bd[j+1][i]= 0;
            draw();
            j = 0;
            //println(j);
            count = 2;
          } else if (bd[j][i] == bd[j+1][i] && (bd[j][i] + bd[j+1][i]) != merged  ) {
            bd[j][i] *= 2;
   
            merged = bd[j][i];
            bd[j+1][i] = 0;
            draw();
            j = 0;
            //println("12312");
            count = 2;
          } 
          
        }
      }
      if(count == 2) {
        count = 1;
      }
     
    } else if (keyCode == DOWN) {
   
      for (int i = 0; i< bd.length - 1  ;i++) {
        for (int j = 3; j> 0 ;j--) {
         if(bd[3][i] == 0 && bd[2][i] != 0) {
           bd[3][i] = bd[2][i];
           bd[2][i] = 0;
         } else if(bd[3][i] == bd[2][i]) {
           bd[3][i] *= 2;
           bd[2][i] = 0;
         }
         if(bd[j][i] == 0 && bd[j-1][i] != 0) {
            bd[j][i] = bd[j-1][i];
            bd[j-1][i]= 0;
            draw();
            j = 3;
            //println(j);
            count = 2;
          } else if (bd[j][i] == bd[j-1][i] && (bd[j][i] + bd[j-1][i]) != merged  ) {
            bd[j][i] *= 2;
            merged = bd[j][i];
            bd[j-1][i] = 0;
            draw();
            j = 3;
            count = 2;
          } 
         
        }
      }
      if(count == 2) count = 1;
    }
     
   
}
 
 
 
 
public void draw() {
  background(#66B2FF);
  textSize(10);
  text("score" + score,450/2, 10);
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
        text("2", x+(100/2), y+(100/1.5f));
      }
      else if (bd[i][c] == 4) {
         
        fill(0, 255, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("4", x+(100/2), y+(100/1.5f));
      }
      else if (bd[i][c] == 8) {
        fill(0, 0, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("8", x+(100/2), y+(100/1.5f));
      }
      else if (bd[i][c] == 16) {
        fill(0, 100, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("16", x+(100/2), y+(100/1.5f));
      }
      else if (bd[i][c] == 32) {
        fill(50, 0, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("32", x+(100/2), y+(100/1.5f));
      }
      else if (bd[i][c] == 64) {
        fill(255, 200, 255);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("64", x+(100/2), y+(100/1.5f));
      }
      else if (bd[i][c] == 128) {
        fill(20, 255, 10);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("128", x+(100/2), y+(100/1.5f));
      } else if (bd[i][c] == 256) {
         
        fill(0xffB8CB07);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("256", x+(100/2), y+(100/1.5f));
      } else if (bd[i][c] == 512) {
        fill(0xffDDF314);
        rect(x, y, 100, 100);
        fill(0);
        textSize(50);
        text("512", x+(100/2), y+(100/1.5f));
      }
    }
  }
   
  
}
