

int x = 800;
int y = 100;

void setup() {
  size (800, 800);
}

void draw() {
  background(50, 50, 0);
 
  strokeWeight(5);
  fill(30, 100-x);
  line(130, 120, 600, 500);
  ellipse(400, 600, 120, 200); 
  bezier(100, 500, 300, 210, x+10, y+20, x-10, x-30);
  bezier(800, 500, 20, 100, 800, 50, 700, 600);
  x=x+10;
  y=y+5;
  point(x-10, y+10, 255);
  println(x);
  if (x>800) {
    x=-100;
  }
  if (y>800) {
    y=-800;
  }

}



