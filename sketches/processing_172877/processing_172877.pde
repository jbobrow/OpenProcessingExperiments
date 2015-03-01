
size(1200, 700);
background(89, 98, 235);
int x = 0;
int y = 0;

for (int i = 1; i <= 500; i++) {
  x=0;
  for (int j=1; j<=500; j++) {
    strokeWeight(2);
    stroke(random(255), random(255), random(255), 255);
    point (x, y);
    //line(random(800),random(600),random(800),random(600));
    //point(x, y);
    x=x+5;
    //y=y+4;
  }
  y=y+5;
}
strokeWeight(10);
stroke(random(255), random(255), random(255));
fill(0, 255, 0);
rect(100, 100, 300, 200);
strokeWeight(10);
stroke(2, 176, 101);
fill(0, 0, 255);
triangle(600, 500, 850, 600, 600, 200);
stroke(100, 0, 100);
fill(40, 100, 50);
ellipse(100, 500, 110, 80);
