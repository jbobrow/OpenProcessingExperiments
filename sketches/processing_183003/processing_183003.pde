
int x;

void setup() {
  size(600, 600);
  frameRate(22);

}

void draw() {
  andlit(210, 210);
 // fill(255, 5, 5);
 andlit(440,440);

}


void andlit( int x, int y ) {
  ellipse(x-0, y-50, 300,300);
  fill(255, 180, 150);
  ellipse(x, y, 200, 200);
  fill(random(255), random(189), random(152));
  ellipse(x-40, y-20, 30, 20);
  ellipse(x+40, y-20, 30, 20);
  fill(0,0,0);
   ellipse(x+40, y-20, 10, 10);
  ellipse(x-40, y-20, 10,10);
  fill(86,214,212);
  ellipse(x, y, 50, 50);
  fill(255,255,255);
  ellipse(x, y, 10, 10);
  fill(255,255,255);
  ellipse(x, y+60, 100, 50);
  fill(0,0,0);
  ellipse(x,y+60,50,50);
  fill(random(189),random(152),random(180));
  

}

