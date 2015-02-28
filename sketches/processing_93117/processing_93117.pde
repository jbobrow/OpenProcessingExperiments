
int y=5;
int x=10;

void setup () {
  size (200,200);
background (112,188,125);
} 


void draw() {
int spacing= 11;
stroke (4,62,14);
  strokeWeight (4);
    x=x+spacing;
    stroke (4,62,14);
    fill (229,255,234);
     
curve(x-40, x*x, x-37, x*x, x, x*x/290, x*x, x-37);


}
