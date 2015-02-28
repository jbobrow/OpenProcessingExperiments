
static int n = 50;
boolean drawing = true;
int[] xs = new int[n];
int[] ys = new int[n];
 
void setup(){
  size(600,400);
}
 
void draw(){
  if(! drawing){
    return;
  }
  background(200,0,50); 
  for(int i = 0; i < n-1; i++){
    xs[i] = xs[i+1];
    ys[i] = ys[i+1];
  }
  xs[n-1] = mouseX;
  ys[n-1] = mouseY;
  for(int i = 0; i < n; i++){
      for(int x = 50; x < 600; x += 100){
    for(int y = 50; y < 400; y += 100){
      int r = (int)random(100);
      int g = (int)random(150);
      int b = (int)random(256);
      fill(r,g,b);
    ellipse(xs[i], ys[i], 20+2*i,20+2*i);
  }
      }
  }
}
