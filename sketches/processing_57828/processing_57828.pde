
//Problem Set 3
//Question 4
//Karen Wan


float x[] = new float[30];
float y[] = new float[30]; 
color c[] = new color[30];
 
void setup() {
  size(500, 500);
  smooth();

}
 
void draw() {
  background(255);
  fill(mouseX,208,mouseY);
  for (int i=0;i < width; i += 10) {
    int w = width/8;
  int h = height/8;

  for (int t=0; t < mouseX; t +=h) {
    for (int j = 0; j < mouseY; j +=h)
    {
      rect(j,t,mouseX,mouseY);
    }
  }
  }
  strokeWeight(5);
}


