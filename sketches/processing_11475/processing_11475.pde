
PImage a;
 
int num = 100;
float mx[] = new float[num];
float my[] = new float[num];
 
void setup() {
  size(700, 700);
  a = loadImage("chumi.jpg");  // Load an image into the program
 smooth();
  noStroke();
  fill(0);
}
 
void draw() {
  image(a, 0, 0);
   
  tint(255, 153);
   int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
   
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i/2, i/2);
  }
}







