
float xcent=width/2;
float ycent=height/2;
float x;
float y;
float easing = 0.1;
float px;
float py;
float angle = 0.0;
float offset = 20;
float scalar = 10;
float speed = .2;

void setup() {
   
  size(800,600);
  smooth();
  stroke(0);
  frameRate(100);
  
  

}

void draw() {
  
  
  cursor();
  
}

void cursor() {
  
  
  float globalMotionX = offset + cos(angle/10) * scalar*10;
  float globalMotionY = offset + sin(angle/10) * scalar*10;
  
  float xMotion1 = offset + cos(angle*2) * scalar;
  float yMotion1 = offset + sin(angle*2) * scalar;
  
  float xMotion2 = offset + cos(angle / 5) * scalar*4 ;
  float yMotion2 = offset + sin(angle / 5) * scalar*4;
  
  float xMotion3 = offset + cos(angle + .2) * scalar;
  float yMotion3 = offset + sin(angle + .2) * scalar;
  
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px + 2, py + 2);
  
  ellipseMode(CENTER); 
  strokeWeight(weight);
  stroke(255,0,0,20);
  line(xMotion1 + x + globalMotionX ,yMotion1 + y + globalMotionY, xMotion1 + x + globalMotionX , yMotion1 + y + globalMotionY );
  stroke(255,255,255,200);
  line(x + xMotion2 -20, y + yMotion2 -20, px+ xMotion2 -20, py + yMotion2 -20);
  stroke(0,255,255,200);
  line(x + xMotion3 -20, y + yMotion3 -20, px+ xMotion3 -20, py + yMotion3 -20);
  px =+ x;
  py =+ y;
  angle += speed;
   
  
}

