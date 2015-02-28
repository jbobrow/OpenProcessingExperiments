
float x=random(200);
int x_speed=3;
 
float y=random(200);
int y_speed=50;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(0);
  move();
 
  bounce();
 
  fill(120,5,70);
  drawcar(x,100,67);
  fill(20,170,50);
  drawcar(x, 20,20);
  fill(10,40,120);
  drawcar(x, 300,20);
}
 
 
 
void move() {
  x+=x_speed;
}
 
void bounce() {
  if ((x>=230)||(x<=0)) {
    x_speed=x_speed*-1;
  }
}
 
void drawcar(float x, float y, float size) {
 
  rect(x, y, 80, 50);
  ellipse(x+17, y+50, 20, 20);
  ellipse(x+60, y+50, 20, 20);
}

                                                
