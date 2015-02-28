
//Brennda
int k= 250 ;
void setup () {
  size (300, 300);
  background (255, 255, 255);
}
void draw() {

  background(#94ABFC);

  noStroke();
  ellipse (20+int(400*sin(k*PI/360)), k, 20, 20); //Lua


  fill(#94ABFC);
  ellipse (27+int(400*sin(k*PI/360)), k, 20, 20); //Lua
    
  k = k - 1;
  if (k==0)
    k=500;
  stroke(0);
  strokeWeight(1);
  fill(#184814);
  rect(0, 270, 300, 30);
  //Garagem
  line(20, 220, 20, 270);
  line(20, 220, 90, 220);
  line(90, 220, 90, 270);
  //Entrada
  fill(#FFFFFF);
  rect(90, 180, 90, 90);
  rect(125, 240, 20, 30);
  // Lado direito
  rect(180, 180, 100, 90);
  rect(190, 240, 30, 15);
  rect(240, 240, 30, 15);
  rect(190, 190, 30, 15);
  rect(240, 190, 30, 15);
  // Lado esquerdo
  rect(20, 180, 70, 50);
  rect(30, 190, 50, 20);
  // Telhado
  int x = 146;
  int y =100;
  int dtelhax = 20;
  int dtelhay = 10;
  int ptx = 17;
  int pty = 10;
  for (int i = 0; i < 13; i++) {
    line(x, y, x+dtelhax, y+dtelhay);
    x += ptx;
    y += pty;
  }

  x = 155-dtelhax;
  y =100+dtelhay;
  dtelhax = 20;
  dtelhay = -10;
  ptx =-17;
  pty = 10;
  for (int i = 0; i < 13; i++) {
    line(x, y, x+dtelhax, y+dtelhay);
    x += ptx;
    y += pty;
  }
  triangle(20, 180, 280, 180, 150, 105);
}
