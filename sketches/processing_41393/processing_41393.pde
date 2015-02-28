
int[] trail_x;
int[] trail_y;
int index = 0;
 
void setup() {
  size(700,400);
  smooth();
  trail_x = new int[80];
  trail_y = new int[80];
}
 
void draw() {
  background(3,0,0);
 
  
  stroke(0, 128);
  for (int i=0; i < trail_x.length; i++) {
     
    int pos = (index+i) % trail_x.length;
     
    fill(map(i, 10, trail_x.length, 0, 250), 385, 250, 50);   
    ellipse(trail_x[pos], trail_y[pos], 5+i, 5+i); 
  }
}

 
void mouseMoved() {
  trail_x[index] = mouseX;
  trail_y[index] = mouseY;
  index++;
  if (index >= trail_x.length) index = 0;
}




