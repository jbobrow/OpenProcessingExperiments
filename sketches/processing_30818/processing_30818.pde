
//step sequencer 0.1 (no bpm yet, just timer) 
//started from 2d array demo on processing.org

Cell[][] grid;

int cols = 10;
int rows = 10;
int starttime; 
int delaytime = 925; 
int curtime;   
float count_up; 
float count_down; 
int steptimer;
boolean play = false;
  
void setup() {
  size(250,200);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*20,j*20,20,20);
    }
  }
}

void draw() {
  background(0);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if ((i & 1) == 0) {
        // even rows white
      grid[i][j].display(255);      
      } else {
       // odd rows gray
      grid[i][j].display(220);
      }
    }
    
    if (play == true) {
    int j;
      if (millis() - starttime < delaytime) {       
          count_up = (millis() - starttime); 
          count_down = delaytime - count_up; 
          steptimer = floor(10 / (delaytime / count_up));        
          fill(0);
          textSize(12);
          text(steptimer, mouseX, mouseY);
            for (j = 0; j < rows; j++) {
            grid[steptimer][j].display(120);
            grid[steptimer][j].trigger(steptimer,j);
            }  
        } else {
          starttime = millis();
          j = 0;
        }
     }
  }
}
  
void mousePressed() {
  if (mouseButton == LEFT) {

    int xX = int(mouseX)/20;
    int yY = int(mouseY)/20;    
//    fill(255);
//    textSize(12);
//    text( xX + " " + yY, mouseX, mouseY);
    grid[xX][yY].pressed();
  }
  if (mouseButton == RIGHT) {
     starttime = millis();  
    if (play == true) { play = false; } 
    else { play = true; }
  }
}

// A Cell object
class Cell {
  float x,y;
  float w,h;
  boolean active = false;
  
  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 
  
  void display( int step ) {
    stroke(0);
 
    if (active == true) {
      fill(0);
    } else {
      fill(step);
    }
    
    rect(x,y,w,h); 
    fill(255,0,0);
    //textSize(5);
    //text("X: " + x, x, y-9);
    //text("Y: " + y, x, y);
  }
  
  void pressed() {
    if (active == true) { active = false; } 
    else { active = true; }
  }

  void trigger(int x, int y) {
    int y2;
    y2 = y+1;
    textSize(21);
      if (active == true) { 
     //cell is triggered, do stuff here (play wav, whatever)
     //i just display text showing the triggered cell[][] info for testing
      text(x + " " + y, 210, y2*20); 
      }
    }
    
}
 





