
int lastTimeIChanged; //in milliseconds ( 1000 = 1sec )


void setup() {
  size(200, 500);
  background(random(255), random(255), random(255));
}



void draw() {

  if (millis() > 1500 + lastTimeIChanged) {
    background(random(255), random(255), random(255));
    lastTimeIChanged = millis();
  }
  ellipse(mouseX, mouseY, 30, 30);
  
}

void mousePressed () {
rect (mouseX, mouseY, 30,30);
}

void mouseReleased () {
ellipse(mouseX, mouseY, 30,30);
}

void mouseDragged() {
arc(mouseX, mouseY, 30,30,0,PI);
}

void keyPressed() {
  if(key == 'f') {
  background(0);
  }
if (millis() > 4000 + lastTimeIChanged) {
    background(random(255), random(255), random(255));
    lastTimeIChanged = millis();

}
}
