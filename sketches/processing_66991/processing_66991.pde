
float r = 0;
float g = 180;
float b = 255;
boolean state;
float rate = 4;
float x, y;

void setup() {
  size(600, 600);
  smooth();
  rectMode(CENTER);
}

void draw() {
  x = 300;
  y = 350;
  background(r, g, b);

  //body
  //legs
  strokeWeight(1.5);
  fill(250, 230, 190);
  rect(x-70, y+160, 50, 80);
  rect(x+70, y+160, 50, 80);

  //shoes
  strokeWeight(1.5);
  fill(0, 230, 190);
  rect(x-78.34, y+200, 70, 30);
  rect(x+79.66, y+200, 70, 30);

  //arms & hands
  strokeWeight(1.5);
  fill(250, 230, 190);
  rect(x-140, y+20, 50, 120);
  ellipse(x-140, y+90, 60, 60);
  rect(x+140, y+20, 50, 120);
  ellipse(x+140, y+90, 60, 60);

  //short
  strokeWeight(2);
  fill(237, 255, 0);
  rect(x-70, y+100, 120, 100); 
  rect(x+70, y+100, 120, 100);

  //shirt
  strokeWeight(2);
  fill(0, 230, 190);
  ellipse(x+140, y-20, 80, 80);
  ellipse(x-140, y-20, 80, 80);
  rect(x, y, 280, 200);

  //head
  strokeWeight(1.5);
  fill(250, 230, 190);
  ellipse(x, y-150, 350, 300);

  //eye1
  fill(255);
  strokeWeight(3);
  ellipse(x-87.5, y-200, 116, 85.7); //c1
  fill(150, 255, 255);
  ellipse(x-87.5, y-200, 58, 85.7); //c2
  fill(0);
  stroke(0);
  strokeWeight(25);
  point(x-87.5, y-200); //c3

  //eye2
  fill(255);
  strokeWeight(3);
  ellipse(x+87.5, y-200, 116, 85.7); //c1
  fill(150, 255, 255);
  ellipse(x+87.5, y-200, 58, 85.7); //c2
  stroke(0);
  fill(0);
  strokeWeight(25);
  point(x+87.5, y-200); //c3

  //nose
  noFill();
  strokeWeight(3);
  arc(x, y-150, x-250, y-300, 0, PI);

  //mouth
  curve(x-87.5, y-150, x-87.5, y-50, x+87.5, y-50, x+87.5, y-150);
}
