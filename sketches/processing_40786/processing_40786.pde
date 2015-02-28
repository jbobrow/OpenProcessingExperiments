
void setup() {
  size (600, 400);
  background (180);
  smooth();
}
  
int m = millis();
int p = 0;
  
void draw() {
  noStroke();
  fill(180, 30);
  rect(0,0,width,height);
  stroke (255);
  strokeWeight(2);
  fill(40);
  ellipse(mouseX,mouseY,15,15);
  m = millis()-p;
  int dimensione = m;
  fill(40, 30);
  
 if(mousePressed)
 ellipse (mouseX,mouseY,dimensione+5,dimensione+5);
 
}
 
void mousePressed() {
    p=millis();
  }

