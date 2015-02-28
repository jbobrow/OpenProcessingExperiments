
int y=5;
int x=10;

void setup () {
  size (200,200);
background (32,19,88);
} 


void draw() {
int spacing= 8;
int endLegs=180;
stroke (3,103,62);
  strokeWeight (3);
    x=x+spacing;
     point (x-37,x*x/250);
     line (x-37, x*x/270, x-37, x*x );
}
