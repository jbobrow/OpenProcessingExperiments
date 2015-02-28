
/*   Jeff Hendrickson  14 Sept 09
       This code plays with quads.  Mess around with the variable and see what
       you can come up with.
       */


//int i = 1;
int x1 = 150;
int y1 = 150;
int x2 = 200;
int y2 = 140;
int x3 = 160;
int y3 = 200;
int x4 = 150;
int y4 = 400;

void setup() {
size(600,400);  // w x h
background(255);
smooth();
//noStroke();
}
void draw()  {

for (int i =1; i<30; i++) {  //larger numbers make more varied angles
  fill(random(20, 200), random(10,100), random(50, 150), random(50, 175));
  noStroke();
  quad(x1+250, y1+250, x2+250, y2+250, x3+250, y3+250, x4+250, y4+250);
  x1 +=random(-20,20);
  y1 +=random(-20,20);
  x2 -=random(-20,20);
  y2 +=random(-20,20);
  x3 -=random(-20,20);
  y3 +=random(-20,20);
  x4 -=random(-20,20);
  y4 +=random(-20,20);
}

if (millis() >= 7000) {
  noLoop();
}
}
/*void mousePressed()  {                 Use this to save
  save("quadV9painter_1200.png");
} */

