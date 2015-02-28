
int turn = 0;
float radius = 0;
int cenX,cenY = 0;
  
void setup() {
  size(600,600); 
  background(0);
  noFill();
  colorMode(HSB,360);
  strokeWeight(6);
  smooth();
}

void draw() {
  //background(0);
  radius = (width / 2) * sqrt(2);
  cenX = width / 2;
  cenY = height / 2;

  for (int d = 0; d <= 360; d+=10) {
    float r = radians(d - turn);
    stroke(d,100,360,10);
    bezier(cenX, cenY, cenX + radius / 2 * cos(r), cenY + radius / 2 * sin(r) , cenX + radius * cos(r + HALF_PI), cenY + radius * sin(r + HALF_PI), cenX + radius * cos(r + PI), cenY + radius * sin(r + PI));   
  }
 
  turn++;
}


