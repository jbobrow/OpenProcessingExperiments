
int x;
int y;
int speed;
float gravity;

void setup(){
  size(800,800);
  x = width/2;
  y = height/2;
  speed = 5;
  gravity = -1;
}
void draw(){
  background(20,32,23);
  fill(240,235,249);

  y+=speed;
  if(y > height || y < 0) {
    speed*=-0.9;
  }
  
  y+=speed;
  speed-=gravity;
    
  ellipse(x,y,40,40);
}
