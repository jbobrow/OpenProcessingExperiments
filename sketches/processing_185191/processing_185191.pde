
float x=mouseX;
float y=mouseY;
float x2=mouseX;
float y2=mouseY;
float jsa= 0.01;
float jsaa= 0.05;
void setup() {
  size(800,600);
  stroke(10,80);
  background(250);
  frameRate(100);
} 
  
void draw() {
  if (mousePressed && (mouseButton == LEFT)){
    strokeWeight(0.2);
    x+=(mouseX-x)*jsa;
    y+=(mouseY-y)*jsa;
    x2+=(mouseX-x2)*jsaa;
    y2+=(mouseY-y2)*jsaa;
    line(x, y, x2, y2);
  }
  if (mousePressed && (mouseButton == RIGHT)){
    background(255);
  }
}
