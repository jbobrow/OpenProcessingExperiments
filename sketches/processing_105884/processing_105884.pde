
int counter = 0;
int currentX = 100;
int currentY = 400;

void setup() {
  size(500, 500);
  loop();
  frameRate(70);
}

void draw() {
  line(currentX, currentY, currentX + counter*1, currentY);
  counter +=1;

if (counter == 300) {
  currentY +=-100;
  counter = 0;   }

if (currentY == 0) {
  currentY = 400;   }

}


void mousePressed() {
  currentY +=20;
  
}
