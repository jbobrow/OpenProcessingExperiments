
int points;
color myColor; 

void setup(){
  size(1200, 1200);
  background(0, 0, 0);
}
void draw(){
  myColor = int(map(mouseX, 0, width, 0, 255));
  stroke(255, 255/frameCount, frameCount);
  line(width/2, height/2, mouseX, mouseY);
}




