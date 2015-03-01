

boolean isKPressed = false;
boolean isAPressed = false;


void setup(){
  size(500,500);
}
void draw() {
  noStroke();
  rectMode(CENTER);
  fill(random(0,255),random(0,255),random(0,255));
  background(0);
  if (isKPressed) background(30);
  if (isAPressed) background(60);
  if (isKPressed && isAPressed) rect(height/2, width/2, height/2, width/2);
}
void keyPressed() {
  if (char(keyCode) == 'K') isKPressed = true;
  if (char(keyCode) == 'A') isAPressed = true;


}
void keyReleased() {
  if (char(keyCode) == 'K') isKPressed = false;
  if (char(keyCode) == 'A') isAPressed = false;

}


