
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(640, 360);
  //noStroke();
  fill(255, 153); 
}

void draw() {
  background(255); 
  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
    line(mx[index], my[index], mx[index] + 40, my[index] + 40);
  }
}
