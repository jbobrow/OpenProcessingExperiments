
void setup() {
size(900, 900);
}
//stomach
void draw() {
background(182, 229, 250);
//body
fill(190, 51, 222);
rect(225, 450, 500, 300);
//hands
ellipse(190, 600, 70, 70);
ellipse(760, 600, 70, 70);

if ((mouseX > 470) && ( mouseX < 670) &&
  (mouseY > 600) && (mouseY < 800)) {
    fill (239, 242, 103);
  } else {
    fill(255);
  }
ellipse(470, 600, 200, 200);
pushMatrix();
translate(mouseX- 475, mouseY- 275);
//head
fill(230, 182, 250);
rect(350, 200, 250, 150);
//eyes
fill (255);
ellipse(400, 250, 50, 50);
ellipse(550, 250, 50, 50);
fill(0);
ellipse(400, 250, 15, 15);
ellipse(550, 250, 15, 15);
//mouth
fill(237, 101, 203);
arc(475, 300, 80, 80, 0, PI);
//antennas 
fill(0);
line(400, 200, 325, 100);
line(550, 200, 625, 100);
fill(120, 222, 27);
ellipse(325, 100, 35, 35);
ellipse(625, 100, 35, 35);
popMatrix();
}


