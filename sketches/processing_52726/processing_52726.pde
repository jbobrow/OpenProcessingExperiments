
   
  void setup() {
    size (500,500);
    background(0);
    strokeWeight(20);
    noCursor();
  frameRate(30);
  }
  void draw() {
  background(255);
  line (mouseX,mouseY,pmouseX,pmouseY);  
  }

