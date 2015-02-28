
Eye e1, e2;

void setup(){
size(450,450);

smooth();

  
 e1 = new Eye( 310,  172, 75);
  e2 = new Eye( 180, 252,  75);
  
}


void draw(){
  background(40);
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  
  
   e1.display();
  e2.display();
  

  
  
}

class Eye {
  
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
    
  }

  
  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    
   //face
 fill(#7ba32d);
  ellipse(350,380, 350,350);
  noStroke();   
  
    pushMatrix();
    translate(x, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0,0,0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
    
  
  }
}
  


