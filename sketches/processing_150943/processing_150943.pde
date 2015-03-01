
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79607*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage img;
int mod = 1;
int s =8;
void setup() {
    size( 512, 512 );
    img = loadImage("rgb.png");
    rectMode(CENTER);
}
void draw() {
  background(0);
  for (int i = 0; i < width; i+=s) {
    for (int j = 0; j < height; j+=s) {
      int px1 = i + round(s/2);
      int py1 = j + round(s/2);
      int   c1 = img.get( px1, py1 );
      float r1 = map( brightness( c1 ), 0, 255, 0, s);
      float bl1 = map( blue( c1 ), 0, 255, 0, s);
      float re1 = map( red( c1 ), 0, 255, 0, s);
      float gr1 = map( green( c1 ), 0, 255, 0, s);
      fill( c1 );
      stroke( c1 );
      if (j % 20 == 0) {
        int x1 = px1;  
        int y1 = py1 - round(bl1/2);
        int x2 = px1 - round(re1/2);
        int y2 = py1 + round(re1/2);
        int x3 = px1 + round(gr1/2);
        int y3 = py1 + round(gr1/2);
        triangle(x1, y1, x2, y2, x3, y3);
      } else {
        int x1 = px1;  
        int y1 = py1 + round(bl1/2);
        int x2 = px1 - round(re1/2);
        int y2 = py1 - round(re1/2);
        int x3 = px1 + round(gr1/2);
        int y3 = py1 - round(gr1/2);
        triangle(x1, y1, x2, y2, x3, y3);
      }
      int px2 = i + s;
      int py2 = j + round(s/2);
      int   c2 = img.get( px2, py2 );
      float r2 = map( brightness( c2 ), 0, 255, 0, s);
      float bl2 = map( blue( c2 ), 0, 255, 0, s);
      float re2 = map( red( c2 ), 0, 255, 0, s);
      float gr2 = map( green( c2 ), 0, 255, 0, s);
      fill( c2 );
      stroke( c2 );
      if (j % 20 == 0) {
        int x4 = px2;  
        int y4 = py2 + round(bl2/2);
        int x5 = px2 - round(re2/2);
        int y5 = py2 - round(re2/2);
        int x6 = px2 + round(gr2/2);
        int y6 = py2 - round(gr2/2);
        triangle(x4, y4, x5, y5, x6, y6);  
      } else {
        int x4 = px2;  
        int y4 = py2 - round(bl2/2);
        int x5 = px2 - round(re2/2);
        int y5 = py2 + round(re2/2);
        int x6 = px2 + round(gr2/2);
        int y6 = py2 + round(gr2/2);
        triangle(x4, y4, x5, y5, x6, y6);  
      }
    }
  }
}



