
int height = 255;
int width = 255;

void setup() {
  size(width, height);
}
  
  void draw(){
      background(255);  //set background white
      drawSquare(mouseX,mouseY);
  }
  
  void drawSquare(x,y){
    fill(mouseX,mouseY,0);
    rect(x,y,40,40);
  }
