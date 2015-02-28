
int x=180;
void setup () {
  size(200, 200);
  background(226, 206, 114);
}
void draw () {
//praça
  background(226, 206, 114);
  fill(78, 218, 85);
  triangle(0, 0, 0, 90, 90, 0);
  triangle(0, 200, 0, 170, 125, 200);
  fill(170);
  ellipse(170, 100, 90, 90);
  fill(11, 228, 240);
  ellipse(170, 100, 80, 80);
  fill(174, 87, 0);
  rect(145, 180, 50, 15);
  fill(0);
  line(145, 193, 195, 193);
  fill(13, 153, 16);
  ellipse(70, 15, 25, 28);
  ellipse(10, 180, 30, 30);
  ellipse(40, 45, 50, 50);

  //pessoa banco
  fill(#FFE4B5);
  ellipse(152, 180, 5, 11);
  ellipse(157, 180, 5, 11);
  ellipse(155, 186, 22, 7);
  fill(0);
  ellipse(155, 186, 11, 11);
  ellipse(155, 186, 15, 7);

  //pessoa andando
  fill(#FFE4B5);
  ellipse(110, x-180, 22, 7);
  fill(0);
  ellipse(110, x-180, 11, 11);
  ellipse(110, x-180, 15, 7);
  x++;

  //passeio com a iguana
  fill(#006400);
  ellipse(mouseX, mouseY,8,8);
  ellipse(mouseX, mouseY,15,5);
}
