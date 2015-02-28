
Cat c;
int btn_x = 150;
int btn_y = 150;
int btn_z = 130;
int btn_w = 185;
int btn_h = 175;
int btn_l = 185;

void setup() {
  size(300,250);
  background(178);
  smooth();
  c = new Cat(100,100);
}
void draw() {
 background(157);
 c.display();
}

class Cat {
  float x;
  float y;
  
  Cat(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
void display() {
  pushMatrix();
  
  //nose
  fill(255,198,198);
  triangle(btn_x,btn_y,btn_z,btn_w,btn_h,btn_l);
  
  //ears
  line(50,20,85,60);
  line(50,20,35,60); 
  triangle(50,20,60,60,35,60);
  line(250,20,215,60);
  line(250,20,265,60);
  triangle(250,20,240,60,265,60);
  
  //eyes
  fill(0);
  ellipse(95,110,20,20);
  ellipse(205,110,20,20);
  
  //whiskers
  line(115,155,50,140);
  line(110,165,40,160);
  line(115,175,50,180);
  line(185,155,250,140);
  line(190,165,260,160);
  line(185,175,250,180);
 popMatrix();
}
}
void keyPressed() {
  saveFrame("PS2_05image.jpeg");
}

