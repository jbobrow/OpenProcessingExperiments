
Eye e1, e2, e3, e4;

void setup() {
  size(640, 360);
  noStroke();
  e1 = new Eye( 350, 50,   220);
  e2 = new Eye( 164, 185,  80);  
  e3 = new Eye( 420, 230, 220);
 
}

void draw() {
  background(102);
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);

  e1.display();
  e2.display();
  e3.display();
  
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
    float l = 0.0;
    pushMatrix();
    translate(x, y);
    fill(255);
    stroke(100);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(153, 204, 0);
    
    if (size <=300){
      noStroke();
      ellipse((size++)/4, 0, (size++/4), size/2);
      fill(3, 4, 0,50);
      ellipse((size++)/4, 0, (size++/20), size/10);
    } 
    strokeWeight(3);
    
    stroke(0);
    pushMatrix();
    translate(size/4,0);
    line(size-size/4, 0, angle, angle);
    popMatrix();
    noStroke();
    popMatrix();
    if (size >=290){
      size = 0;
    }
    

    
  }
}
