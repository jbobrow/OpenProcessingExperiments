
Circle myCircle;
int dia = 50;
void setup() {
  size(700, 400);
  myCircle = new Circle();
}
void draw() {
  background(255,mouseX/4,mouseY/4);
 
//ellipseMode(CENTER);
  for (int x=0; x<width+dia; x+=dia) {
    for (int y=0; y<height+dia; y+=dia) {
      myCircle.display(x,y,dia);
    }
  }
}
class Circle {
  void display(int x, int y, int dia) {
    stroke(mouseX,255,mouseY);
    smooth();
    fill(mouseX+x/10,mouseY/2,255);
    ellipseMode(CENTER);
    ellipse(x, y, dia, dia);
    
  }
}

