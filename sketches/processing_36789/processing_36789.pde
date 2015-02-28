
//this composition is to make random green squares with some white mixed in
//while they are random 80% is in the top half and 20% is in the bottom half
void setup() {
  size(300, 600);
  background(76, 216, 110);
}


int count = 0;
int num = 100;

float rectSize;


void draw() {
  noFill();//empty boxes
  strokeWeight(random(5, 10));
  float rndColor = random(0, 100);
  float rndHeight = random(0, 100);
  float rectSize = random(50,100);


  if (count < num) {

    //probability favoring 80% green, 20% white
    if (rndColor > 80) {
      stroke(255, random(40, 100));
    }
    else {
      stroke(0, random(100, 255), 50, random(40, 100));
    }

    //rectangles
    if (rndHeight > 80) {
      rect(random(width), height/2 + random(0,height/2),rectSize,rectSize);
  }
    else {
      rect(random(width), height/2 - random(0,height/2),rectSize,rectSize);
    }
  }
  count ++;
}


