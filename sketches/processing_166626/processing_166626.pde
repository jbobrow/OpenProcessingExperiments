
int[] x = new int[20];
int[] r = new int[20];
int[] g = new int[20];
int[] b = new int[20];

void setup(){
  background(0);
  int i;
  frameRate(10);
  size(1000, 600);
  for(i = 0;i < 20;++i){
    x[i] = 20*i;}
  
  for(i = 0;i < 20;++i){
    r[i] = 10*i;
    g[i] = (10*i + 100)%256;
    b[i] = (10*i + 200)%256;
  }
}

void draw(){
  int i;
  float y = 1;
  y += 10;
  for(i = 0; i < 20; i++){
    x[i] += 1;
    y += 20;
    noStroke();
    fill(r[i], g[i], b[i]);
    ellipse(x[i], y, 10*i, 10*i);
  }
}
    


