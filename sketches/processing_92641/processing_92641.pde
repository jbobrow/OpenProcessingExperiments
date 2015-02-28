
//Aviva Silberstein
//200 Ombre Ellipses
//March 11, 2013

int num_of_ellipse = 200;
float [] elX = new float[num_of_ellipse];
float [] elY = new float[num_of_ellipse];
float [] elSpeed = new float[num_of_ellipse];
float gravity = .5;
int currentClick;
void setup() {
  size(600, 600);
}
 
void draw() {
  noStroke();
  background(133, 222, 2);
  for (int i= 0; i < num_of_ellipse; i++) {
     fill(191, 108, map(elY[i], 214, height, 100, 255));
    ellipse(elX[i], elY[i], 150, 80);
    elY[i]+= elSpeed[i];
    elSpeed[i]+= gravity;
  }
}
 
void mouseDragged() {
  elX[currentClick] = mouseX;
  elY[currentClick]= mouseY;
  elSpeed[currentClick]= -2;
  currentClick+=1;
  if (currentClick >= num_of_ellipse) {
    currentClick=0;
  }
}
