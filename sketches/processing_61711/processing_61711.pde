
void setup() {
  size(200, 200, P2D);
  smooth();

  background(255);

  xpos = random(width);
  ypos = random(height);
  update();
  now = new PVector(xpos, ypos, 0);
}

void draw() {


  update();
  noStroke();
  fill(255, 0, 0);
  ellipse(xpos, ypos, 6, 6);
}



void mouseReleased() {

  background(255);
  xpos = random(width);
  ypos = random(height);
 
}

float xpos, ypos;

void update() {


  now = mx(xpos, ypos, mouseX, mouseY);
  String wh = where(xpos, ypos, mouseX, mouseY);
  if (wh=="C") {
    xpos+=now.x;
    ypos-=now.y;
  }
  if (wh=="A") {
    xpos+=now.x;
    ypos+=now.y;
  }
  if (wh=="B") {
    xpos-=now.x;
    ypos+=now.y;
  }
  if (wh=="D") {
    xpos-=now.x;
    ypos-=now.y;
  }
}

PVector now;
float speed = 1.15; // controls speed
PVector mx(float Ax, float Bx, float C, float D) {

  float A = abs(Ax-C);
  float B = abs(Bx-D);
  float retval2;
  retval2 = max(A, B);

  PVector retval = new PVector((A/retval2)/speed, (B/retval2)/speed, retval2);

  return retval;
}

String where (float A, float B, float C, float D) {
  String retval = "";

  if (A<=C && B <=D)retval = "A";
  if (A>C && B<D)retval = "B";
  if (A<C && B>D)retval = "C";
  if (A>=C & B>=D)retval = "D";



  return retval;
}
