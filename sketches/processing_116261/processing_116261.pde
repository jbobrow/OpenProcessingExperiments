
int circles = 100;
int[] x = new int[circles];
int[] y = new int[circles];


void setup(){
  size(600,300);
  noStroke();
  println();
  for (int i=0; i<x.length; i++){
      x[i] = int(random(width));
      y[i] = int(random(height));
  
}
  
}

void draw(){
  background(40,200,140);
  fill(255,(mouseX+mouseY)*0.05);
  
  for (int i=0; i<x.length; i++){
      float distance = dist(i*1,i*2,mouseX,mouseY);
      
        ellipse(x[i]*0.2*i, y[i], distance, distance);
  }
    


}
