
void setup() {
  size(400, 300);
  smooth();
  background(75);
  frameRate(3); //slows the drawing speed
}

float count = 0; //zero count
float number = 300; //count total

int numrect = 300;

void draw () {
  if (numrect>0) {
    if (count<number) { //controls red lines
      strokeWeight(5);
      stroke(200, 0, 0);
      line(200, 150, random(400), random(300));
    }
    if (count<number) { //green lines
      strokeWeight(2);
      stroke(0, 200, 0);
      line(200, 150, random(300), random(250));
    }
    if (count<number) {  //top left rect
      strokeWeight(4);
      stroke(0);
      fill(75, 20);
      rect(0, 0, random(400), random(300));
    }
    if (count<number) {  //bottom left rect
      strokeWeight(4);
      stroke(255);
      fill(75, 20);
      rect(400, 300, random(-400), random(-300));
    }
  }
}


