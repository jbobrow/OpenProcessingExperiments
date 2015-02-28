
//Dongjae "Krystofer" Kim
//10 March 2013
//200 Objects


int num_of_ellipse = 200;
float[] sprinkleX = new float[num_of_ellipse];
float[] sprinkleY = new float[num_of_ellipse];
float[] sSpeed = new float[num_of_ellipse];
float gravity = .3;
int currentClick = 0;

void draw() {
  background(255);
  for (int i = 0; i < num_of_ellipse; i++) {
    dummy(sprinkleX[i], sprinkleY[i], sSpeed[i]+3);
    sprinkleY[i] += sSpeed[i];
    sSpeed[i] += gravity;
  }
}


void mouseDragged() {
  sprinkleX[currentClick] = mouseX;
  sprinkleY[currentClick] = mouseY;
  sSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_ellipse) {
    currentClick =0;
  }
}
void setup() {
  size(600, 600);
  smooth();
}
//void draw() {
//  background(255);
//  for (int x = 0; x < 606; x += 6) {
//    for (int y = 0; y < 606; y += 6) {
//      dummy(x, y, 5);
//    }
//  }
//}

void dummy(float x, float y, float radius) {

  noStroke();  
  fill(random(170, 255), random(170, 255), random(170, 255));
  ellipse(x, y, radius, radius);
}
