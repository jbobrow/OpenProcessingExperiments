
int[] x= new int [100];
int[] y= new int [100];


void setup(){
  noStroke();
 size(800,600); 
}

void draw(){
  background(0);
  x[x.length-1] = mouseX;
  y[y.length-1] = mouseY;
for (int i =0; i <x.length-1;i++){
x[i] = x[i+1];
y[i] = y[i+1];
fill(i*2,i*2);
ellipse(x[i],y[i],i,i);
}  
}

