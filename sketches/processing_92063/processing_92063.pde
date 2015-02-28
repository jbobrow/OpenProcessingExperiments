
int num_of_ellipse = 200;
int currentClick = 0;
float[] elX = new float [num_of_ellipse];
float[] elY = new float [num_of_ellipse];
float[] elSpeed = new float [num_of_ellipse];
float gravity = .5;

void setup() {
  size(350, 550);
}

void draw() {
  background (14);
  for (int i = 0; i < num_of_ellipse; i++) {
  DrawMyStuff(elX[i], elY[i]);
  elY[i] += elSpeed[i];
  elSpeed[i] += gravity;
}
}

void DrawMyStuff(float X, float Y) {
    noStroke();
    fill(53, 97, 150, 100);
  ellipse (X, Y, 20, 20);
  fill(56, 150, 98, 100);
   ellipse (X, Y+50, 20, 20);
   stroke(255);
   line (0, Y, width, X);
}

void mouseDragged ()  {
  elX[currentClick] = mouseX;
  elY[currentClick] = mouseY;
  elSpeed[currentClick] = -10;
  currentClick += 1;
  if (currentClick > 19) {
    currentClick = 0;
  }
}
