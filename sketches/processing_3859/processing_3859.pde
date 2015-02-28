
void setup() {
size(800, 600);
noStroke();
background(204);

color maccas = color(#E9FA0D);
color newcollege = color(#FF8E03);
color oval = color(#05FF03);
color rc = color(#FF1C03);
color mainwalk = (#FF8E03);
color cafe = (#03ADFF);

fill (maccas);
rect(0, 0, 150, 400);

fill (newcollege);
rect (200, 0, 300, 150);

fill (oval);
ellipse(400, 300, 150, 150);

fill (rc);
rect(480, 400, 150, 200);

fill (mainwalk);
rect(630, 00, 50, 800);

fill (cafe);
rect(680, 0, 100, 200);
}

void draw() {
  rect(480, 400, 150, 200);
  fill(#F70202);
  if(mousePressed) {
    stroke(#030303);
  } else {
    stroke(0);
    fill(#000000);
  }
  rect(mouseX, mouseY, 10, 10);
}




