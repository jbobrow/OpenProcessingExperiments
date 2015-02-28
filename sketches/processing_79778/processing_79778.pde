
void setup() {

size(500,500);
colorMode(HSB,360);
}
float mouseX1[] = new float[100];
float mouseY1[] = new float[100];
 
 
 
void draw() {
 
fill(random(360),360,360);
  background(color(0));
  rectMode(CENTER);
  for (int i=90; i>0; i--) {
    
    mouseX1[i] = mouseX1[i-1];
    mouseY1[i] = mouseY1[i-1];
  rect(mouseX1[i],mouseY1[i],10+i*0.5,10+i*0.5);
  }
  mouseX1[30] = mouseX;
  mouseY1[30] = mouseY;
 
}

