
void setup() {
  size(300, 300);
  background(0);
}

float count = 100; //max circles
float circle; //circle size
float la; //left side lines
float lb; //right side lines

void draw() {

  if (count > 0) {
    noFill();
    circle = random(10, 50); //circle size range
    stroke(255);
    ellipse (random(100, 200), random(height), circle, circle);
    stroke(255,0,0);
    ellipse (random(100,200),random(height),15,15);
  }
  
  if (count > 0) {
    la = random(0,100);
    lb = random(200,300);
    stroke(255);
    line(la,0,la,height); //random line locations
    line(lb,0,lb,height);
  }
    
    count--;
  }
  

