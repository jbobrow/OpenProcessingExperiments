
int x, y;

void setup() {
  size(500, 500);
  frameRate(100);
}

void draw() {
}
void mouseDragged() {
  stroke(100);
  fill(235, 20, 20, 500);
  rect(mouseX, mouseY, 100, 100);
 
  fill(20, 40, 234, 500);
  ellipse(mouseX, 50, 50, 100);
 
  fill(250, 235, 30, 500);
  ellipse(50, mouseY, 50, 100);
 
  fill(20, 40, 234, 500);
  ellipse(-mouseX, 250, 50, 100);
  
  fill(250, 235, 30, 500);
  ellipse(250, -mouseY, 50, 100);
}

void keyPressed() {
  background(255);
  fill(255, 0, 0);
  text(key, width/2, height/2);  

  switch(key) {
  case 'j':
    x += 5;  
    println("j");
    break;
  case 'J':
    x -= 5;    
    println("J");
    break;
  }
}


