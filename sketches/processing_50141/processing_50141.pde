
int numCircle = 1500;
Circle[] circles = new Circle[numCircle];
   
void setup()
{
  size(800,400);
  frameRate(50);
  for(int i=0; i<numCircle; i++) {
    circles[i] = new Circle(random(width), random(height), random(5, 10)*5);
  }
  for(int a=1; a<numCircle;a++) {
    circles[a] = new Circle(random(width), random(height), random(10, 5)*5);
  }
    
  background(100);    
 fill(100);
}
   
   
void draw(){

  for(int i=0; i<numCircle; i++) {
      circles[i].update();
  }
  for(int a=0; a<numCircle; a++) {
      circles[a].update();
        if((mouseX>300)&&(mouseX<600)){
    fill(random(200),random(200),random(100));
    stroke(0);
        }
    if((mouseY>150)&&(mouseY<250)){
      stroke(random(200),random(150),random(100));
    }
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
    rect(x,y-40,r-20,r-20);

  fill(random(mouseX),random(mouseY));
  }
}


  
