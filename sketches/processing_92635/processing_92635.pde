
//Danielle Gorodenzik
//200 Objects
// March 11, 2013

int num_of_ellipse = 20;
float [] elX = new float [num_of_ellipse];
float [] elY = new float [num_of_ellipse];
float [] elSpeed = new float [num_of_ellipse];
float gravity = .2;
int currentClick = 5;
void setup () {
  size (500, 500);
}
void draw () {
  background (14);
  for (int i = 0; i < num_of_ellipse; i++) {
    fill(250,10, map(elY[i], 50, height, 20, 200), 20);
    ellipse ( elX [i], elY[i], elX[i], elY[i]);
    ellipse ( 250, 250, elX[i], elY[i]);
    noStroke();
    line(0,elY[i], width, elY[i]);
    ellipse ( 150, 300, elX[i], elY[i]);
    elY[i] += elSpeed[i];
    elSpeed[i] += gravity;
  }
}
 
void mouseMoved() {
  elX[currentClick]= mouseX;
  elY[currentClick]= mouseY;
  elSpeed[currentClick] = -10;
  currentClick+=1;
  if (currentClick >= num_of_ellipse) {
    currentClick =0;
  }
}
