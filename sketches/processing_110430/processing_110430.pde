
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
  background(127);  
  for(int i = 0; i < n-1; i++){
    xs[i] = xs[i+1];
    ys[i] = ys[i+1];
  }
  xs[n-1] = mouseX;
  ys[n-1] = mouseY;
  for(int i = 0; i < n; i++){
    ellipse(xs[i], ys[i], 20+2*i,20+2*i);
  }
}

void keyPressed(){
  drawing = !drawing;
}
