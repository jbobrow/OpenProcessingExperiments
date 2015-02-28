

int WHITE = 1;
int RED = 2;
int curColor;
void setup(){
  frameRate(30);
  size(250,250);
  strokeWeight(8);
  stroke(255);
  curColor = WHITE;
  clearScreen();
}

void clearScreen(){
   background(204); 
}

void draw(){
  //if(frameCount % 2 == 0){
        if(curColor == WHITE){
           curColor = RED;
          stroke(255,0,0); 
        } else {
           curColor = WHITE;
          stroke(255); 
        }
  //}
}

void keyPressed(){
   if(key == ' '){
      clearScreen();
   } 
}


float x,y;
void mousePressed(){
    x = mouseX;
    y = mouseY;
}
void mouseDragged(){
   line(mouseX,mouseY,x,y); 
    x = mouseX;
    y = mouseY;
}



