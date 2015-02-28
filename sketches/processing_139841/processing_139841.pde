

int radius;
int ellipseSize;
int legLength;
int cx;
int cy;
int rotated;
int howMany;


void setup() {
  size(800, 600);
  background(0);
  stroke(255);
  fill(255);
}

void draw() {
}

void mouseClicked() {
  ellipseMode(CENTER);
 
  cx = mouseX;
  cy = mouseY;
  howMany = int(random(2,4));
  for (int l = 0; l < howMany; l++) {
  rotated = int(random(0, 55));
  legLength = int(random(12, 30));
   
   
    for (int j = 0; j < 50; j++) {
      float legW = cx + cos(radians(10*j+rotated)) * legLength;
      float legX = cy+ sin(radians(10* j+rotated))* legLength;
      
      ellipse(cx, cy, 10, 50);
      ellipse(cx, cy - 25, 10,10);
 
      line(cx, cy, legW, legX);
      //ellipse(legX, legX, radius, radius);
      
    }
  }
}



