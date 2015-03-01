
Walker w[] = new Walker[3];
int spacing = 15;
int speed = 15;
int pointX, pointY;
float rot = 0.0;
    
void setup() {
  size(400, 400, OPENGL);
  for(int cnt = 0; cnt < w.length; cnt++){
    w[cnt] = new Walker();
  }
  background(90);
  rectMode(CENTER);
  stroke(0);
  strokeWeight(1);
  frameRate(30);
}
    
void draw() {
  lights();
  for(int cnt = 0; cnt < w.length; cnt++){  
    w[cnt].step();
    w[cnt].display();
  }
  rot+=0.1;
  
  if(mousePressed){
      background(90);
  }
}
    
class Walker {
  int x, y;
  int size;
 
  Walker() {
    x = width/2;
    y = height/2;
    size = 1;
  }
      
  void display() {
    pushMatrix(); 
    translate(x, y, 0);
    rotateY(rot);
    rotateX(rot);
    fill(random(220),random(220),random(220));
    box(spacing+size);
    if(size>10) size = 0;
    popMatrix();
  }
    
  void step() {
  
    float r = random(1);
    float left, right, up, down;
    right = left = up = down = 0.1;
      
    if(x < mouseX){
        right = 0.4;
    } else {
        left = 0.4;
    }
    if(y < mouseY){
        down = 0.4;
    } else {
        up = 0.4;
    }
                  
    if (r < right) {
      x+=speed;
    } else if (r < right+left) {
      x-=speed;
    } else if (r < right+left+down) {
      y+=speed;
    } else {
      y-=speed;
    }
    
  }
}
