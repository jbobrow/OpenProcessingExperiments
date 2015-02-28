
 

 
void setup() {
  size(500, 300);
  smooth();
  noStroke();
}

Ball[] b = new Ball[1000];
float x_size, y_size;
int cnt;
 
void mousePressed() {
  x_size = random(20, 30);
  b[cnt++] = new Ball(mouseX, mouseY, x_size, x_size);
}
 
void draw() {
  background(0);
  for (int a=0; a<cnt; a++) {
    b[a].display();
  }
}
 
class Ball {
  float x, y, w, h;
  float r, g, b, s;
  float speed;
    
  Ball(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    r = random(255);
    g = random(255);
    b = random(255);
    s = random(50);
   }
 
  void display() {
    fill(r,g,b);
    noStroke();
    ellipse(this.x, this.y, s, s);
 
    if(this.y > height+10) {
      speed = 0;
    } else {
      speed = speed + 0.3;
    }
    this.y = this.y + speed;
    if(this.y > height-10) {
      speed = speed * -0.9;
    }
  }
}


