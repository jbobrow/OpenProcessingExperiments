
int x=50;
int y=50;
int w=30;
int h=30;
int spacing=40;
int x2=125;
int y2=40;
int x3=250;
int y3=50;
int x4=350;
int y4=35;
float r,g,b;


void setup() {
  size(400, 400);
  background(255);
}
void draw() {

  while (y <=height&&y2;<=height&&y3;<=height&&y4;<=height) {
    stroke(0);
    fill(255, 0, 0);
    ellipse(x, y, w, h);
    fill(0,255,0);
    rect(x2,y2,w,h);
    fill(0,0,255);
    ellipse(x3,y3,w,h);
    fill(r,g,b);
    rect(x4,y4,w,h);
    
    y=y+spacing;
   
    y2=y2+spacing;
    
    y3=y3+spacing;
    
    y4=y4+spacing;
  
  r=random(255);
  g=random(255);
  b=random(255);
  
}}
