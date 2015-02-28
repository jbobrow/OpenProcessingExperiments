
// A.Haktan Çakmakoğlu 0443028 Grafik&Tasarım haktancakmakoglu@hotmail.com

PGraphics pg;

void setup() {
  size(200, 200);
  pg = createGraphics(80, 80, P3D);
}
void draw() {
  fill(0, 40);
  rect(0, 0, width, height);
  fill(200);
  ellipse(mouseX, mouseY, 20, 20); 
}

