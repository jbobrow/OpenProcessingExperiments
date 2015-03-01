
void setup(){
//set up the window size
size(1000, 1000);
frameRate(30);
}
void draw(){
  triangle(mouseX, mouseY, pmouseX, pmouseY, 500, 500);
  fill(mouseX+10, mouseY+8, 50);
  
}


