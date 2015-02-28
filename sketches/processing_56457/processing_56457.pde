
PImage img;

void setup() {
size(720, 480);
img = loadImage("matrix.jpg");
smooth();
noStroke();
}

//head
void draw() {
  image(img, 0, 0);
fill(200, 0, 0);
int v = 175;
triangle(20, v, 158, 120, 186, 175); //upperjaw
triangle(186, v, 20, 300, 200, 300); //lowerjaw
fill(0);
ellipse(150, 150, 8, 8);

//neck
fill(0, 95, 05);
quad(200, 220, 220, 100, 179, 120, 200, 160);

fill(200, 300, 0);
quad(270, 200, 150, 300, 250, 150, 200, 300);

//body

fill(0, 0, 200);
rect(230, 150, 250, 160);

//wheel

fill(0, 0, 0);
smooth();
int y = 360;
int d = 300;
ellipse(y, d, 150, 150);

fill(200, 300, 0);
ellipse(y, d, 80, 80);

//tail
fill(200, 0, 0);
triangle(480, 250, 650, 160, 480, 310);

//tail orb


 if(mousePressed) {
   fill(0, 0, 0);
ellipse(670, 150, 50, 50);
 }else{
fill(200, 300, 0);
ellipse(670, 150, 50, 50);
 }
}

  


