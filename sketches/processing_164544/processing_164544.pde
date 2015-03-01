
float[] x = new float[11];
float[] y = new float[11];

void setup(){
  size(400,400);
  smooth();
  for(int i = 0; i < x.length; i++){
    x[i]= width/2 + random(-20,20);
    y[i] = i*40;
  }
}

void draw(){
  background(100);
  stroke(255,255,0,100);
  strokeWeight(5);
  // Set a random value for X
  for(int i = 0; i < 10; i++){
    x[i]= width/2 + random(-40,40);
  }

  for(int i = 0; i < y.length-1; i++){
    line(x[i], y[i], x[i+1], y[i+1]); 
  }
}

