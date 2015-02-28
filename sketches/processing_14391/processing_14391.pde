
float a =0;
int speed = 3;

float b =0;
int hspeed = 1;

void setup() {
  size (400,400);
}

void draw() {
  background(209,180,210);
  smooth();
  a = a + speed;
  b = b + hspeed;
  fill(255);
  ellipse(a,b,(50+a/2),(50+a/2));{
  {
    
  if (a>300) {
    speed = -15;
  }
  
  if (a<35){
    speed = 10;
  }
  
  if (b>330) {
    hspeed = -16;
  }
  
  if (b<35){
    hspeed = 9;
  }
  }
 
 noStroke();
for(int y =10; y <= height-10; y += 10){
  for(int x =10; x <= width-10; x += 10){
   ellipse(x,y,8,8);
   fill(220,220,230);
   }
}
  }}

