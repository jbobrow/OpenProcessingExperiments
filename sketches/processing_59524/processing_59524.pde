
//Problem Set 3.5
//by: Nathan Smofsky

Circle[] circles = new Circle[500];
 
boolean paused = false;
 
void setup() {
  size(500, 500); 
  smooth();

  for (int i=0; i < circles.length; i++) {
   
  float x = random(width);
  float y = random(height);

  
    circles[i] = new Circle(x, y);
  } 
}
 
void draw() {
  background(0);
 
  int numRect = int(map(mouseY, 0, height, 0, circles.length));
   for (int i=0; i < numRect; i++) {
    
      circles[i].display();
    }
  }
  
  class Circle {
  float x;
  float y;
  color c;
 
 
  Circle( float x, float y ) {
    this.x = x;
    this.y = y;
  } 
   

  void display() {
    rectMode(CENTER);
    pushMatrix();
      translate(this.x, this.y);
     
      c = int( map(c, 0, width, 0, 255) );
      fill(mouseX, 255, mouseY);

      ellipse(0, 0, 120, 15);
    popMatrix(); 
  }
}

