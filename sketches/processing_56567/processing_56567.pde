
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int x4;
int y4;


void setup(){
  size(500, 500);
  background(200);
  x1 = 38;
y1 = 59;
x2 = 21;
y2 = 53;
x3 = 76;
y3 = 20;
x4 = 10;
y4 = 66;
}

void draw(){
noStroke();
fill(90);
quad(x1*7, x2*7, x3*7, x4*7, y1*7, y2*7, y3*7, y4*7);
fill(100);
quad(x1*6, x2*6, x3*6, x4*6, y1*6, y2*6, y3*6, y4*6);
fill(110);
quad(x1*5, x2*5, x3*5, x4*5, y1*5, y2*5, y3*5, y4*5);
fill(120);
quad(x1*4, x2*4, x3*4, x4*4, y1*4, y2*4, y3*4, y4*4);
fill(130);
quad(x1*3, x2*3, x3*3, x4*3, y1*3, y2*3, y3*3, y4*3);
fill(140);
quad(x1*2, x2*2, x3*2, x4*2, y1*2, y2*2, y3*2, y4*2);
fill(160);
quad(x1, x2, x3, x4, y1, y2, y3, y4);
fill(180);
quad(x1/2, x2/2, x3/2, x4/2, y1/2, y2/2, y3/2, y4/2);

}

void mousepressed() {
 saveFrame("line-####.png"); 
}

