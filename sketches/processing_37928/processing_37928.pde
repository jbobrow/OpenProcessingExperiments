
void setup() {
  noLoop();
  size (800, 800);
  background (000);
  smooth();
}

void draw (){
  for (int i=0; i<800; i=i+200) {
     for (int j=0; j<800; j= j+170) {
         rubix (i, j, random(100,255), random(100,255), random(100,255));
   }
  }
}


void rubix(int X, int Y, float R, float G, float B) {
  strokeWeight(3);
  strokeJoin(ROUND);
  fill (0,0,B);
  quad (X,Y, X+100, Y-50, X+200, Y, X+100, Y+70);
  fill (R,0,0);
  quad (X,Y, X+100, Y+70, X+100, Y+210, X, Y+150);
  fill (0,G,0);
  quad (X+100, Y+70, X+200, Y, X+200, Y+150, X+100, Y+210);
  line (X+33, Y-16, (X+100)+32, (Y+70)-22);
  line (X+66, Y-32, (X+100)+64, (Y+70)-44);
  line (X+33, Y+20, (X+100)+32, Y-33);
  line (X+66, Y+44, (X+200)-34, Y-17);
  line (X+66, Y+44, X+66, (Y+150)+38);
  line (X+33, Y+20, X+33, (Y+150)+20);
  line ((X+100)+32, (Y+70)-22, (X+100)+32, (Y+150)+38);
  line ((X+100)+64, (Y+70)-44, (X+100)+64, (Y+150)+22);
  line (X, Y+50, X+100, (Y+70)+50);
  line (X, Y+100, X+100, (Y+70)+100);
  line (X+100, (Y+70)+50, X+200, Y+50);
  line (X+100, (Y+70)+100, X+200, Y+100 );
}                             
