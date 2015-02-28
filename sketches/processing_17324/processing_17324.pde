
float mynumber=0;
float s=5;
float number=0;
float t=2;

void setup() {
  size(400,400);
//  frameRate(10);
}

void draw() {
  background(0);
  mynumber = mynumber +s;
  number = number + t;
  
  
  if (mynumber >= 400) {
    s = -5;
  }
  if (mynumber < 0) {
    s=5;
  }
  ellipse(200,mynumber,100,100);
  
  if (number >= 400) {
    t = -2;
  }
  if (number < 0) {
    t = 2;
  }
  ellipse(number,200,100,100);
}

                
                
