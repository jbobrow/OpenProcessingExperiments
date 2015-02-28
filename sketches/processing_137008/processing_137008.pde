
void setup() {  
  size(450, 450);
  background(255);    
  smooth();
  noStroke();
}

void draw(){
 }
  
 void mousePressed(){ 
 fill(255,255,102);
    ellipse(mouseX, mouseY, 100, 100);
  }
  void mouseReleased(){
  fill(0);
  ellipse((mouseX)-19, (mouseY)-18, 8, 8);
  ellipse((mouseX)+19, (mouseY)-18, 8, 8);
  arc(mouseX, (mouseY)+15, 50, 50, 0, PI+QUARTER_PI, OPEN);
  fill(255, 51, 51)
  ellipse((mouseX)+10, (mouseY)+28, 8, 8);
  }
