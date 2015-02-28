
void setup() {
  size(600, 600);
  background(0, 254, 110);
}

void draw() {
  smooth();
  strokeWeight(2);
  fill(120, 240, 220);
  stroke(140, 200, 180);
  ellipseMode(RADIUS);
  float x = mouseX;
  float y = mouseY;
  ellipse((220+((600-x)/8)), (170+((600-y)/8)), 110, 120);
  fill(250);
  stroke(100);
  ellipse(300, 200, 40, 40);
  ellipse(220, 200, 40, 40);  //eyeball

  smooth();
  fill(0, 0, 0, 0);
  beginShape();
  vertex((200+((600-x)/8)), (240+((600-y)/5)));
  bezierVertex((200+((600-x)/8)), (260+((600-y)/8)), (240+((600-x)/8)), (260+((600-y)/8)), (240+((600-x)/8)), (240+((600-y)/5))); //mouth
  endShape();

  fill(0);
  if (x>280) {
    ellipse((280+(((x-280)/320)*40)), (180+((y/600)*40)), 10, 10);
    ellipse(240, (180+((y/600)*40)), 10, 10);
  } 
  else {
    ellipse(280, (180+((y/600)*40)), 10, 10);
    ellipse((200+((x/280)*40)), (180+((y/600)*40)), 10, 10); //puple
  }
}

