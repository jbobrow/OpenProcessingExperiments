

int x;
void setup(){
  size(400,400);
  fill(0,50);
  noStroke();
  smooth();
  background (235);
}
void draw(){
}




void mouseMoved(){
redT (1,1);
}
void redT(int c, int j) {
noStroke();
fill(200,0,0, 100);
for(int i=c; i<400; i=i+5) {
float r = random(400);
rect(i, r, i, j);
}
}
void mousePressed(){
  fill (235);
  stroke (235);
  strokeWeight (5);
      line(mouseX,mouseY, 500, mouseY);
      strokeWeight (3);
      line(mouseX+7,mouseY+10, 500, mouseY+11);
      line(mouseX+7,mouseY-10, 500, mouseY-11);
      strokeWeight (1);
      line(mouseX,mouseY-15, 500, mouseY-16);
      line(mouseX,mouseY+15, 500, mouseY+16);
    }



