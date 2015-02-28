
//Gabriela Nisenbaum
//March 9, 2013
//200 Objects

int num_of_ellipse = 200;
int currentClick = 0;
float[] elX = new float [num_of_ellipse];
float[] elY = new float [num_of_ellipse];
float[] elSpeed = new float [num_of_ellipse];
float gravity = .5;
 
void setup() {
  size(500, 500);
}
 
void draw() {
  background (230);
  for (int i = 0; i < num_of_ellipse; i++) {
  DrawMyStuff(elX[i], elY[i]);
  elY[i] += elSpeed[i];
  elSpeed[i] += gravity;
}
}
 
 void DrawMyStuff(float X, float Y) {
    strokeWeight(5);
    stroke (0, 0, 0, 150);
      if (mouseY < 166.6 == true){
      stroke(39, 97, 150, 150);
    }
     if (mouseX < 166.6 == true){
      stroke(45, 97, 32, 150);
    }
     if (mouseX > 333.3 == true){
      stroke(96, 43, 150, 150);
    }
     if (mouseY > 333.3 == true){
      stroke(65, 33, 200, 150);
    }
     line(0, Y, width, X);
     line(0, X, Y, height);
     line(500, Y, X, height);
   }
 
void mouseMoved ()  {
  elX[currentClick] = mouseX;
  elY[currentClick] = mouseY;
  elSpeed[currentClick] = -10;
  currentClick += 1;
  if (currentClick > 19) {
    currentClick = 0;
  }
}
