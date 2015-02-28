
float x,y;


void setup() {
  size(400, 400);
  x = random(0,width);
  y = random(0,height);
}

void draw() {
background(0);
stroke(255);
strokeWeight(10);
point( x , y );
  y = y + 1;
}
