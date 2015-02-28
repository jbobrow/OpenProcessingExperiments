
void setup(){
  size(400, 400);
}
 
void draw(){
  background(255, 0, 0);
  if(mousePressed){
    for(int y = 0; y <= height; y = y + 20){
      for(int x = 0; x <= width; x = x + 20){
        fill(255, 125, 3);
        ellipse(x, y, 20, 20);
        line(x, y, mouseX, mouseY); 
        stroke(255, 217, 0);
      }
    }
  }else{
    background(0, 0, 255);
    for(int y = 0; y <= height; y = y + 40){
    for(int x = 0; x <= width; x = x + 40){
      stroke(113, 182, 224);
      line(20, y, x, 20);
      line(380, y, x, 380);
      noFill();
      rectMode(CENTER);
      rect(width/2, height/2, mouseY, mouseY);
      rect(width/2, height/2, mouseX, mouseX);
    }
  }
     
  }
}
