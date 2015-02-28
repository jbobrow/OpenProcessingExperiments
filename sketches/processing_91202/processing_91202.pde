
void xbox(float x, float y, float s){
    strokeWeight(5);
    stroke(0, 255, 0);
    line(x - s/2, y - s/2, x + s/2, y + s/2);
    line(x - s/2, y + s/2, x + s/2, y - s/2);
    stroke(0);
    noFill();
    rectMode(CENTER);
    rect(x, y, s, s);
    strokeWeight(20);
    stroke(255, 0, 0);
    point(x, y);
    }
    
void setup(){
    size(500, 500);
    smooth();
  }
  
void draw(){
    xbox(width/2, height/2, 350);
    }
