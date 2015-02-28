
int x = 300;
int y = 200;
float d = 90;
float h = 0;


void setup(){
  size(400, 400);
  background(255);
  noStroke();
}
void draw(){
  colorMode(HSB);
  fill(h +350, 100, 100, 10);
  ellipse(x, y, d, d);
  d = d +0.2;
  
  fill(h +84, 255, 255, 10);
  ellipse(x -200, y -90, d, d);
  d = d +0.2;
  
  fill(h +40, 255, 255, 10);
  ellipse(x -180, y +50, d/2, d/2);
  d = d +0.2;  
  
  if(mousePressed && (mouseButton == LEFT)){
    
    d = d + 1;
    h = h + 0.4;    
    }else d =d;
 }
