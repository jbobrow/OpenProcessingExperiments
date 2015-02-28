


int value = 100;

 void setup() {
  size(500,500);
  noStroke();
  background(232,250,250);
}

void draw() {
  fill(value+100);
  rect(25, 25, 50, 50);
  
  fill(value+50);
  rect(100, 10, 100, 100);
  
  fill(value+50);
  rect(150, 150, 100, 100);
  
  fill(value+50);
  rect(300,300, 50, 50);
  
  fill(value+50);
  rect(350,350, 100, 100);
  
  fill(value+50);
  rect(10,350, 100, 50);
  
  fill(value+100);
  rect(5,100, 10, 50);
  
  fill(value+1);
  rect(25,75,100,75);
  
  fill(value+50);
  rect(130,130,20,20);
  
  fill(value+10);
  rect(250,150, 50, 50);
  
  fill(value+1);
  rect(125,275, 150, 200);
  
  fill(value+20);
  rect(250,100, 60, 50);
}

void mouseMoved() {
 value= value + 1;
  if (value > 255) {
    value = 0;
  }
}


