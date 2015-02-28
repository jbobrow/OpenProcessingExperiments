
float angle = 0.0;
float speed = .005;
float radius = 80;
float sx = 6;
float sy = 6;
float x = 600;
float y = 600;
float easing = 0.01;
float inc =.06;
int density = 4;
float znoise =0;
 
 
int dragX, dragY, moveX, moveY;
 
void setup(){
  size(600,600);
  strokeWeight(3);
  smooth();
}
 
 
 
void draw(){
  x += random(-2,5);
  y += random(-2,5);
  point(x,y);
   
  fill(0,4);
  rect(0,0,width,height);
  angle += random(-.3,.3);
 
 
for(int i = 0; i < 100; i++){
   
  float sinval = sin(angle);
  float cosval = cos(angle);
   
  float x = 50 + (cosval * radius);
  float y = 50 + (sinval * radius);
  noFill();
//  ellipse(x,y,180,180);
//  line(x,y,pmouseX,pmouseY);///
// line(mouseX,mouseY,pmouseX,pmouseY);
   
  float x2 = x + cos(angle * sx)*radius/2;
  float y2 = y + sin(angle * sy) * radius/2;
  translate(mouseX, mouseY);
   stroke(#ffffff);
  ellipse(x2,y2,5,5);
  translate(mouseX,mouseY);
 line(x2,y2,pmouseX,pmouseY);
  line(dragX, dragY, pmouseX, pmouseY);
//  ellipse(pmouseX,pmouseY,pmouseX,pmouseY);//pMouse - draw a line between crrent and previous position
  translate(moveX,moveY);
}
//citing source from Processing Handbook by Casey Reas and Ben Fry
//citing Perlin Noise Technique
{
  float xnoise=0;
  float ynoise=0;
  for (int y = 0;y < height; y += density){
    for (int x = 0; x< width; x += density){
      float n = noise(xnoise,ynoise,znoise)* 256;
      fill(n);
      rect(y,x,density,density);
      xnoise += inc;
    }
  xnoise = 0;
  ynoise += inc;
  }
znoise += inc;
}
}
 
  void mouseMoved() {
    moveX = mouseX;
    moveY = mouseY;
}
  void mouseDragged() {
    dragX = mouseX;
    dragY = mouseY;
  }

