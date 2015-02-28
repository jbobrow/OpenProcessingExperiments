
int[] x= new int[100];
int[] y= new int[100];
int[] x1=new int[100];
int[] y1=new int[100];


void setup() {
  size(600, 400);
  background(0);
//noStroke();
}
void draw(){
  for (int i=0; i<100; i++){
  x[i]=mouseX*i;
  y[i]=mouseY*i;
  }
  
for (int i=0; i < 100 ; i++){
  println(i*5);
  fill(255,70,30);
  ellipse(x[i], y[i],i,i);
  ellipse(x1[i],y1[i],i,i);
 
}
}




