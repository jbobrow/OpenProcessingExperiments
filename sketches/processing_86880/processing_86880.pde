
int posX = 50;
int posY = 50;
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
  ellipse (mouseX, posY, ellipseSize, ellipseSize);

}


void animator(){
  if(posY >= height-ellipseSize/2){ 
  dirX = 1;
  }
  if (posY <= ellipseSize/2) {
  dirX = 0;
  }
  if (dirX == 1) {
  posY = posY - 5;
  }
  else {
    posY = posY + 5;
  }
}




