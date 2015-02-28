
int x, y; 
int eSize;

void setup() {
  size(600, 600);
  smooth();
  background(0);
}
 
void draw() {
  
}

void keyPressed() {
  
  
 
 
  switch(key) {
    case 'a': 
    background(0);    //keshigomu
    break;
    
    case'c':
    noStroke();
  fill(mouseX,mouseY,255);
    ellipse(mouseX,mouseY, 30,30);
    break;
    
    case'r':
    noStroke();
  fill(mouseX,mouseY,255);
  rect(mouseX, mouseY,30,30);
    break;
    
    case't':
    noStroke();
  fill(mouseX,mouseY,255);
    triangle(mouseX,mouseY, 180, 180, 20, 180);
    break;
  }
}





