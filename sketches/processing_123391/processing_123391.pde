
Rectangle[] rects; 

void setup() {
  size(400,200);
  rects = new Rectangle[100];
  for(int i = 0; i < 100; i++) {
    rects[i] = new Rectangle(i*10, 50);
  }
  smooth();
}

void draw() {
  background(0);  
  for(int i = 0; i < 100; i++) {
    rects[i].glow();
    rects[i].render();
  }
}

class Rectangle{
  
  float x,y;
  float alpha;
  float alphaChange;
  color c;
  
  Rectangle(float nx, float ny){
    x = nx;
    y = ny;
    c = color(random(255),random(255),random(255));
    alpha = random(99);
    alphaChange = random(-2,2);
  }
  
  void glow(){
    alpha  += alphaChange; 
    if(alpha <= 1 || alpha > 200)alphaChange*=-1;
  }
  
  void render(){
    fill(c,alpha);
    rect(x,y,20,100);
  }
}


