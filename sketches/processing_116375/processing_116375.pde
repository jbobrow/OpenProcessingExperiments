
//Eunsil Choi 10/19/2013

int num_circles = 200;
int[] x_values = new int[num_circles];
int[] y_values = new int[num_circles];

void setup() {
  size(400, 500);
  for (int i = 0; i<x_values.length; i++) {
    x_values[i] = int(random(width))-1;
  }
  for (int i = 0; i<y_values.length; i++) {
    y_values[i] = int(random(height))-3;
  }
}
void draw() {
  background(125, 140, 190);
      
  for (int i = 0; i<x_values.length; i ++) {

    
    noStroke();
    fill(200, 200, 150,random(255));
    ellipse(x_values[i]+3, y_values[i]+4, 20, 20);
    ellipse(x_values[i], y_values[i]+2, 90, 90);
    
    fill(100, 40, 150,random(255));
    ellipse(x_values[i]+4, y_values[i]-9, 30, 30);
    ellipse(x_values[i]+1, y_values[i]+3, 70, 70);
    
    fill(90, 140, 150,random(255));
    ellipse(x_values[i]-1, y_values[i], 10, 10);
    ellipse(x_values[i]+5, y_values[i]+6, 50, 50);
   
   x_values[i] = (x_values[i]) +2;
   y_values[i] = (y_values[i]) ;
    
  }
}
