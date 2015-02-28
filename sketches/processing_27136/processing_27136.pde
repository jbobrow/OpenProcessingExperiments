
//http://www.openprocessing.org/visuals/?visualID=16119
//playing glasses for sound
///http://www.youtube.com/watch?v=fP1GTl9fo8g

float r;
int x;
int y;
float mx;
float my;

void setup() {
  size(500, 500);
  x=width/2;
  y=height/2;
  smooth();
  background(255);

}
 
void draw() {
  fill(255, 10);
  noStroke();
  rect(0,0,width,height);

  r=r+0.01+(mouseX+mouseY)/4;
  mx=mouseX;
  my=mouseY;
  while(mx==0){
  mx=width/2;
  my=height/2;}
  
  translate(mx, my);
  rotate(r);

  renderShape();
}
 
void renderShape() {
  fill(0,0,255);
 triangle(0, 0, 15, 75, 120, 152);
}
 




