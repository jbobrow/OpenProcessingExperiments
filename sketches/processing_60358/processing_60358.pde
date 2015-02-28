
void keyReleased() {
  if(key == 'b') {
    dropBall((int)random(100,width-100),(int)random(50,height-50));
  }
}

void mouseReleased() {
  dropBall(mouseX,mouseY);
  
}

