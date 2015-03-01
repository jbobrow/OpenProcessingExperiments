
// Simple box...

float x = 250;
float y = 0.8;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  drawarectangle(50, 50);
  movearectangle();
  checkedges();
}

void drawarectangle(int xlength, int yheight){
  strokeWeight(1);
  rect(x, y, xlength, yheight);
  fill(200, x, y);
   x = x+0.8;
   y = y+0.8;
}
void movearectangle(){
  x = x+0.8;
  y = y+0.8;
}
void checkedges(){
  if (x > 500){
    x=0;
  }
  if (y > 500){
    y=0;
  }
}



