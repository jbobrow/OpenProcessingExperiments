
////GSwP 5.1 The draw() Function
//
//void draw()
//{
//  println("I'm drawing");
//  println(frameCount);
//}

//GSwP 5.1 The setup() Function

//void setup()
//{
//  println("I'm starting");
//}
//
//void draw()
//{
//  println("I'm running");
//  println(frameCount);
//}

//GSwP 5.3 setup(), Meet draw()

int x = 280;
int y = -100;
int diameter = 380;

void setup()
{
  size(480, 120);
  smooth();
  fill(102);
}

void draw()
{
  background(204);
  ellipse(mouseX, y, diameter, diameter);
}
