
int mouseXold;
int mouseYold;
int strokeSize = 100;

void setup() {
  size(1000,800);
  smooth();
}

void draw() {
  if (mousePressed) {
    strokeWeight(calculateStroke2());
    drawSpray();
  }
  mouseXold = mouseX;
  mouseYold = mouseY;
}

void drawSpray(){
  point(mouseX, mouseY);
  
  int x1 = round(random(40))-20;
  int y1 = round(random(40))-20;
  strokeWeight(abs(x1));
  stroke(255, 255, random(255));
  point(mouseX+x1, mouseY+y1);
  drawLine();
}

void drawLine(){
  int yes = round(random(100));
  if(yes<20){
    int size = round(random(400));
    int counter = 0;
    int oldX = mouseX;
    int oldY = mouseY; 
    stroke(round(random(255)), 255, 255);
    
    while(counter < size){
      int x = oldX+(round(random(14))-7);
      int y = oldY+(round(random(14))-7);
      strokeWeight(round(random(2)));
      line(oldX,oldY,x,y);
      oldX = x;
      oldY = y;
      counter++;
    }
  }
}

int calculateStroke(){
  int newPos = mouseX+mouseY;
  int oldPos = mouseXold+mouseYold;
  int pos = abs(oldPos-newPos);
  return 10;
}

int calculateStroke2(){
  int x = abs(mouseX-mouseXold);
  int y = abs(mouseY-mouseYold);
  int pos = x+y;
  return pos;
}

int calculateStroke3() {
  float speed = abs(mouseX-mouseXold) + abs(mouseY-mouseYold);
  //stroke(speed);
  //ellipse(mouseX, mouseY, speed, speed);
  return round(speed);
}

