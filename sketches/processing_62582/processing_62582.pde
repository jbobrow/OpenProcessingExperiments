
int dragX, dragY, moveX, moveY;
void setup(){
  size(500,500);
  smooth();


}
void draw(){

  fill(230, 250);
  triangle(dragX,dragY,250,250, moveX,moveY);
  fill(153);

}
void mouseMoved(){
moveX=mouseX;
moveY=mouseY;
}
void mouseDragged(){
dragX=mouseX;
dragY=mouseY;
}


