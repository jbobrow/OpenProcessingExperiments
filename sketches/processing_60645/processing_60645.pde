
int xPos;
int yPos;
int w = 100;
int h = 75;
 
void setup() {
  size(400, 400);
  xPos = width/2;
  yPos = height/2;
}
 
void draw() {
  background(80);
  noStroke();
   
  if (mouseX >= 150 && mouseX <= 250 && mouseY >= 162.5 && mouseY <= 237.5) {
    fill (255,188,3);
  } else {
    fill (210);
  }

  rectMode(CENTER);
  rect(xPos, yPos, w, h);
} 




void keyPressed(){
  saveFrame("rollover.png");
}

