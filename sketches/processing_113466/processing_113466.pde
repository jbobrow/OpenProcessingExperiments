
void setup() {
  size(800, 600);
  background(255);
}
 
void draw() {
 
 
  if (( mouseX<= width/4)&&(mouseY<=height/3)) {
    stroke(0);
    fill(10,64, 0);
  line(mouseX, mouseY, 100, 100);
    fill(20);
    noStroke();
    line(mouseX+20, mouseY-20, 25, 25);
  }
  
  if ((mouseX>=width/2)&&(mouseX<=width-200)&&(mouseY<=height/3)) {
   stroke(0);
 
    fill(100, 64, 10);
    line(mouseX, mouseY, 100, 100);
    fill(64);
    noStroke();
    line(mouseX+20, mouseY-20, 25, 25);
  }
  
  if ((mouseX>=width/2)&&(mouseX<width-200)&&(mouseY>height/3)&&(mouseY<=height-200)) {
    stroke(0);
 
    fill(255, 64, 0);
    line(mouseX, mouseY, 100, 100);
    fill(64,0,255);
    noStroke();
    line(mouseX+20, mouseY-20, 25, 25);
  }
 
}


