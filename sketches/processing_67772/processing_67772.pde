
float circleX = random(1, 1000);
float circleY = 1;
float circle1 = random(1, 1000);
float circle2 = 1;
float circle3 = random(1, 1000);
float circle4 = 1;
float rectangle1 = random(1, 1000);
float rectangle2 = 1;
float triangle1 = random(1, 1000);
float triangle2 = random(1, 1000);
float triangle3 = random(1, 1000);
float triangle4 = random(1, 1000);
float shape1 = random(1, 1000);
float shape2 = random(1, 1000);
float shape3 = random(1, 1000);
float shape4 = random(1, 1000);
float text1 = 200;
float text2 = 900;

PFont font;


void setup() {
  size(1920, 1080);
  smooth();
  background(0);
}

void draw() {

  stroke(0);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(circleX, circleY, 50, 50);
  stroke(0);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(circle1, circle2, 100, 100);
  stroke(0);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(circle3, circle4, 100, 100);
  stroke(0);
  fill(random(1, 255), random(1, 255), random(1, 255));
  rect(rectangle1, rectangle2, 150, 100);
  stroke(0);
  fill(random(1, 255), random(1, 255), random(1, 255));
  triangle(triangle1, triangle2, triangle2, triangle1, triangle3, triangle4);
  stroke(0);
  fill(random(1, 255), random(1, 255), random(1, 255));
  quad(shape4, shape3, shape3, shape4, shape2, shape1, shape1, shape2);
  if (circleY >= 100) {
    smooth();
    font = loadFont("CenturyGothic-120.vlw");
    fill(random(0, 255), random(0, 255), random(0, 255));
    textFont(font, 200);
    text("Geometric Rain", text1, text2);
  }


  circleX = circleX + random(1, 2);
  circleY = circleY + random(1, 2);
  circle1 = circle1 + random(1, 2);
  circle2 = circle2 + random(1, 2);
  circle3 = circle3 + random(1, 2);
  circle4 = circle4 + random(1, 2);
  triangle1= triangle1 + random(1, 3);
  triangle2= triangle2 + random (1, 3);
  rectangle1 = rectangle1 + random(1, 2);
  rectangle2 = rectangle2 + random(1, 2);
  triangle3= triangle3 + random(1, 3);
  triangle4= triangle4 + random (1, 3);
  shape1 = shape1 + random (1, 3);
  shape2= shape2 + random (1, 3);
  shape3= shape3 + random(1, 3);
  shape4= shape4 + random (1, 3);
  text1= text1  + random(-3, 3);
  text2= text2 + random (-3, 3);
}


