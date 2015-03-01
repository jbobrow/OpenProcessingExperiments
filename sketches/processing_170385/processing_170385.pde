
float x = 250;
float y = 250;

float speedx=5;
float speedy=5;

void setup () {
  size(500,500);
  noStroke();
}

void draw () {
  fill(x,y,x-y,5);
 rect(0,0,height,width);
 fill(255);
 ellipse (x,y,50,50);
 x = x + speedx;
 y = y - speedy;

if(x<25){
  speedx = random(50);
}
if(x>475){
  speedx = -random(50);

}
if(y<25){
  speedy= -random(100);
}
if(y> 475){
  speedy = random(100);
}
  
}
