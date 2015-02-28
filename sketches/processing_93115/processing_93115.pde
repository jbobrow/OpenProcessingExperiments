
int y=5;
int x=10;

void setup () {
  size (200,200);
background (245,171,22);
} 


void draw() {
int spacing= 4;
stroke (10);
  strokeWeight (2);
    x=x+spacing;
     point (x-37,x*x/250);
     line (x-37, x*x/250, x-57, x/2.5 );
}
