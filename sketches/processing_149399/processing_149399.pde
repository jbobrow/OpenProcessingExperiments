
int[][] bd= new int[5][5]; 
int score = 0;
int high = 0;

boolean won;
boolean cont = false;
boolean combined = false;
PFont bold;  


int count;
public void setup() {
  size(450, 500);
  bold = createFont("Arial Bold",1);
  randnum();
  randnum();
  //bd[0][1] = 2048;
  frameRate(50);
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

boolean dead() { 
  
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if(bd[i][j] == 0 || bd[i][j] == bd[i][j+1] || bd[i][j] == bd[i+1][j]) {
        return false;
      } 
    }
  }
  return true;
}
public void keyPressed() {
  
  if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN) {
    move();
  }
   
  if (key == 'r') {
    gameWon();
  } else if(key == 'c') {
    gameWon();
  } else
  if (count == 1 ) {
    randnum();
  }
}

  


void gameWon() {

  won = false;
  if (key == 'r') {
    score = 0;
    bd = new int[5][5];
    randnum();
    randnum();
  } else if(key == 'c') {
    cont = true;
  }
}


public void move() {
  count = 0;
  int merged = 0;
  

  if (keyCode == LEFT) {
    
    for (int i = 0; i < bd.length - 1; i++) {
     
      for (int j = 0; j < bd[0].length - 1;j++) {
        
        if (bd[i][0] == 0 && bd[i][1] != 0) {
          bd[i][0] = bd[i][1];
          bd[i][1] = 0;
          count = 2;
        } 
        else if (bd[i][0] == bd[i][1] && !combined ) {
          bd[i][0] *= 2;
          merged = bd[i][0];
          combined = true;
          score += bd[i][0];
          bd[i][1] = 0;
          count = 2;
        } else
    
        if (bd[i][j] == 0 && bd[i][j+1] != 0) {
          
          
          bd[i][j] = bd[i][j+1];
          bd[i][j+1]= 0;
        
          j = 0;
         
          
          count = 2;
        } 
        else if (bd[i][j] == bd[i][j+1] && (bd[i][j]) * 2 != merged && !combined  ) {
          bd[i][j] *= 2;
          score += bd[i][j];
          combined = true;
          merged = bd[i][j];
          bd[i][j+1] = 0;
          j = 0;
          count = 2; 
        }
  
      }
      combined = false;
 
    }
    if (count == 2) {
      count = 1;
    }
  }
  else if (keyCode == RIGHT) {
    for (int i = 0; i < bd.length - 1; i++) {
      for (int j = 3; j > 0;j--) {
        if (bd[i][3] == 0 && bd[i][2] != 0) {
          bd[i][3] = bd[i][2];
          bd[i][2] = 0;
          count = 2;
        } 
        else if (bd[i][3] == bd[i][2] && !combined ) {
          bd[i][3] *= 2;
          combined = true;
          score += bd[i][3]; 
          bd[i][2] = 0; 
          count = 2;
        } else
     
        if (bd[i][j] == 0 && bd[i][j-1] != 0) {
          bd[i][j] = bd[i][j-1];
          bd[i][j-1]= 0;
          j = 3;
         
          count = 2;
        } 
        else if (bd[i][j] == bd[i][j-1] && (bd[i][j]) * 2 != merged && !combined ) {
          bd[i][j] *= 2;
          combined = true;
          score += bd[i][j];
          merged = bd[i][j];
          bd[i][j-1] = 0;
        
          j = 3;

          count = 2;
        } 
        else {

        }
      }
      combined = false;
    }
    if (count == 2) {
      count = 1;
    }
  }
  else if (keyCode == UP) {
    for (int i = 0; i < bd.length - 1; i++) {
      for (int j = 0; j<bd[0].length - 1;j++) {
        
        if (bd[0][i] == 0 && bd[1][i] != 0) {
          bd[0][i] = bd[1][i];
          bd[1][i] = 0; 
          count = 2;
         
        } 
        else if (bd[0][i] == bd[1][i] && !combined ) {
          bd[0][i] *= 2;
          combined = true;
          score += bd[0][i];
          
          bd[1][i] = 0; 
          count = 2;
        } else
        
        if (bd[j][i] == 0 && bd[j+1][i] != 0) {
          bd[j][i] = bd[j+1][i];
          bd[j+1][i]= 0;
          j = 0;
          
         
          count = 2;
        } 
        else if (bd[j][i] == bd[j+1][i] && (bd[j][i] + bd[j+1][i]) != merged && !combined ) {
          bd[j][i] *= 2;
          score += bd[j][i];
          combined = true;
          merged = bd[j][i];
          bd[j+1][i] = 0;
          j = 0;
         
          count = 2;
        } 
       
      }
      combined = false;
    }
    if (count == 2) {
      count = 1;
    }
  } 
  else if (keyCode == DOWN) {
    
    for (int i = 0; i< bd.length - 1  ;i++) {
      for (int j = 3; j> 0 ;j--) {
        if (bd[3][i] == 0 && bd[2][i] != 0) {
          bd[3][i] = bd[2][i];
          bd[2][i] = 0; 
          count = 2;
         
        } 
        else if (bd[3][i] == bd[2][i] && !combined ) {
          bd[3][i] *= 2;
          combined = true;
          score += bd[3][i];
          bd[2][i] = 0; 
          count = 2;
          
        } else 
        
        if (bd[j][i] == 0 && bd[j-1][i] != 0) {
          bd[j][i] = bd[j-1][i];
          bd[j-1][i]= 0;
          j = 3;
          
          
          count = 2;
        } 
        else if (bd[j][i] == bd[j-1][i] && (bd[j][i] + bd[j-1][i]) != merged && !combined  ) {
          bd[j][i] *= 2;
          score += bd[j][i];
          combined = true;
          merged = bd[j][i];
          bd[j-1][i] = 0;
          j = 3;
          count = 2;
          
        } 
      
      }
      combined = false;
    }
    if (count == 2) count = 1; 
  }
 
}
int highScore() {
  
  if(score > high) {
    high = score;
    return high;
  } else {
    return high;
  }
}


