
//Kim Sipkens
//PS3 Question 5
Rectangle[] rects = new Rectangle[400];
 
boolean paused = false;
 
void setup() {
  size(400, 400); 
  smooth();
rectMode(CENTER);
  

  for (int i=0; i < rects.length; i++) {
   
  float x = random(height);
  float y = random(width);

  
    rects[i] = new Rectangle(x, y);
  } 
}
 
void draw() {
  background(255);
 
  int numRect = int(map(mouseX, 0, height, 0, rects.length));
   for (int i=0; i < numRect; i++) {
    
      rects[i].display();
    }
  }

 class Rectangle {
  float x;
  float y;
  color c;
 
 
  Rectangle( float x, float y ) {
    this.x = x;
    this.y = y;
  } 
   

  void display() {
    rectMode(CENTER);
    stroke(3);
    pushMatrix();
      translate(this.x, this.y);
     
      c = int( map(c, 26, height, 83, 255) );
      fill(mouseX, mouseY, c);

      rect(0, 0, 50, 50);
    popMatrix(); 
  }
}

