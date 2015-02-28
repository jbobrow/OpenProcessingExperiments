
int x = 63;
int r = 85; 
int n = 6; 

void setup () {
size(800,500);
background (242,204,47);
noStroke();
smooth ();
noLoop ();
}
void draw (){
drawCircle (395, 350, 6);
}
void drawCircle(int x, int radius, int num) {
  float tt = 176* num/4.0;
  fill (tt);
  ellipse(x,235, radius*1, radius*1);
  if (num > 1) {
    num = num -1;
    drawCircle (x - radius/2, radius/2, num);
 drawCircle (x + radius/2, radius/2, num);
 }
 }


