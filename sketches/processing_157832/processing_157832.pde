
float[] x = new float[100];
float[] y = new float [100];  //could be {2,4,5,6}; 
float[] speed = new float [100];;

void setup(){
  size(500,500);
  background(0);
  stroke(200,200,233);
  noCursor();
  
  
  int i = 0;
  while(i < 100) {
  x[i] = random(0, width);
  y[i] = random(0, height);
  speed[i] = random(1,5);
  i = i + 1;
  }
}

void draw() {
  background(0);
  
 
  
  int i = 0;
  while ( i < 100) {
    float co = map(speed[i], 1,5,100,255);
    stroke(co);
    strokeWeight(speed[i]);
  point(x[i],y[i]);
  x[i] = x [i]- speed[i] / 2;
  if(x[i] < 0) {
    x[i] = width;
  }
  i = i + 1;
  }
  
}
  
