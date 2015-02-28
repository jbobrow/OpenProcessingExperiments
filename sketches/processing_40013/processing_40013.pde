
int numCircle = 800;
Circle[] circles = new Circle[numCircle];
  
void setup()
{
  size(600,600);
  frameRate(50);
  for(int i=0; i<numCircle; i++) {
    circles[i] = new Circle(random(width), random(height), random(5, 10)*5);
  }
  for(int a=1; a<numCircle;a++) {
    circles[a] = new Circle(random(width), random(height), random(10, 5)*5);
  }
   

  background(100);
    
 fill(247,70,random(255));
   
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
    rect(x-1,y-1,r-y/width,r/2);
   
  fill(mouseX,random(255));
  }
}
