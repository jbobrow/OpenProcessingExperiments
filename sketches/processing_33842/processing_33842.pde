

int num=2;
int[] x= new int[num];
int[] y = new int[num];


void setup() {
  size(500,500);
  noFill();
  stroke(0);
  smooth();
  background(255);
 
}


void draw() {
  for(int i=1; i<num; i++) {
    x[i-1]=x[i];
    y[i-1]=y[i];
  }
}

void mouseClicked() {
  for(int i=1; i<num; i++) {
    x[i]=mouseX;
    y[i]=mouseY;
    line(x[i-1],y[i-1],x[i],y[i]);
    ellipse(mouseX,mouseY,5,5);
  }
}


