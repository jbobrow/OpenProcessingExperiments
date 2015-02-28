
int y = 45;

int radius = 40;
float x = -radius;
float speed = 1;

void setup() {
  size(500, 500);
  smooth();
  fill(250,245,91);
  ellipseMode(RADIUS);
}

void draw() {
  x=x+1; 
  if (x>500){
    x=0;
    y=y+45;
    if (y> 455) {y=45;}
  }

 background(0);
  x += speed; 
  if ( (floor(x/25) % 2 )==0) {
   arc(x, y, radius, radius, 0.52, 7);
 }
 else {
  arc(x, y, radius, radius, 0.52, 5.76);}
}


