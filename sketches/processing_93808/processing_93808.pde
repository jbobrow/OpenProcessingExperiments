
int BarLen = 0;
int BarHeight = 80;
int BarMax = 775;
int BarXPos = 11;
int BarYPos = 10;


void setup() {
  
  size(800,400);
  background(0);
  
  fill(0);
   
}

void draw() {
  
  bar();
  
  if (BarLen >= BarMax) { //if the previous bar has finished drawing, draw a new bar 100 pixels down
    BarYPos += 100;
    BarLen = 0;
    bar();
    if(BarYPos > height) {
      BarYPos = BarYPos;
    }
  }
 
}
 
void bar() {
  
  
  BarLen += 7;
  
  if (BarLen >= BarMax) { //stop the bar before it goes off the screen
    BarLen = BarMax;
    }
    
  stroke(0,255,0); //draw the progress bar
  fill(0,255,0);
  rect(BarXPos,BarYPos,BarLen,BarHeight);
}
  




