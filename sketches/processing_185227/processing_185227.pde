
int x=10;
int y=240;
int x2=255;

void setup() {
  size(500, 500);
}
void draw() { 
  background(0);
  stroke(random(x2),random(x2),random(x2));
  line (x, random (x,y), y, random (x,y));
  line (x+y, random (x,height/2), width-x, random (x,height/2));
  line (x, random (y,height-x), y, random (y,height-x));
  line (x+y, random (y,height-x), width-x, random (y,height-x));

}
