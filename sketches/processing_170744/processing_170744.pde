
void setup() {
  size(400,400);
  frameRate(1);
}

int x=200;
int y=200;
int radius=100;



float tx;
float ty;
float theta=0;


void draw() {
  background(255);
  
  tx=x+radius*cos(theta);
  ty=y+radius*sin(theta);
  
  stroke(#00008B);

  strokeWeight(3);
  fill(#5F9EA0);
  ellipse(200,200, 200,200);
  
  strokeWeight(15)
  point(200,100);
  point(200,300);
  point(100,200)
  point(300,200)
  
  stroke(#FFD700);
  
  strokeWeight(3);
  line(x,y, tx, ty);
  strokeWeight(10);
  point(x,y);
  
  theta += 0.1;

}
