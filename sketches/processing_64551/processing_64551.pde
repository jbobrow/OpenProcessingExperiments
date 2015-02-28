
float x=0;
float b=0;
void setup(){
size(500,500);

colorMode(HSB,100);
smooth();}
void draw() {
    fill(0,2);
rect(-20,-20,width+60,height+60);
  float y = map(sin(b)*sin(b*1.1)*sin(b*1.2),-1,1,75,250);
  float siz=map(y, 50, 250, 30,30);
  float col= map(y, 75,250,0,100);
  strokeWeight(siz);
  stroke(col,100,100);
  point(x,y);
  if(x>width) {
      x=0;
      }
  x=x+1;
  b=b+0.07;

  }


