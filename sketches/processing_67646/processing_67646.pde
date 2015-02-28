
  void setup () {
    size (2000, 2000);
    background(0);
    
    smooth();
    noStroke();
  }
    
    void draw () {
    fill(random(255),random(255),random(255));
      ellipse (mouseX, mouseY, random(100), random(100)); 
    
    }
  

