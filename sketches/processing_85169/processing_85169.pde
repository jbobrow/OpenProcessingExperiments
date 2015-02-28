
void setup() {
  size(600, 600);
  background(10, 10, 10);
}

void draw()  {
  // for finding the coordinates of the spaces
  print("x: ");
  println(mouseX);
  print("y: ");
  println(mouseY);
  
  // Line color & width for the "web"
  stroke(255, 255, 255, 120);
  strokeWeight(4);
  // "web" line positions
//line(x1,  y1, x2, y2)
  line(70, 0, 70, 600);
  line(140, 0, 140, 600);
  line(210, 0, 210, 600);
  line(280, 0, 280, 600);
  line(350, 0, 350, 600);
  line(420, 0, 420, 600);
  line(490, 0, 490, 600);
  line(560, 0, 560, 600);
  line(0,   0, 600, 600);
  line(0,   0, 600, 600);
  line(0,   0, 600, 500);
  line(0,   0, 600, 400);
  line(0,   0, 600, 300);
  line(0,   0, 600, 200);
  line(0,   0, 600, 100);
  line(0,   0, 600, 600);
  line(0,   0, 100, 600);
  line(0,   0, 200, 600);
  line(0,   0, 300, 600);
  line(0,   0, 400, 600);
  line(0,   0, 500, 600);
  line(0,   0, 50, 600);


fill(247, 15, 34);
quad(423, 214, 486, 246, 486, 318, 423, 276);  

noStroke();
fill(51, 45, 247);
triangle(382, 122, 363, 63, 402, 71);

fill(22, 240, 70);
ellipse(245, 419, 63, 20);

fill(137, 25, 118);
quad(494, 130, 525, 110, 557, 130, 525, 150);

fill(255, 248, 28);
ellipse(384, 512, 57, 57);

stroke(255, 255, 255);
strokeWeight(4);
fill(255, 248, 28);
quad(143, 98, 143, 115, 206, 167, 207, 141);

noStroke();
fill(117, 97, 234);
triangle(110, 366, 90, 517, 137, 517);

stroke(255, 255, 255);
strokeWeight(4);
quad(423, 355, 423, 420, 487, 481, 486, 409);

noStroke();
fill(242, 115, 17);
ellipse(247, 270, 20, 20);

fill(242, 17, 186);
triangle(162, 280, 193, 306, 177, 327);

fill(17, 137, 10);
triangle(9, 35, 68, 212, 67, 383);

fill(17, 242, 229);
quad(291, 130, 313, 115, 336, 130, 313, 144);

//GUIDES
//quad(x1, y1, x2, y2, x3, y3, x4, y4);
//ellipse(x, y, width, height);   (origin of ellipse is center)
//triangle(x1, y1, x2, y2, x3, y3);
//quad(291, 100, 313, 115, 336, 100, 313, 144);  star trek like arrow



}
