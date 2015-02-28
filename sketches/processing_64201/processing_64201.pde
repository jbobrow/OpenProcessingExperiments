
float x = 0;
float y = 0;
float speedx = random (10);
float speedy = random (10);
  void setup() {
  size(800,800);
  frameRate(20);
    background(50);


}
void draw() {
  

 
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
  fill(a,mouseY,mouseX);
  noStroke();
  rect(x,y,a/2,80);

 
}
void mousePressed () {
    
  background(50);
    
}
  
void keyPressed () {
    
  saveFrame ("test.png");
    
}


