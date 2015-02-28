
void setup(){
size(500, 500);


}

void draw()
{
  background(255);
  faceDrawing(mouseX, mouseY);
if(mousePressed){
  sadFace(mouseX, mouseY);
  text("헐", mouseX+110, mouseY);
}



}



void faceDrawing(int x, int y)
{
 
  fill(255);
  stroke(0);
  rect(x, y, 100, 100);
  fill(0);
  ellipse(x+25, y+25, 10, 10);
  ellipse(x+75, y+25, 10, 10);
  fill(255, 0, 0);
  noStroke();
  rect(x+40, y+60, 20, 20);
}


void sadFace(int x, int y){
    fill(255);
  stroke(0);
  rect(x, y, 100, 100);
  fill(0);
  ellipse(x+25, y+25, 10, 10);
  ellipse(x+75, y+25, 10, 10);
  fill(255, 0, 0);
  noStroke();
  rect(x+40, y+60, 20, 20);
  fill(128, 255, 255);
  rect(x+20, y+30, 10, height);
  rect(x+70, y+30, 10, height);
  fill(0);
  text("     Processing 멘붕 ㅠㅠㅠ", mouseX+110, mouseY);
}
