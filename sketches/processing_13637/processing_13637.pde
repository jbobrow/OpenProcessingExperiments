
int counter;

int b=0;
void setup() {
size(200,200);
}
void draw() {
for( int y=0; y<200; y=y+2 ) {
  for( int x=0; x<200; x=x+2 ){
    float d= dist(x,y,100,100);
    float c= (sin(radians(d*10+b))+1)*100;
    stroke(c);
    point(x,y);
  }
}
b=b+10;
}

                
                
