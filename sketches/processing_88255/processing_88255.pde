
int s=.001;
 int[] x = new int[1000];
 int[] y = new int[1000];
 int[] sz = new int[1000];
 
  for (int i=0;i<1000;i++){
  sz[i]=random(50);
  x[i]=random(1000)-random(1000);
 y[i]=random(1000)-random(1000);
  }

void setup() {
  size(600, 600);
  noStroke();
 }
 
void draw() {
translate(300,300);
  background(0);
  
scale (s);
 for (int i=0;i<1000;i++){
   fill(sz[i]*5); 
  ellipse(x[i],y[i],sz[i],sz[i]);
  }
s=s*1.02;

}
