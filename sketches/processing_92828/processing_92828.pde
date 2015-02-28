
int sizeX = 500;
int sizeY = 500;
int white = 255;
int black = 0;
int fluctuation = 10;
void setup(){
  size(sizeX, sizeY);
  background(white);
}

void draw(){
  int randX = (int) random(mouseX - fluctuation, mouseX + fluctuation);
  int randY = (int) random(mouseY - fluctuation, mouseY + fluctuation);
  println("randX = "+ randX + "randY = " + randY);
  println(frameCount);
  int size = (int) sqrt( (abs(mouseX-pmouseX))^2 + (abs(mouseY-pmouseY))^2 ) + 15;
  
  fill(black);
  textSize(size);
  if(frameCount == 0){
    text("Click Me...", randX, randY);
  }
  int randR = (int) random(255);
  int randG = (int) random(255);
  int randB = (int) random(255);
  if(mousePressed) {
    noStroke();
    fill(randR,randG,randB);
    int randWidth = (int)random(10,50);
    ellipse(mouseX,mouseY, randWidth, randWidth);
  }
  
}
