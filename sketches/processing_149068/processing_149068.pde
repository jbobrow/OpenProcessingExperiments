
int Lifeize = 5;
float probabilityOfAliveAtStart = 15;
int interval = 100;
int lastRecordedTime = 0;


color alive = color(0, 200, 200);
color dead = color(0);


int[][] Life; 

int[][] LifeBuffer; 


boolean pause = false;

void setup() {
  size (800, 800);


  Life = new int[width/Lifeize][height/Lifeize];
  LifeBuffer = new int[width/Lifeize][height/Lifeize];


  stroke(48);

  noSmooth(); 


  for (int x=0; x<width/Lifeize; x++) {
    for (int y=0; y<height/Lifeize; y++) {
      float state = random (100);
      if (state > probabilityOfAliveAtStart) { 
        state = 0;
      } else {
        state = 1;
      }
      Life[x][y] = int(state);
    }
  }
  background(0);
}


void draw() {
  for (int x=0; x<width/Lifeize; x++) {
    for (int y=0; y<height/Lifeize; y++) {
      if (Life[x][y]==1) {
        fill(alive);
      } else {
        fill(dead);
      }
      rect (x*Lifeize, y*Lifeize, Lifeize, Lifeize);
    }
  }

  if (millis()-lastRecordedTime>interval) {
    if (!pause) {
      iteration();
      lastRecordedTime = millis();
    }
  }


  if (pause && mousePressed) {

    int xCellOver = int(map(mouseX, 0, width, 0, width/Lifeize));
    xCellOver = constrain(xCellOver, 0, width/Lifeize-1);
    int yCellOver = int(map(mouseY, 0, height, 0, height/Lifeize));
    yCellOver = constrain(yCellOver, 0, height/Lifeize-1);


    if (LifeBuffer[xCellOver][yCellOver]==1) {
      Life[xCellOver][yCellOver]=0; 
      fill(dead);
    } else { 
      Life[xCellOver][yCellOver]=1; 
      fill(alive);
    }
  } else if (pause && !mousePressed) { 

    for (int x=0; x<width/Lifeize; x++) {
      for (int y=0; y<height/Lifeize; y++) {
        LifeBuffer[x][y] = Life[x][y];
      }
    }
  }
}



void iteration() { 

  for (int x=0; x<width/Lifeize; x++) {
    for (int y=0; y<height/Lifeize; y++) {
      LifeBuffer[x][y] = Life[x][y];
    }
  }


  for (int x=0; x<width/Lifeize; x++) {
    for (int y=0; y<height/Lifeize; y++) {

      int neighbours = 0; 
      for (int xx=x-1; xx<=x+1;xx++) {
        for (int yy=y-1; yy<=y+1;yy++) {  
          if (((xx>=0)&&(xx<width/Lifeize))&&((yy>=0)&&(yy<height/Lifeize))) { // Make sure you are not out of bounds
            if (!((xx==x)&&(yy==y))) { 
              if (LifeBuffer[xx][yy]==1) {
                neighbours ++;
              }
            }
          }
        }
      } 

      if (LifeBuffer[x][y]==1) { 
        if (neighbours < 2 || neighbours > 3) {
          Life[x][y] = 0;
        }
      } else {       
        if (neighbours == 3 ) {
          Life[x][y] = 1;
        }
      }
    }
  }
} 

void keyPressed() {
  if (key=='r' || key == 'R') {
    // Restart
    for (int x=0; x<width/Lifeize; x++) {
      for (int y=0; y<height/Lifeize; y++) {
        float state = random (100);
        if (state > probabilityOfAliveAtStart) {
          state = 0;
        } else {
          state = 1;
        }
        Life[x][y] = int(state);
      }
    }
  }
}

//Credit to Tom Eskra and Processing.org for helping me to get this to work.


