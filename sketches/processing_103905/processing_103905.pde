
float r = 0;

void setup() {
  size (1280, 800);
  background (#DEDEDE);
  
}

  void draw() {
    
    
    rectMode(CENTER);
    fill(#FCCDB8, 30);
    noStroke();
    rect(width/4, height/2, width, height);
    
    //rect(width/1, height/2, width, height);
    //rectMode(CENTER);
    
    fill(random(255), random(255), random(255));
    translate(mouseX, mouseY);
    noStroke();
    smooth();
    rotate(r);
    rect(0, 9, width/6, height/8);
    
    r = r + 0.1;
    
  }
