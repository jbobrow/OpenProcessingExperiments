
int num = 100;
float[] x = new float [num];// array for x coordinate
float[] y = new float [num];// array for y coordinate
 
void setup(){
  size (400,400);
  smooth();
   
  for(int h = 0; h < x.length; h++) {
    x[h] = random(width);   
  }
for(int i = 0; i < y.length; i++){
  y[i]= random (height);
}
}
 
 
void draw() {
  background(0);
  fill(200,0,0);
   
  for(int h = 0; h <num; h++){
    rect((width/x.length)*h, x[h],2,5);
    x[h] = x [h]+1;
    if(x[h] >width) x[h] = 0 ;
  }
  fill(255);
   for(int i = 0; i< num; i++){
    rect((height/y.length)*i, y[i],2,5);
    y[i] = y[i]+1;
    if(y[i] > width) y[i] = 0 ;
   
}
}


