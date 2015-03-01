
Walker[] w = new Walker[10];
int spacing = 3;
int speed = 3;
 
void setup() { 
  size(400, 400);
  for(int i = 0; i<w.length; i++){
    w[i] = new Walker();
  }
  background(255); 
 
}
 
void draw() {
  fill(255,5);
  rect(0,0,width,height);
  for(int i = 0; i<w.length; i++){  
    w[i].step();
    w[i].display();
  }
}
 
class Walker {
  int x, y;
   
  Walker() {
    x = width/2;
    y = height/2;
  }
   
  void display() {
    noStroke();
    fill(0);
    rect(x,y,spacing,spacing);
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
