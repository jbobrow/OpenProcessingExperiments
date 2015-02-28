
void setup() {
  size(800, 800);
  smooth();
}
float c1 = 50;
float c2 = 50;
float c3=50;
float x1= 0;
float y1=0;
float x2=300;
float y2=300;
  float vx1 = random(1, 20);
  float vy1 = random(1, 20);
  float vx2 = random(1, 20);
  float vy2 = random(1, 20);
void draw() {

  background(150);
 
    noStroke();
  for (int x=10;x<width;x+=20) {
    for (int y=10;y<height;y+=20) {
      fill(c1, c2, c3, 50);
      ellipse(x, y, 20, 20);
    }
  }
  
   fill(255);
  ellipse(x1,y1,40,40);
  ellipse(x2,y2,40,40);
  x1=x1+vx1;
  y1=y1+vy1;
  x2=x2+vx2;
  y2=y2+vy2;
  if(x1>width||x1<0){
    vx1=vx1*-1;
    c1=0;
    c2=255;
    c3=0;
  }
  if(y1>height||y1<0){
    vy1=vy1*-1;
    c1=0;
    c2=0;
    c3=255;
  }
  if(x2>width||x2<0){
    vx2=vx2*-1;
    c1=200;
    c2=4;
    c3=110;
  }
  if(y2>height||y2<0){
    vy2=vy2*-1;
    c1=24;
    c2=200;
    c3=120;
  }
} 



