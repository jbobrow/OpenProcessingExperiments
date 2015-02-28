
//http://processing.org/learning/basics/arctangent.html

Eye e1;


void setup() 
{
  size(800,800);
  smooth();
  noStroke();
  background(234, 205, 192);
  for (int y = 40; y<=height; y+=80){
    for (int x = 40; x <=width; x +=80){
      fill(250);
      ellipse(x, y, 80, 80);
  e1 = new Eye(x, 120,  80);
    }
  }

}

void draw() 
{
  e1.update(mouseX, mouseY);
  e1.display();
}



class Eye 
{
  int ex, ey;
  int size;
  float angle = 0.0;
  
  Eye(int x, int y, int s) {
    ex = x;
    ey = y;
    size = s;
 }

  void update(int mx, int my) {
    angle = atan2(my-ey, mx-ex);
  }
  
  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(250);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(50);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}


