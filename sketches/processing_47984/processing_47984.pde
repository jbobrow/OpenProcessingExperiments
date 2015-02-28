
int[] n = new int[500]; //SRW bar graph
int[] N = new int[500];//RWRE bar graph
float[] w = new float[500];
int x0 = 250;
int X0 = 750;
int y0 = 790;
int a = 0;
int y = 0;
int x = 0;
int X = 0;
PFont fontA;
 
void setup() {
  size(1000,800);
  fontA = loadFont("AppleBraille-Pinpoint8Dot-20.vlw");
  textFont(fontA, 20);
  smooth();
  background(255,255,255);
  fill(0);
  text("Simple Random Walk",50,100);
  text("Annealed RWRE",550,100);
  for (int i = 0; i < n.length; i++) {
    n[i] = 0;
    N[i] = 0;
  }
}
 
void draw() {
  a = a+1;
  point(250,540);
  point(750,540);
  if (a < 100000) {
    for (int i = 0; i < w.length; i++) {
    if(random(0,2)<=1){
    w[i]=0.5;
    }
    else{
    w[i]=1.5;
    }
  }
    y = y0;
    x = x0;
    X = X0;
    while (y>400) {
      float Blabla = random(0,2);
      stroke(0, 0, 0, 100);
      if (Blabla <= w[X-500]) {
        line(X,y,X+4,y-2);
        y=y-2;
        X=X+4;
      }
      else if (Blabla <= 2) {
        line(X,y,X-4,y-2);
        y=y-2;
        X=X-4;
      }
      float blabla = random(0,2);
      stroke(0, 0, 0, 100);
      if (blabla <= 1) {
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
    rect(X+1,y-3*N[X-500],-3,-3);
    n[x] = n[x] + 1;
    N[X-500]=N[X-500]+1;
  }
}

