
int mx;
int my;
void setup() {
  size(400, 400);
  background(0, 0, 0);
  smooth();
}
void draw() {
  mx=mouseX;
  my=mouseY;

  noStroke();
  rectMode(CENTER);
  
  
  for (int i=0;i<=400;i=i+5) {
    for (int j=0;j<=400;j=j+5) {
      fill(random(0,255), random(0,255), random(0,255));
      rect(mx,i, 10,10);
    }
  }
  
  

}



