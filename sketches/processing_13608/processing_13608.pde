
int b=0;

void setup() {
size(200,200);
background(#000000);
}

void draw() {
for( int y=0; y<200; y=y+4 ) {
  for( int x=0; x<200; x=x+4 ){
    float d= dist(x,y,100,100);
    float c= (cos(radians(d*100+b)+1))*180;
    stroke(c);
    point(x,y);
  }
}
b=b+9;
}
