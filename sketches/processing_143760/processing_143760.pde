
int x;
  void setup () {
  size (500,500);
  background(0);
  x = 15;
  smooth();
}
 
void draw () {
 
 int s = second ();
 stroke(255);
 strokeWeight(3);
 fill(#D9EDD7);
 ellipse(width, height, s*x, s*x);
   
}
