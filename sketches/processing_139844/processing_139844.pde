
//Lines
int lineL;
int line2L;
int line3L;
int line4L;
int line5L;
int line6L;

//Center outside circle:
float centerX= random(800); 
float centerY= random(800); //random center point
float centerCircleW= random(60, 80); //width

//Center inside circle:
float center2X;
float center2Y;
float centerCircle2W= random(40, 55);

//Center circle color (blues/purples)
float purple;

//Orange outside circles:
float orangeCircleW= random(20, 50);
float orangeCircle2W= random(20, 50);
float orangeCircle3W= random(20, 50);
float orangeCircle4W= random(20, 50);
float orangeCircle5W= random(20, 50);
float orangeCircle6W= random(20, 50);

//Orange inside circles:
float orangeInsideCircleW= random(10, 20);
float orangeInsideCircle2W= random(10, 20);
float orangeInsideCircle3W= random(5, 20);
float orangeInsideCircle4W= random(5, 20);
float orangeInsideCircle5W= random(5, 15);
float orangeInsideCircle6W= random(5, 15);

//Orange circles color
float orange;

void setup() {
  size(800, 800);
  purple= color(random(50), 0, random(50, 200), 150);
  orange= color(random(200, 225), random(50, 100), 50, 150);
  lineL= random(800);
  line2L= random(800);
  line3L= random(800);
  line4L= random(800);
  line5L= random(800);
  line6L= random(800);
}

void draw() {
  background(250);
  
  //lines
  stroke(100);
  line(centerX, centerY, lineL, lineL);
  line(centerX, centerY, line2L, line2L);
  line(centerX, centerY, line3L, line3L);
  line(centerX, centerY, line4L, line4L);
  line(centerX, centerY, line5L, line5L);
  line(centerX, centerY, line6L, line6L);
  
  //center outside circle:
  fill(250);
  strokeWeight(4);
  stroke(purple);
  ellipse(centerX, centerY, centerCircleW, centerCircleW);
  
  //center inside circle:
  noStroke();
  fill(purple);
  ellipse(centerX, centerY, centerCircle2W, centerCircle2W);
  
  //orange outside circles
  fill(250);
  strokeWeight(4);
  stroke(orange);
  ellipse(lineL, lineL, orangeCircleW, orangeCircleW);
  ellipse(line2L, line2L, orangeCircleW, orangeCircleW);
  ellipse(line3L, line3L, orangeCircle2W, orangeCircle2W);
  ellipse(line4L, line4L, orangeCircle3W, orangeCircle3W);
  ellipse(line5L, line5L, orangeCircle4W, orangeCircle4W);
  ellipse(line6L, line6L, orangeCircle5W, orangeCircle5W);
  
  //orange inside circles
  noStroke();
  fill(orange);
  ellipse(lineL, lineL, orangeInsideCircleW, orangeInsideCircleW);
  ellipse(line2L, line2L, orangeInsideCircle2W, orangeInsideCircle2W);
  ellipse(line3L, line3L, orangeInsideCircle3W, orangeInsideCircle3W);
  ellipse(line4L, line4L, orangeInsideCircle4W, orangeInsideCircle4W);
  ellipse(line5L, line5L, orangeInsideCircle5W, orangeInsideCircle5W);
  ellipse(line6L, line6L, orangeInsideCircle6W, orangeInsideCircle6W);
}
  




