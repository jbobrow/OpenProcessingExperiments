
void setup(){
size(500,500);
smooth();
}
void draw(){
  background(mouseX, mouseY, mouseY/2);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50);
  fill(mouseY, mouseY, mouseX/2, mouseY/2);
  stroke(mouseY, mouseY, mouseY);
  for(int xPos = 0; xPos <= width; xPos = xPos + 10) {
    line(xPos, 0, mouseX, mouseY);
    line(xPos, height, mouseX, height-mouseY);
     }

 stroke(mouseX, mouseX,mouseX);
    for(int yPos = 0; yPos <= height; yPos = yPos +10){
      line(0, yPos, mouseX,mouseY);
      line(width, yPos, mouseX, width-mouseX);
    }
  }
