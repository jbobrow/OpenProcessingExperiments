
int object=200;
int[] x= new int[object];
int[] y= new int[object];
void setup() {
  size (300, 300);
  noStroke();
  for (int i=0; i<x.length; i++){
    x[i]=int(random(width));
    y[i]=int(random(height));
  }
}
void draw(){
  background(0);
  for(int i=x.length-1;i>0;i--) {
    x[i]=x[i-1];
    y[i]=y[i-1];
  }
  x[0] = mouseX;
 for(int counter=0; counter<x.length; counter++){
   fill(counter,counter,counter);
    ellipse(x[counter], y[counter], 30, 30);
  }
}
