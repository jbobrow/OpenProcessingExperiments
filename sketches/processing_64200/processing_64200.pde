
float x = 0;
float y = 0;
float speedx = random (10);
float speedy = random (10);
  void setup() {
  size(800,800);

}
void draw() {
  fill(200,200,200,90);
  rect(0,0,width,height);
  x = x + speedx * mouseY/200;
  y = y + speedy;
  if ((x > height) || (x < 0)) {
    speedx = speedx * -1;
  }
  if ((y > width) || (y < 0)) {
    speedy = speedy * -1;
  }
  
  int a = (int)random(255);
  int b = (int)random(255);
  int c = (int)random(255);
  fill(200,25,255);
  ellipse(x,y,80,80);
  noStroke();

 
}
void mousePressed () {
    
  background(255,200,220);
    
}
  
  void keyPressed() {
  saveFrame("test.png");
}
 


