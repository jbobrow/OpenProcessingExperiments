

PImage img; 
Ball[] balls = new Ball[1];
float gravity = 0.1;

float y;

void setup(){
  size (1600,900);
img = loadImage ("HUN_0104.jpg");
frameRate(30);
balls [0] = new Ball (50,0,200);
}


void draw(){
 //image(name,xcood,ycood)
  loadPixels();
  img.loadPixels();
  image(img,0,0);
  for (int i = 0; i < balls.length; i ++){
   balls[i].gravity();
  balls[i].move();
  balls[i].display();
  
}
}
void mousePressed (){
  Ball b = new Ball (mouseX,mouseY,200);
  
  balls = (Ball[]) append (balls,b);
  
}



