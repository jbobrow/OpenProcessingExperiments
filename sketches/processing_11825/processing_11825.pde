
void setup(){
  size(400,400);
}
void draw() {
  background(36,5,49);
  
  float x= mouseX;
  float y= mouseY;
  ellipse(x,y,x+20,y+20);
  fill(207,245,59);
  ellipse(x,y+10,x+10,y+10);
  fill (175,206,52);
  

}

