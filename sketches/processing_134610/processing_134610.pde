
float a;
float y1;

float g1;
float g2;
float h1;
float h2;
float i1;
float i2;
float j1;
float j2;
float k1;
float k2;
float l1;
float l2;
float m1;
float m2;
float n1;
float n2;
float o1;
float o2;
float p1;
float p2;
float q1;
float q2;
float r1;
float r2;
float s1;
float s2;
float t1;
float t2;
float u1;
float u2;

void setup() {
  size(400, 600);
  background(0);
}


void draw() {

  //MESA
  noStroke();
  fill(#7C4C2E);
  rect(0, 0, 400, 600);

  fill(#205222);
  rect(30, 30, 340, 540);
  fill(#2E5F30);
  rect(35, 35, 330, 530);

  //BURACOS
  fill(0);
  ellipse(40, 40, 30, 30);
  ellipse(40, 300, 30, 30);
  ellipse(40, 560, 30, 30);

  ellipse(360, 40, 30, 30);
  ellipse(360, 300, 30, 30);
  ellipse(360, 560, 30, 30);

  //TACO
  stroke(#F0C394);
  strokeWeight(5);
  line(200, a, 200, 600);
  stroke(0);
  line(200, a, 200, a+10);
  if (mouseY<450) {
    a = 449;
  }
  if (mouseY>450) {
    a = mouseY;
  }

  //BRANCA
  y1 = lerp(y1, mouseY, 0.05);
  noStroke();
  fill(255);
  ellipse(200, y1, 27, 27);
  if (y1<230) {
    y1 = 230;
  }

  //VERMELHAS
  pushMatrix();
  fill(#C41010);
  translate(width/2, 100);
  //FILA1
  ellipse(g1, g2, 27, 27); //1
  ellipse(h1, h2, 27, 27); //2
  ellipse(i1, i2, 27, 27); //3
  ellipse(j1, j2, 27, 27); //4
  ellipse(k1, k2, 27, 27); //5
  //FILA2
  ellipse(l1, l2, 27, 27); //1
  ellipse(m1, m2, 27, 27); //2
  ellipse(n1, n2, 27, 27); //3
  ellipse(o1, o2, 27, 27); //4
  //FILA3
  ellipse(p1, p2, 27, 27); //1
  ellipse(q1, q2, 27, 27); //2
  ellipse(r1, r2, 27, 27); //3
  //FILA4
  ellipse(s1, s2, 27, 27); //1
  ellipse(t1, t2, 27, 27); //2
  //FILA5
  ellipse(u1, u2, 27, 27); //1

  if (mouseY<100) {
    g1 = -40;
    g2 = -20;
    h1 = 60;
    h2 = 45;
    i1 = -160;
    i2 = -60;
    j1 = 60;
    j2 = 300;
    k1 = 70;
    k2 = -40;
    l1 = -68;
    l2 = 120;
    m1 = -13.5;
    m2 = 24;
    n1 = 17;
    n2 = 20;
    o1 = 20;
    o2 = -30;
    p1 = -35;
    p2 = 44;
    q1 = 0;
    q2 = 48;
    r1 = 27;
    r2 = 48;
    s1 = -13.5;
    s2 = 72;
    t1 = 13.5;
    t2 = 72;
    u1 = 0;
    u2 = 96;
  }
  else {
    g1 = -54;
    g2 = 0;
    h1 = -27;
    h2 = 0;
    i1 = 0;
    i2 = 0;
    j1 = 27;
    j2 = 0;
    k1 = 54;
    k2 = 0;
    l1 = -40.5;
    l2 = 24;
    m1 = -13.5;
    m2 = 24;
    n1 = 13.5;
    n2 = 24;
    o1 = 40.5;
    o2 = 24;
    p1 = -27;
    p2 = 48;
    q1 = 0;
    q2 = 48;
    r1 = 27;
    r2 = 48;
    s1 = -13.5;
    s2 = 72;
    t1 = 13.5;
    t2 = 72;
    u1 = 0;
    u2 = 96;
  }

  popMatrix();
}
