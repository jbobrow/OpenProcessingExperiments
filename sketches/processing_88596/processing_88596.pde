
float x=10;
float y = 10;

void setup() {
  size(500,500);
  smooth();
  background(0);
}
 
 
void draw() {
  for (int i =0; i<width;i+= 2) {
    for(int j =0;j<height;j+= 2 ) {
      noStroke();
      fill(random(0,mouseY),random(0,mouseX),random(i,i+j));
      ellipse(x*j,y*i,mouseX*i/1000,mouseX*i/1000);
    }
  }
}
 


