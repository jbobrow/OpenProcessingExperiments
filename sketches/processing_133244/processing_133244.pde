
void setup() {
  size(400, 400);
  smooth();
  frameRate(3);
}

void draw() {
int x;
int y;
x = float(random(0, 300));
y = float(random(0, 300));

fill(300, 0, 0, 10);
triangle( 200 + x, 130 + y , 140 + x, 160 + y, 200 + x, 200 + y);
triangle( 140 + x, 160 + y , 80 + x, 130 + y, 80 + x, 200 + y );

fill(0, 0, 0, 160);
triangle( 200 - x, 130 - y , 140 - x, 160 - y, 200 - x, 200 - y);
triangle( 140 - x, 160 - y , 80 - x, 130 - y, 80 - x, 200 - y );

}



