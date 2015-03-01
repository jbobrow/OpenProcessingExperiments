
int topEdge = 0;
int bottomEdge = 800;

int yPosition = 0;
int xPosition = width/2;
boolean moveDown = true;
boolean moveUp = true;

void setup() {
  size(800,800);
  ellipseMode(CENTER);
}

float radius = 10;
 
void draw(){
  background(0);
  if (moveDown){
    if (yPosition < bottomEdge){
      yPosition++;
      radius++;
      if (radius==50) {
        radius =10;
      }

    } else {
      moveDown = false;
    }
  } else {
    if (yPosition > topEdge) {
      yPosition--;
      radius++;
      if (radius==50) {
        radius =10;
      }
    } else {
      moveDown = true;
    }
  }
  for(int i = 1; i <=10; i++){
   ellipse(i*100, yPosition, radius, radius);
  }

}


