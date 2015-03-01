
color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

void setup () {
  size (400,400);
  background (0);
}
void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}
void draw () {
  line (x,0,400,x);
  line (x,0,0,400-x);
  line (0,400-x,400-x,400);
  line (400,x,400-x,400);
  stroke (15);
  
   line (x,-1,401,x);
  line (x,-1,-1,401-x);
  line (0,401-x,401-x,401);
  line (401,x,401-x,401);
  stroke (40);
  
   line (x,-2,402,x);
  line (x,-2,-2,402-x);
  line (0,402-x,402-x,402);
  line (402,x,402-x,402);
  stroke (0,200,0);
  
  ellipse (215,200,20,20);
  fill (0,225,0);
   ellipse (185,200,20,20);
  fill (0,225,0);
  ellipse (200,175,20,20);
  fill (0,225,0);
  
  
  
    move();
    
}
  


