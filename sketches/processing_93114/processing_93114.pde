
int y=5;
int x=10;

void setup () {
  size (200,200);
background (100);
} 


void draw() {
int spacing= 10;
int endLegs=180;
stroke (0);
  strokeWeight (5);
    x=x+spacing;
     point (x-37,x*x/270);
     line (x-37, x*x/270, x-37, x/2 );
}
