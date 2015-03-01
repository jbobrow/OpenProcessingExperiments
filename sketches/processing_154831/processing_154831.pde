
Walker[] w = new Walker[10];
int spacing = 2;

void setup() {  
  size(300, 300);
  for(int i = 0; i<w.length; i++){ 
    w[i] = new Walker();
  }
  background(255);  

}

void draw() {
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
    fill(random(255),random(255),random(255));
    rect(x,y,spacing,spacing);
  }

  void step() {
    if(x>width) x = 0;
    if(y>height) y = 0;
    if(x<0) x = width;
    if(y<0) y = height;
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    x += stepx * spacing;
    y += stepy * spacing;
    
  }
}
