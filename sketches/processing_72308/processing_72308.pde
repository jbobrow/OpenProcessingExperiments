
void setup() {
  size (600, 600);
  background (0, 0, 0);
  smooth();
  frameRate (120);
}

void draw() {
  lightbeam();
  spectrum();
  innerprism();
  prism();
}

void lightbeam() {
  stroke(255, 255, 255);
  strokeWeight(2);
  line(0, 350, 250, 280);
}

void prism() {
  noFill();
  strokeWeight(6);
  stroke(255, 255, 255);
  triangle(300, 200, 175, 400, 425, 400);
  noFill();
  strokeWeight(4);
  stroke(91, 146, 229, 200);
  triangle(300, 203, 178, 397, 422, 397);
}

void innerprism() {
  float x1=255, y1=280, x2=345, y2=266;
  int n=0;
  while (n<11) {
    stroke(255, 255, 255, 4);
    strokeWeight(0.1);
    line(x1, y1, x2, y2);
    x2=x2+1.3;
    y2=y2+3.45;
    n++;
  }
}

void spectrum() {
  float x1=348, y1=270, x2=600, y2=312;
  float a=255, b=34, c=0;
  int n=0;
  int a1=255, b1=119, c1=0;
  int a2=255, b2=191, c2=0;
  int a3=255, b3=238, c3=0;
  int a4=221, b4=255, c4=0;
  int a5=80, b5=255, c5=0;
  int a6=0, b6=255, c6=0;
  int a7=0, b7=170, c7=255;
  int a8=0, b8=34, c8=255;
  int a9=136, b9=50, c9=255;
  int a10=230, b10=75, c10=175;
  stroke(a, b, c, 20);
  while (n<11) {
    strokeWeight(7);
    line(x1, y1, x2, y2);
    x1=x1+2.2;
    y1=y1+3;
    x2=x2+10;
    y2=y2+10;
    n++;
    if (n==1)
    {  stroke (a1, b1, c1, 20);
    } else if (n==2)
    {  stroke (a2, b2, c2, 20);
    } else if (n==3)
    {  stroke (a3, b3, c3, 20);
    } else if (n==4)
    {  stroke (a4, b4, c4, 20);
    } else if (n==5)
    {  stroke (a5, b5, c5, 20);
    } else if (n==6)
    {  stroke (a6, b6, c6, 20);
    } else if (n==7)
    {  stroke (a7, b7, c7, 20);
    } else if (n==8)
    {  stroke (a8, b8, c8, 20);
    } else if (n==9)
    {  stroke (a9, b9, c9, 20);
    } else 
    {  stroke (a10, b10, c10, 20);
    }
  }
}


