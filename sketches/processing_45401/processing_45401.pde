
void setup()
{
  size(800,500);
  frameRate(30);
  frameRate(30);
  background(255);
  noLoop();
  smooth();
}
 class x{
  
  void Ellipse(int n) {
   if(n == 0){
   } else {
     Circle(n+1);
   Ellipse(n-1);
 }
 }
  
  void Circle(int n) {
   noStroke();
 fill(random(10,234),random(10,233),random(10,234),random(10,233));
  ellipse(random(0,600),random(0,600),n,n);
 }
   
}
 
 
 
void draw()
{
  frameRate(30);
 x y = new x();
 y.Ellipse(180);
}


