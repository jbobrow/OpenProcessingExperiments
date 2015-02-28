
int posX = 50;
int dirX = 0;
int R = 40;
int G = 140;
int B = 50;
int ellipseSize = 60;

void setup() {
  size(650, 500);
  background (R, G, B);

}

void draw() {
  background (R, G, B);
  fill (227, 247, 102);
  noStroke();
  animator();
  
  println (mouseX + " " + mouseY);
  ellipse (posX, mouseY, ellipseSize, ellipseSize);

}


void animator(){
  if(posX >= width-ellipseSize/2){ 
  dirX = 1;
  }
  if (posX <= ellipseSize/2) {
  dirX = 0;
  }
  if (dirX == 1) {
  posX = posX - 5;
  }
  else {
    posX = posX + 5;
  }
}





