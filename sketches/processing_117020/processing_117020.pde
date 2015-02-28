
/*
1023 class Wiggly line
different opacity of the lines overlap 
by KokFu Lok
*/
void setup() {
  size(500, 500);
 frameRate(3);
 background(255);
 //noLoop();
}
void draw() {
  //background(255);
  strokeWeight(5);
  stroke(0, 30);
 // line(20, 50, 480, 50);
  //stroke(20, 50, 70);
  int step = 10;
  float nlevel = 0.1;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(400);
  float y=100;
  int border = 20;//how many offset from the end & begin
  for (int x=border; x<=width-border;
x+=step) {
      y = 100 + noise(ynoise)*400;
    if (lastx > -999) {
   strokeWeight(noise(10)*2);
      stroke(random(10,20),random(100,255), random(70,150),random(30,90));
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += nlevel;
  }
}



