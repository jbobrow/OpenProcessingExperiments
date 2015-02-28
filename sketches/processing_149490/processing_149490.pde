
boolean debug = true;
int[][] gr = new int[1003][4];

PImage pic;
PImage img;
float timer = 12;
int clicks = 0;
int state = 0; //game var
int x;
int y;

int winnyClicks = 10;

int curRow = 0; //starting row 

void setup() {

  size(400, 400);
  background(155);
  fillArray();
  //testFillArray();
  
  
  
  img = loadImage("fer.jpg");
  pic = loadImage("cb.jpg");
}  

void testFillArray() {
  for(int r = 0 ; r < gr.length ; r++) {
    for(int c = 0 ; c < gr[0].length ; c++) {
      print(gr[r][c] + " ");
    }
    println();
  }
}

void printPartialGrid(int startRow) {
  for(int r = startRow ; r < startRow + 4 ; r++) {
    for(int c = 0 ; c < gr[0].length ; c++) {
      print(gr[r][c] + " ");
    }
    println();
  }
}

void draw() { 
  
  for (int r = curRow; r< curRow+ 4; r++) {
      for (int c = 0; c < gr[0].length; c++) {
        fill(155);
        int x = 100*c;
        int y = 100*(r-curRow);
        rect(x, y, 100, 100);
        
        
        if ( gr[r][c] == 1) {
         
         image(img,x,y,100,100);
         //println(gr[r][c]);
        } 
        

      }
    }

  
  noStroke();
  fill(155);
  rect(230, 5, 60, 60);
  stroke(0);


  fill(255);   
  textSize(30);
  text("TIME: " + (int)timer, 160, 30);

  noStroke();
  fill(155);
  rect(220, 40, 50, 30);
  stroke(0);

  fill(155, 0, 0);
  textSize(35);
  text(clicks, 220, 70); 

  if (state == 0) {

    timer -= 0.035; //time goes down by this amnt of time

    if (timer <= 0) {
      timer = 0;
      state = -1;
    }
  }

  if (clicks == 999) { //reach 999 clicks you win
    state = 69;
  }  

  if (state == 69) {
    clicks = 999;
    fill(0, 0, 255);  
    text(" YOU WIN! ", 40, 400 );
    textSize(50);
  }  

  if (state == -1) {   // losing state of the game
    image(pic, 0, 0, 400, 400);   
    fill(255, 0, 0);
    textSize(50);
    text(" 'BANG BANG' ", 20, 300);
    textSize(35);
    text(" YOU'RE DONE! -RL " , 30, 350);
    
  }
  
  
}  

int getRectCol() {

    if ( mouseY < height/4 && mouseX< width/4 ) {
      return 0;
    } else if ( mouseY < height/4 && mouseX > width/4 && mouseX < width/2) {
      return 1;
    } else if ( mouseY < height/4 && mouseX > width/2 && mouseX < 300) {
      return 2;
    } else if (mouseY < height/4 && mouseX > 300 && mouseX < width) {
      return 3;
    } else {
      state = -1;
      return 4;
    }
  }

 

void drawGrids() {

    for (int r = curRow; r< curRow+ 4; r++) {
      for (int c = 0; c < gr[0].length; c++) {

        fill(155);
        if ( gr[r][c] == 1) {
         fill(255,0,0);
         println(gr[r][c]);
        } 
        
        int x = 100*c;
        int y = 100*(r-curRow);
        rect(x, y, 100, 100);
      }
    }
}

public void fillArray() {
  for (int row = 0; row < gr.length; row++) {
    int j = (int)random(0, 4); 
    gr[row][j] = 1;
    //println(gr[row][j]);
    
  }  
}

void mousePressed() {
     

    if (getRectCol() < 4 ) {
      
      if (gr[curRow][getRectCol()] == 1) {
        
        //println(777);
        clicks +=1;
        curRow++;
      } else {
        state = -1;
      }
    }else {
      state = -1;
    }

 


if (clicks == winnyClicks) {
   
   timer += 10;
   winnyClicks += 10;
   }
  
}
 


