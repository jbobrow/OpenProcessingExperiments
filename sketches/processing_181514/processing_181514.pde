
void setup () {
  size (1200, 700);
}

void draw () {
  background (11,37,178);
  float xdcha = mouseX - 60 ;
  float xizda = mouseX + 60 ;

//Cielo
stroke (250);
fill (255);
ellipse (900,200,300,250);
strokeWeight (random(15));
point(120,400);
point(1150,100);
point(900,300);
point(730,350);
point(400,180);
point(115,65);
strokeWeight (random(9));
point(210,180);
point(1050,100);
point(900,460);
point(730,190);
point(455,215);

//Matamoscas
  stroke (0);
  strokeWeight (10);
    line (xdcha, mouseY + 60, xizda, mouseY + 70);
    line (xdcha, mouseY - 60, xizda, mouseY - 50);
    line (xdcha, mouseY - 60, xdcha, mouseY + 60);
    line (xizda, mouseY - 50, xizda, mouseY + 70);
  strokeWeight (5);
    line (xdcha, mouseY, xizda, mouseY + 10);
    line (xdcha, mouseY + 20, xizda, mouseY + 30);
    line (xdcha, mouseY + 40, xizda, mouseY + 50);
    line (xdcha, mouseY - 20, xizda, mouseY - 10);
    line (xdcha, mouseY - 40, xizda, mouseY - 30);
    line (mouseX, mouseY - 50, mouseX, mouseY + 70);
    line (mouseX - 30, mouseY - 60, mouseX - 30, mouseY + 60);
    line (mouseX + 30, mouseY - 50, mouseX + 30, mouseY + 70);
  strokeWeight (15);
    line (mouseX, mouseY + 70, mouseX, mouseY + 180);

  //Luciérnaga
  //Cuerpo (Patas + Base)
  strokeWeight (10);
   point (mouseY +490, mouseX+35);
   point (mouseY +490, mouseX-35);
   point (mouseY +520, mouseX+35);
   point (mouseY +520, mouseX-35);
  strokeWeight (5);
  stroke (0);
    line (mouseY + 500, mouseX, mouseY +485, mouseX+35);
    line (mouseY + 500, mouseX, mouseY +485, mouseX-35);
    line (mouseY + 500, mouseX, mouseY +515, mouseX+35);
    line (mouseY + 500, mouseX, mouseY +515, mouseX-35);
  stroke(7, 229, 16);
  fill (178, 255, 181);
    ellipse (mouseY + 500, mouseX, 75, 50);

  //Lengua
  stroke(255,185,216);
  fill (255,185,216);
  ellipse (mouseY +547, mouseX, 30,20);
    strokeWeight(2);
  stroke(201,91,139);
  line(mouseY +550, mouseX, mouseY +562, mouseX);
  //Cabeza
  stroke(7, 229, 16);
  strokeWeight(5);
  fill (178, 255, 181);
  ellipse (mouseY + 535, mouseX, 42, 42);
  fill (255);
  stroke (0);
  strokeWeight (2);
  ellipse (mouseY + 547, mouseX - 10, 20, 20);
  ellipse (mouseY + 547, mouseX + 10, 20, 20);
  strokeWeight (10);
  point (mouseY + 550, mouseX - 10);
  point (mouseY + 550, mouseX + 10);
  strokeWeight (2);
  line (mouseY + 532, mouseX, mouseY + 527, mouseX);
  line (mouseY + 532, mouseX, mouseY + 527, mouseX - 4);
  line (mouseY + 532, mouseX, mouseY + 527, mouseX +4);

  //Alas
  strokeWeight (1);
  ellipse (mouseY + 500, mouseX, 30, random(50));
  ellipse (mouseY + 500, mouseX, 30, random(100));
  stroke(220);
  line (mouseY + 515, mouseX, mouseY + 485, mouseX);
  
  //Luces
  strokeWeight(2);
  stroke (255,238,170);
  fill (255, random(213,237),random(162,41));
  ellipse (mouseY + 470, mouseX, 20, 35);
  ellipse (mouseY + 465, mouseX, 25, 27);
  fill (255, random (238,226), random (170,108));
  ellipse (mouseY + 460, mouseX, 20, 20);
}

