
void setup() {
  size(500, 500);
}
void draw() {
  for (int i=0; i<30; i+=10) {
    fill(111,25,111);
    rect(mouseX, 0, mouseY, 60);
    fill(0, 105, 128);
    rect(mouseX+i, 60, mouseY+i, 20);
    fill(0, 136, 144);
    rect(mouseX, 70, mouseY, 30);
    fill(207, 0, 112);
    rect(mouseX+i, 100, mouseY-i, 50);

    fill(238, 134, 154);
    rect(mouseX+i, 140, mouseY+i, 70);
    fill(245, 178, 178);
    rect(mouseX-i, 180, mouseY+i, 80);
    fill(248, 198, 181);
    rect(mouseX, 220, mouseY, 100);
    fill(247, 171, 0);
    rect(mouseX, 250, mouseY+i, 120);
    fill(105, 128, 0);
    rect(mouseX+i, 270, mouseY+i, 160);
    fill(0, 93, 172);
    rect(mouseX-i, 300, mouseY+i, 180);
    fill(255,244,99);
    rect(mouseX+i, 300, mouseY+i, 300);
  }
}



