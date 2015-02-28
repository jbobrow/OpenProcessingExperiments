
int numCircle = 2000;
Circle[] circles = new Circle[numCircle];
   
void setup()
{
  size(800,400);
  frameRate(60);
  for(int i=0; i<numCircle; i++) {
    circles[i] = new Circle(random(width), random(height), random(5, 10)*5);
  }
  for(int a=1; a<numCircle;a++) {
    circles[a] = new Circle(random(width), random(height), random(10, 5)*5);
  }
    
 
  background(100);
     
 fill(100);
    
}
   
   
void draw()
  
{
  for(int i=0; i<numCircle; i++) {
      circles[i].update();
  }
  for(int a=0; a<numCircle; a++) {
      circles[a].update();
  }
}
   
class Circle {
    float x, y, r;
          Circle( float xp, float yp, float rp) {
          x = xp; y = yp; r = rp;
  }
    
  void update() {
  /*
  rect is connect in circle.
  */
    rect(x-20,y-20,r-20,r-20);
    rect(x,y,r-20,r-20);

  fill(random(mouseX),random(mouseY));
  }
}
                                                                
