
void setup(){
size(500, 500);
background(255);
}

void draw(){
 if(mousePressed){
  drawStar(mouseX, mouseY);
  }
}

void drawStar(int x, int y)
{
  fill(random(0, 255), random(0, 255), random(0, 255));
  noStroke();
  triangle(x-10, y-2, x+2, y-2, x+6, y+10);
  triangle(x-6, y+10, x-2, y-2, x+10, y-2);
  triangle(x-6, y+10, x, y-10, x+4, y+2);
}


