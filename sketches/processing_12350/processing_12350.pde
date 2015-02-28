
int num = 90;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(600, 200);
  smooth();
  noStroke();
  fill(255, 153,0); 
}

void draw() {
  background(100); 
  int which = frameCount % 90;
  mx[which] = mouseX;
  my[which] = mouseY;
  

  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i/2, i/2);
  }
}


