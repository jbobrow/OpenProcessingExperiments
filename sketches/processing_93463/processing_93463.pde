
//Victor DEMEOCQ, z3432227, UNSW


int vic;
float eye = 10;
float arm = 0;

void setup () {
  smooth(); 
  size(500,500);
}

void draw() {
background(234,232,232);
//Legs
line(mouseX-10, mouseY+80, mouseX-10, mouseY+30);
line(mouseX+10, mouseY+30, mouseX+10, mouseY+80);
//Body
fill(#FFB24D);
ellipse(mouseX, mouseY,50,80);
fill(#FFF0D8);
ellipse(mouseX, mouseY-50,50,50);
//Arms
line(mouseX-50, mouseY+30-arm, mouseX-22, mouseY-12);
line(mouseX+50, mouseY+30, mouseX+22, mouseY-12);
//Eyes
fill(vic,0,0);
ellipse(mouseX-10, mouseY-50,10,eye);
ellipse(mouseX+10, mouseY-50,10,eye);
//Mouth
line(mouseX-5, mouseY-35, mouseX+5, mouseY-35);

if (mousePressed) {
  eye = 0;
  arm = 70;
}

if(!mousePressed) {
  eye = 10;
  arm = 0;
}
}





