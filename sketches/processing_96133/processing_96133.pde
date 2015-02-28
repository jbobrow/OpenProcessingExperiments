
int x=0;
int y=0;

void setup () {
  size(100, 100);
  smooth();
}

void draw () {
  x=mouseX;
  y=mouseY;

  fill(x+209,192,165);
  rect(x+15, y, 20, 20);
  line(x+25, y+20, x+25, y+50);
  line(x+15, y+30, x+35, y+30);
  line(x+15, y+30, x+5, y+50);
  line(x+35, y+30, x+45, y+50);
  rect(x, y+50, 10, 10);
  rect(x+40, y+50, 10, 10);
//leg
  line(x+15, y+50, x+35, y+50);
  line(x+15, y+50, x+15, y+70);
  line(x+35, y+50, x+35, y+70);
  rect(x+10, y+70, 10, 10);
  rect(x+30, y+70, 10, 10);
//face
  fill(255,50,0);
  arc(x+25, y+15, 5, 5, 0, PI);
  fill(0);
  arc(x+20, y+5, 5, 5, 0, (PI/180)*180);
  arc(x+30, y+5, 5, 5, 0, (PI/180)*180);
}


