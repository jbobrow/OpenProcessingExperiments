
int[] n = new int[500];
float[] w = new float[500];
int x0 = 250;
int y0 = 790;
int a = 0;
int y = 0;
int x = 0;
 
void setup() {
  size(500,800);
  smooth();
  background(255,255,255);
  for (int i = 0; i < n.length; i++) {
    n[i] = 0;
    if(random(0,2)<=1){
    w[i]=0.5;
    }
    else{
    w[i]=1.5;
    }
  }
}
 
void draw() {
  a = a+1;
  point(250,540);
  if (a < 100000) {
    y = y0;
    x = x0;
    while (y>400) {
      float blabla = random(0,2);
      stroke(0, 0, 0, 100);
      if (blabla <= w[x]) {
        line(x,y,x+4,y-2);
        y=y-2;
        x=x+4;
      }
      else if (blabla <= 2) {
        line(x,y,x-4,y-2);
        y=y-2;
        x=x-4;
      }
    }
//    background(255,255,255);
    fill(255,0,0);
    rect(x+1, y-3*n[x], -3, -3);
    n[x] = n[x] + 1;
  }
}
                
