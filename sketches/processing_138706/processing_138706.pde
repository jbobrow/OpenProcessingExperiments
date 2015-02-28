

int i = 0; 
boolean dir = true; 
heartShape[] heart = new heartShape[111]; 


void setup() {  

  size(400, 400);  
  smooth(); 
  noStroke(); 
  background(0);

  for (int i = 0; i < heart.length; i++) heart[i] = new heartShape();
} 





void draw() {
  fill(calcBackground(), 20);
  rect(-5, -5, width+5, height+5);
  for (int i = 0; i < heart.length; i++) heart[i].move();
} 

class heartShape { 

  int x, y;
  float s = random(1, 4);
  boolean u = false;

  heartShape() {
    x = int(random(0, width));
    y = int(random(0, width));
  }
  int col = int(random(100, 255)); 

  void move() { 

    fill(col, 0, 0); 
    pushMatrix(); 
    translate(x- 50, y-=s); 
    beginShape(); 
    vertex(50, 15);  
    bezierVertex(50, -5, 90, 5, 50, 40);  
    vertex(50, 15);  
    bezierVertex(50, -5, 10, 5, 50, 40);  
    endShape(); 
    popMatrix(); 
    if (u) {
      col--;
    } 
    else {
      col++;
    }

    if (col > 255) u = true;
    if (col < 50) u = false;
    if (y <= -50) {
      y = height;
      x = int(random(0, width));
      s = random(1, 4);
    }
  }
  public int getCol() {
    return col;
  }
}

public int calcBackground() {
  int total = 0;
  for (int i = 0; i < heart.length; i++) {
    total+= heart[i].getCol();
  }
  return total/heart.length;
}

