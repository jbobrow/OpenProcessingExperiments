
float cloudX;
float cloudY;
float x;
float y;

void setup() {
  size(1000,1000);
  frameRate(30);
  
}

void draw() {
  cloudX = mouseX;
  cloudY = mouseY;
  background(100);
  fill(0);
  noStroke();
  ellipse (cloudX, cloudY, 30, 20);
  ellipse (cloudX+10, cloudY, 30, 30);
  ellipse (cloudX+30, cloudY, 40, 40);
  ellipse (cloudX+30, cloudY+10, 40, 20);
  ellipse (cloudX+30, cloudY+10, 40, 20);
  ellipse (cloudX+30, cloudY-10, 40, 40);
  ellipse (cloudX+10, cloudY+10, 40, 20);
  ellipse (cloudX+30, cloudY-20, 40, 40);
  ellipse (cloudX+50, cloudY, 40, 40);
  ellipse (cloudX+30, cloudY+10, 40, 20);
  //below, eyes
  //fill(255);
  //ellipse (cloudX+10, cloudY, 3, 5);
  //ellipse (cloudX+30, cloudY, 3, 5);
}

void lightning()
{
  cloudX = mouseX;
  cloudY = mouseY;
  strokeWeight(8);
  
  stroke(240, 229, 7, 100);
  translate(cloudX+30, cloudY+20);
  rotate(PI/3);
  line(0, 0, 50, 50);
  translate(50, 50);
  rotate(-PI/3);
  line(0, 0, 50, 50);
  translate(50 ,50);
  rotate(PI/2.5);
  line(0, 0, 40, 40);
}
  
void mouseClicked() {
  //Here, draw lighting volt
  background(255);
  lightning();
  
  
}

