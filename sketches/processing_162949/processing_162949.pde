
int height = 400;
int width = 400;

void setup() {
  size(width, height);
}
  
  void draw(){
      background(120);  //set background grey
      drawAlien(mouseX,mouseY);
  }
  
  void drawAlien(x,y){
    int AlienX = x; // should be renamed alienX and alienY
    int AlienY = y;
    
      //body
      rectMode(CENTER);
      fill(200);
      rect(AlienX,AlienY,20,100);
      // head
      fill(255);
      ellipse(AlienX,AlienY-30,60,60); 
      //eyes
      fill(0);
      ellipse(AlienX-19,AlienY-30,16,32); 
      ellipse(AlienX+19,AlienY-30,16,32); 
      //legs
      line(AlienX-10,AlienY+50,AlienX-20,AlienY+60);
      line(AlienX+10,AlienY+50,AlienX+20,AlienY+60);
  
  }
