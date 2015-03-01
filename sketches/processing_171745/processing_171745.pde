

void setup() {
  size(640,360);
  background(255);
  strokeWeight(2);
  smooth(); 
}
void subject(){
  int borderDistanceX = max(mouseX,width-mouseX)*255/width*2-255;
  int borderDistanceY = max(mouseY,height-mouseY)*255/height*2-255;
  int c255 = max(borderDistanceX,borderDistanceY);
 
}

void draw(){
  subject();  
    fill(150,255,255);
     ellipse(mouseX,mouseY,35,35);
  subject();
    fill(10,230,100);
     ellipse(mouseX,mouseY,25,25);
  subject();
    fill(255,200,45);
     ellipse(mouseX,mouseY,10,10);}
