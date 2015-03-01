
int box1x = 0;
int box1y = 0; 
int box2x;
int box2y = 0;
int boxSize = 50;

void setup() {
  size(600,600);
  box2x = width-50;
} 


void draw() {
  fill (255,0,0);
  stroke (random (255), box1x, box1y);

