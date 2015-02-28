
//o critico caminha pelo museu moderno
int a=0;

void setup() {
size(700, 800);
noStroke();
}

void draw() {
background(255);
//titulo
if (mouseX<300) {
  fill(0);
  textSize(40);
  text("O crítico", 30, 50);
} else { 
}
//quadro
fill(0);
quad(110, 110, 110, 600, 600, 600, 600, 110);
for (int i=5; i<500; i=i+7) {
for (int j=5; j<500; j=j+7) {
rect(100+i, 100+j, 5, 5);
fill(a + 10 +50, i+j, i+ 50);
}
}
noStroke();
fill(220);
//chao
quad(0, 700, 700, 700, 700, 800, 0, 800);
fill(0);
//perna
quad(mouseX, 710, mouseX+50, 710, mouseX+70, 500, mouseX, 500);
//torso
quad(mouseX-10, 500, mouseX+90, 500, mouseX+70, 320, mouseX-10, 320);
//sapato
quad(mouseX, 710, mouseX, 730, mouseX+50, 730, mouseX+50, 710);
triangle(mouseX+50, 710, 80+mouseX, 730, mouseX+50, 730);
//mão
fill(124, 93, 47);
quad(mouseX, 480, mouseX, 520, 5+mouseX, 520, 5+mouseX, 480);
quad(10+mouseX, 480, 10+mouseX, 520, 15+mouseX, 520, 15+mouseX, 480);
quad(20+mouseX, 480, 20+mouseX, 520, 25+mouseX, 520, 25+mouseX, 480);
quad(30+mouseX, 480, 30+mouseX, 520, 35+mouseX, 520, 35+mouseX, 480);
quad(mouseX, 480, mouseX, 500, 35+mouseX, 500, 35+mouseX, 480);
fill(255);
quad(mouseX, 470, mouseX, 480, 35+mouseX, 480, 35+mouseX, 470);
//cabeca
fill(124, 93, 47);
quad(mouseX, 320, 55+mouseX, 320, 55+mouseX, 230, mouseX, 230);
quad(mouseX+55, 230, mouseX+65, 230, mouseX+75, 290, mouseX+55, 290);
}

void mouseClicked() {
if (mouseButton == LEFT) {
a=(a+50)%255;
} 
else {
a=(a-50)%255; 
}
}
