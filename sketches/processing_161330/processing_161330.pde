
int vari = 1;
void setup(){
  size(300,300);
}

void draw(){
  vari=vari+1;
  if (vari <= 256) {
  strokeCap(ROUND);
  strokeWeight(8.4);
  new fill(vari, vari, 0);
  rect(0, 0, 300, 300);
  //yellow square
  }
  if (vari >=100) {
  line(75, 300, 0, 225);
  //bottom line
  line(225, 0, 300, 75);
  //top line
  new fill(50, 50, 200);
  ellipse(60, 40, 195, 160);
  //blue elli
  new fill(50, 200, 20);
  ellipse(195, 50, 95, 80);
  //green elli
  new fill (185, 0, 250);
  rect(-50, 30, 400, 35);
  //purple rect
  }
  if (vari >=150) {
  new fill (40, 255, 165);
  triangle(120, 150, 9, 40, 100, 18);
  //cyan tri
  new fill(240, 0, 0);
  ellipse(50, 100, 80, 120);
  //red elli
  new fill(50, 200, 50);
  rect(30, -50, 35, 400);
  //green rect
  new fill(40, 255, 165);
  ellipse(125, 246, 65, 90);
  //cyan elli
  new fill(240, 0, 0);
  rect(50, 200, 170, 50);
  //red rect
   new fill(50, 200, 50);
  rect(130, 120, 55, 55);
  //green square
  }
  if (vari >=200) {
  new fill(185, 0, 250);
  ellipse(210, 170, 90, 105);
  //purple elli
  new fill(255, 165, 40);
  ellipse(57, 190, 95, 95);
  //orange circle
  new fill(185, 0, 250);
  triangle(17, 185, 45, 280, 120, 230);
  //purple tri
  new fill(40, 255, 165);
  rect(220, 15, 45, 120);
  }
  if (vari >=256) {
  //cyan rect
  new fill(240, 0, 0);
  triangle(100, 50, 270, 100, 210, 170);
  //red tri
  new fill(255, 165, 40);
  quad(96, 13, 164, 27, 152, 72, 78, 66);
  //orange quad
  rect(200, 185, 75, 75);
  //orange square
  new fill(40, 255, 165);
  quad(170, 210, 225, 200, 265, 280, 190, 270);
  //cyan quad
  }
}


