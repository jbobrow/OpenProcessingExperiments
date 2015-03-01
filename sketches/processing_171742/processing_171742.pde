
int x = 200;
int y = 200;

void setup() {
  size (500,400);
}


void draw() {
  building();
  window(200,200);

}

void building() {
   fill(#7C1321);
 noStroke();
rect(190,190,110,210);
fill(100);
rect(200,180,10,10);
}

void window(int x, int y) {
  while(x < 300) {
  while(y < 400){
 fill(#CAFAEE);
 stroke(0);
 rect(x,y,10,10);
 line(x+5,y,x+5,y+10);
 line(x,y+5,x+10,y+5);
  y = y + 20;
}
  x = x + 20;
  y = 200;
}
}

