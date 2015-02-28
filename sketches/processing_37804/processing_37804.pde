
int x=2;

void setup() {

  size (200, 400);
  background(0);
}

void draw() {
  pushMatrix();
  translate(width/random(10), height/2);
  stroke(255, 255, 255, 30);
 
  //color change
  if (x<100) {
    fill(50, 30, 200, 30);
  }
  else {
    fill(200, 30, 255, 30);
  }
  //rectangles down
  rect(random(5), x, 30, 40);
  rotate(-TWO_PI/8); //rotate 45
  
//bottom lines
  line(10, 0, 10, 300);
  rotate(-TWO_PI/8); //rotate 90
  
  translate(width/10, height/10);
  //changes color  
  if (x>100) {
    fill(50, 200, 30, 30);
  }
  else {
    fill(255, 255, 50, 30);
  }
  //ellipses up
  ellipse(x, random(5), 40, 20);
  rotate(-TWO_PI/8); //rotate 135
 
  popMatrix();

  x++;
}



