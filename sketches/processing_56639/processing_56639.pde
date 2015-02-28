
int num = 50;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(600, 400);
  smooth();
 noCursor();
  noStroke();
  fill(230,125,0, 100);
 
}

void draw() {
  //color(230,125,100);
  
  background(10); 

  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 20; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+8 + i) % num;
    rect(mx[index], my[index], i/2, i/2);
  }
}

