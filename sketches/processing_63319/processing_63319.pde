
int x = 100;
int y = 100;
int w = 200;
int h = 150;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(92,195,203);
  stroke(255);
   
  
 
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
    fill(random(255),random(255),random(255));
  }
  
  else{
    fill(150);
  }

  
  rect(x, y, w, h);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h);
  }
/*void mousePressed(){ 
  saveFrame("2.1.png");
}*/

