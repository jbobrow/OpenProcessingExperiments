
Walker[] w = new Walker[10];
int spacing = 2;
int speed = 8;
  
void setup() {
  size(400, 400);
  for(int i = 0; i<w.length; i++){
    w[i] = new Walker();
  }
  background(0);
  
}
  
void draw() {
  noStroke();
  fill(0,8);
  rect(0,0,width,height);
  for(int i = 0; i<w.length; i++){ 
    w[i].step();
    w[i].display();
  }
}
  
class Walker {
  int x, y, oldX, oldY;
    
  Walker() {
    x = width/2;
    y = height/2;
    oldX = width/2;
    oldY = height/2;
  }
    
  void display() {
    stroke(0,random(255),random(255));
    strokeWeight(spacing);
    noFill();
    line(oldX, oldY, x,y);
  }
  
  void step() {
        
    float r = random(1);
    float left, right, up, down;
    right = left = up = down = 0.1;
    
    if(r < 0.5){
      oldX = x;
      oldY = y;
    }
    
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
