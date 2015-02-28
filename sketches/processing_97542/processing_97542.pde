
void setup () {
  size(200, 200);
  background(0);
}

int x;
int y;
int z;

void draw () { 
  stroke (255);
  fill (#ED0C2E);
  for (int x=40; x<161; x=x+30) {
    for (int y=40; y<190; y=y+30)
      ellipse (x, y, 9, 9);//bolinhas


    for (int z=30; z<160; z+= 30) {
      for (int j= 50; j<165; j=j+30)
        rect (z+10, j, 1, 10);//linhas
      line (x+20, z+10, x+10, z+10);
    }
  }
  stroke (0);
  fill (0);
  rect (170, 10, 20, 180);
  stroke (255);
  fill (#0DA20B);
  ellipse (100, 130, 9, 9);
  ellipse (130, 130, 9, 9);
}
