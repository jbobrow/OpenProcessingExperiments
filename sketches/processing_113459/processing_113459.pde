
float x;
float y;
float px;
float py;
float easing = 0.1;

int r;
int g;
int b;

boolean colorchange;

void setup(){
  size (600,400);
  smooth();
  stroke(60,50,150);
  background(255);
}

void draw(){
  float targetX=mouseX;
  x += (targetX-x) *easing;
  float targetY= mouseY;
  y +=(targetY-y) *easing;
  float weight =dist(x,y,px,py);
  strokeWeight(weight);
  line (x,y,px,py);
  py=y;
  px=x;
  
  
 if (keyPressed == true){
   if (key == ' '){
   stroke(250);
   background (50,150,50);
 }}
}
  




