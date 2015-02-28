
int[] trail_x;
int[] trail_y;
int index = 0;
 
void setup() {
  size(700,400);
  smooth();
  trail_x = new int[60];
  trail_y = new int[60];
}
 
void draw() {
  background(3,0,0);
  
  
  stroke(0, 128);
  for (int i=0; i < trail_x.length; i++) {
     
    int pos = (index+i) % trail_x.length;
     
    
    fill(map(i, 5, trail_x.length, 0, 250), 38, 255, 50);   
    ellipse(trail_x[pos], trail_y[pos], 50+i, 50+i); 
  }
}

 
void mouseMoved() {
  trail_x[index] = mouseX;
  trail_y[index] = mouseY;
  index++;
  if (index >= trail_x.length) index = 0;
}




