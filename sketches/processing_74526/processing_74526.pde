
void setup(){
  size(400, 400);
  strokeWeight(1);  
}
  
  void draw(){
    background(200);
    
    //loop for(init; test; update)
    for(int y = 0; y <= height; y = y + 50 ){
    for(int x = 0; x <= width; x= x+ 50){
     ellipse(x, y, 60, 60);
     
  fill(250, 0, 0, 5);
  ellipse(x, y, mouseX, mouseY);
    }
  }
 
  if (mousePressed) {
    mouseX=mouseY + 4;
  }
 if (mouseX > width) {
    mouseY= 0;
  }
}
