
void setup() {
  size(300, 300);
  background(0);
}

float num = 25;

int ellipses = 20;

int rectangles = 10;

float count = 10;

void draw() {
  //Basic comp
  stroke(22, 27, 240);
  line(50, 0, 50, 300);
  line(150, 0, 150, 300);
  line(275, 0, 275, 300);
  stroke(255, 0, 0);
  line(0, 25, 300, 25);
  line(0, 275, 300, 275);
  line(0, 250, 300, 250);

  fill(252, 252, 5);
  noStroke();
  ellipse(50, 25, width/num, height/num);
  ellipse(150, 75, width/num, height/num);
  ellipse(275, 135, width/num, height/num);

  rect(25, 100, 10, 250);
  rect(250, 100, 10, 250);
  rect(75, 0, 10, 99);
  rect(285, 0, 10, 99);

//Pattern 
//random rectangles that create a filled block
  if (rectangles < 10);
  stroke(150, 170, 200);
  noFill();
  rect(random(1,49), random(0,30), 20, 20);

//random ellipses that create a filled vertical
  if ( ellipses < 50);
  stroke(245,240,160);
  noFill();
  ellipse(random(160,200),random(height), 10,10);
  
}




