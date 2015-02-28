
int GREEN = 2;
int BLUE = 1;
int curColor;
void setup(){
  frameRate(100);
  size(750,750);
  strokeWeight(50);
  stroke(0,255,0);
  curColor = GREEN;
  clearScreen();
}
 
void clearScreen(){
   background(0);
}
 
void draw(){
  //if(frameCount % 2 == 0){
        if(curColor == GREEN){
           curColor = BLUE;
          stroke(0,0,255);
        } else {
           curColor = GREEN;
          stroke(0,255,0);
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


