
boolean clicked;
int pX = 0;
int pY = 0;
 
void setup(){
  size(640,400);
}
 
void draw(){
  //condition: if clicked is true, make those random lines
  if(clicked){
    stroke(random(255),0,0);
    line(pX,pY,random(width),random(height));
  }
}
 
void mouseClicked() {
  clicked = true;
  pX= mouseX;
  pY = mouseY;
  //sets the background color of the window to that grey 
  background(200); 
}
