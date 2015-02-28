
void setup(){
  size(480,480);
  background(0);
}
  
void draw(){
  translate(width/2, height/2);
  rotate(frameCount/10.0);
  if (keyPressed && (key == CODED)) {
    if (keyCode == UP){
      stroke(255, 255, 255, 150);
      line(0, 0, 80,0);
    }
    if (keyCode == DOWN){
      stroke(77, 232, 176, 120);
      line(0, 0, 120, 0);
    }
    if (keyCode == LEFT){
      stroke(115, 237, 230, 110);
      line(0, 0, 160, 0);
    }
    if (keyCode == RIGHT){
      stroke(189, 162, 240, 100);
      line(0, 0, 200, 0);
    }
  }
}
 
void keyReleased(){
  if (key=='c' || key=='C') {
    background(0);
  }
}

