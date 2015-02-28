

void setup(){
size (600,600);

}

void draw(){
  background(0,80,255);
  drawMicky(mouseX,mouseY);
  smooth(); 
}
  
  void drawMicky(float x, float y){
    fill(5);
 smooth();
   rect(x,y,50,50);
  
  }

