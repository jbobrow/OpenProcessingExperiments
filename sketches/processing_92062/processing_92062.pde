
int num_of_ellipse = 20;
float [] elX = new float[num_of_ellipse];
float [] elY = new float[num_of_ellipse];
float [] elSpeed = new float[num_of_ellipse];
float gravity = .5;
int currentClick;
void setup() {
  size(350, 550);
}

void draw() {
  background(14);
  for (int i= 0; i < num_of_ellipse; i++) {
     fill(0, 100, map(elY[i], 0, height, 100, 255));
    ellipse(elX[i], elY[i], 20, 20);
    elY[i]+= elSpeed[i];
    elSpeed[i]+= gravity;
  }
}

void mouseDragged() {
  elX[currentClick] = mouseX;
  elY[currentClick]= mouseY;
  elSpeed[currentClick]= -10;
  currentClick+=1;
  if (currentClick >= num_of_ellipse) { 
    currentClick=0;
  }
}
