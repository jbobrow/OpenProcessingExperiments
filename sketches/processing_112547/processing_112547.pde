
void setup(){
  size(400,400);
  background(0,0,0);
   
}
   
  void draw(){
    fill(mouseX,mouseY,150);
    ellipse(mouseY+50,mouseX+50,20,20);
    ellipse(mouseY-50,mouseX-50,20,20);
    ellipse(mouseX-50,mouseY+50,20,20);
    ellipse(mouseX+50,mouseY-50,20,20);
   
    }



