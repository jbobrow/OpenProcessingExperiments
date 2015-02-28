
void setup () {

  size(500, 500);
}

void draw () { 
  background(150,255);
  fill(#E8781C);
  rect(mouseX-75, mouseY-145, 200, 250);
  fill(#76A2C6);
  rect(mouseX-50, mouseY-120, 50, 80);
  rect(mouseX+50, mouseY-120, 50, 80);
  fill(0);
  rect(mouseX-15, mouseY-90, 15, 50);
  rect(mouseX+50, mouseY-90, 15, 50);
  fill(#E84F1C);
  rect(mouseX+12, mouseY-30, 25, 50);
  rect(mouseX, mouseY, 12, 20);      // 100, 170
  rect(mouseX+37, mouseY, 12, 20);
  fill(#9D918D);
  rect(mouseX-50, mouseY+40, 150, 40);
  fill(#E8781C);
  rect(mouseX+15, mouseY+105, 30, 80);
  rect(mouseX-5, mouseY+200, 20, 60);
  rect(mouseX+45, mouseY+200, 20, 60);
  rect(mouseX-5, mouseY+180, 70, 20);
  rect(mouseX-45, mouseY+130, 150, 20);
}

