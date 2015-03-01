
void setup(){
size(750,750);
smooth();
frameRate(10); 
}

void draw(){
smooth();
strokeWeight(1);
fill(200);
for (int y = 32; y <= height; y += 8) {
  for (int x = 12; x <= width; x += 15) {
    ellipse (pmouseX - x + y/2, pmouseY - y/2, mouseX + 16 - y/10.0, mouseY + 16 - y/10.0);
  }
}
for(int i = 20; i < 400; i += 60) {
  line(i, mouseX, i/2 + mouseX, mouseY);
  ellipse(mouseY - i/2, mouseX - i, 10, 10);
}
}
