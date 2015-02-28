
int b=0;
void setup() {
size(200,200);
}
void draw() {
for( int y=0; y<200; y=y+2 ) {
  for( int x=0; x<200; x=x+2 ){
    float d= dist(x,y,100,100);
    float c= (sin(radians(d*20+b))+1)*150;
    stroke(c);
    point(x,y);
  }
}
b=b+2;
}
{
background(100);
for( int a=0; a<360; a=a+30 ) {
  point(100+cos(radians(a+b))*20,100+sin(radians(a+b))*20);
  }
  b=b+200;
}
                
