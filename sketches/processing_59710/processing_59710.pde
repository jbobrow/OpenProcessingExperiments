
void setup() {
  size(700, 700);
  
  rectMode(CENTER);
  
  
}

void draw() {
  background(0);
  if(mousePressed) {
    noStroke();
    fill(255);
    ellipse(width/2, height/2, mouseX, mouseY);
  }else{
    stroke(5);
    fill(100);
    rect(width/2, height/2, 200, 500);
  }
  
}



