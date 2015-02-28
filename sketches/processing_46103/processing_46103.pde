
int c1;
int c2;
int c3;
int c4;
int c5;
int c6;
  
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  c1 = int(random(500));
  c2 = int(random(500));
  c3 = int(random(500));
  c4 = int(random(500));
  c5 = int(random(500));
  c6 = int(random(500));

  int color1 = int(random(255));
  int color2 = int(random(255));
  int color3 = int(random(255));
  int color4 = int(random(255));
     
  int border1 = int(random(255));
  int border2 = int(random(255));
  int border3 = int(random(255));
  int border4 = int(random(255));
  
  delay(100);
  
  int switcher = (int)random(4);

  switch(switcher) {
    case 0:
      s0();
      break;
    case 1:
      s1();
      break;
    case 2: 
      s2();
      break;
    case 3:
      s3();
      break;
    case 4:
      s4();
      break;
  }
  fill(color1, color2, color3, color4);
  stroke(border1, border2, border3, border4);
  if (keyPressed && key == 's') {
    noLoop();
  }
  else if (keyPressed && key == 'c') {
    fill(255);
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
}

void s0() {
  rect(c1, c2, c3, c4, c5, c6);
}

void s1() {
  rect(c1, c2, c3, c4);
}

void s2() {
  triangle(c1, c2, c3, c4, c5, c6);
}

void s3() {
  ellipse(c6, c5, c4, c3);
}

void s4() {
   beginShape();
   vertex(c1, c2);
   vertex(c2, c3);
   vertex(c3, c4);
   endShape();
}


