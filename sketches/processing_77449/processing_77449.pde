
int a;

void setup()
{
  size(300, 150);
  a = 100;
  int b = 50;
}

void draw()
{
  println("a is a global variable.");
  println("So, even though it was assigned in another block of code,");
  println("that assignment can be accessed anywhere. a = " + a);
  
  println("b is a local variable.");
  println("It can only be accessed inside the block of code it was assigned in (i.e. setup)");
  println("How could you make the b variable visible for this block of code? b = " + b);
}