public void draw() {
  background(255);
  textSize(20);
  
  fill(100,152);
  rect(0, 0, width,90);
//rect(height - 170, 1, 100,90);
  fill(0);
  text("SCORE", height - 220, 23);
  text("BEST", height - 120, 23);
  textAlign(CORNER);
  textFont(bold);
  textSize(30);
  fill(255);
  text("2048", 10, 25);
  textAlign(CENTER);
  fill(255);
  text("" + score, height - 220, 47);
  text("" + highScore(), height - 119, 47);
  textSize(10);
  textAlign(CORNER);
  fill(0);
  text("Press r to restart or close the game to rage quit" ,0,40);
  fill(150);
  rect(0,50,450,448);

  for (int i = 0; i < bd.length - 1; i++) {
    for (int c = 0; c < bd[0].length - 1; c++) {
      fill(200);
      int x = 10+(110)*c;
      int y = 60+(110)*i;
      textAlign(CENTER);
      rect(x, y, 100, 100);

      if (bd[i][c] == 2) {

        fill(#E8E8E8);
        rect(x, y, 100, 100);
        fill(20);
        textSize(50);
        text("2", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 4) {

        fill(#99FF99);
        rect(x, y, 100, 100);
        fill(20);
        textSize(50);
        text("4", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 8) {
        fill(#2FBC13);
        rect(x, y, 100, 100);
        fill(255);
        textSize(50);
        text("8", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 16) {
        fill(#1D9006);
        rect(x, y, 100, 100);
        fill(255);
        textSize(50);
        text("16", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 32) {
        fill(#4F7F11);
        rect(x, y, 100, 100);
        fill(255);
        textSize(50);
        text("32", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 64) {
        fill(#7F3911);
        rect(x, y, 100, 100);
        fill(255);
        textSize(50);
        text("64", x+(100/2), y+(100/1.5));
      }
      else if (bd[i][c] == 128) {
        fill(#C9AB15);
        rect(x, y, 100, 100);
        fill(255);
        textSize(50);
        text("128", x+(100/2), y+(100/1.5));
      } 
      else if (bd[i][c] == 256) {

        fill(#C9B44C);
        rect(x, y, 100, 100);
        fill(255);
        textSize(50);
        text("256", x+(100/2), y+(100/1.5));
      } 
      else if (bd[i][c] == 512) {
        fill(#F0DB72);
        rect(x, y, 100, 100);
        fill(200);
        textSize(50);
        text("512", x+(100/2), y+(100/1.5));
      } 
      else if (bd[i][c] == 1024) {
        fill(#F6D322);
        rect(x, y, 100, 100);
        fill(200);
        textSize(40);
        text("1024", x+(100/2), y+(100/1.5));
      } 
      else if (bd[i][c] == 2048) {
        fill(#FCD200);
        rect(x, y, 100, 100);
        fill(200);
        textSize(30);
        text("2048", x+(100/2), y+(100/1.5));
      } else if(bd[i][c] == 2048 * 2) {
        fill(0);
        rect(x, y, 100, 100);
        fill(255);
        textSize(30);
        text("" + 2048 * 2, x+(100/2), y+(100/1.5));
      } else if(bd[i][c] == 2048 * 4) {
        fill(0);
        rect(x, y, 100, 100);
        fill(255);
        textSize(30);
        text("" + 2048 * 4, x+(100/2), y+(100/1.5));
      }
  
      if (bd[i][c] == 2048 && !cont) {
         won = true;
          // gameWon();
      }
      
    }
  }
  if(dead() ) {
    
    fill(0,0,0,150);
    rect(0, 50, 500,500);
    fill(120);
    text("GAME OVER!", width/2, height/2);
    textSize(15);
    text("Press R to start a new game", width/2, height/2 + 30);
  }
  if (won) {
    textSize(60);
    fill(0);
    text("YOU WON!", width/2, height/2);
    textSize(15);
    text("Press C to continue or R to restart ", width/2, height/2 + 30);
    fill(255,255,0,100);
    rect(0, 50, 500,500);
    gameWon();
  } 
  
}
