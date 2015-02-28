
int num = 20;

color[] myColors = new color[8];//declaration must be before setup 
float [] x = new float[6];
float [] y = new float[4];
float [] speed = new float[num];

void setup() {
  size(300, 300);
  colorMode(RGB, width);
  smooth();

  //breakdown of array needs to be after setup
  //array for colors
  myColors[0] = color(222, 159, 92, 10);//variable # 1
  myColors[1] = color(0);//2
  myColors[2] = color(149, 84, 71);//3
  myColors[3] = color(245, 47, 37);//4
  myColors[4] = color(15, 220, 60, 20);//5
  myColors[5] = color(235, 242, 32);//6
  myColors[6] = color(103, 149, 116, 100);//7

  //array for x functions
  x[0] = 15;//8
  x[1] = 60;//9
  x[2] = 85;//10
  x[3] = 155;//11
  x[4] = 165;//12
  x[5] = width;//13

  //array for y functions
  //must begin at y[0] if not out of bounds error will occur
  y[0] = 20;//14
  y[1] = 60;//15
  y[2] = height;//16

  //for (int i=0; i < num; i++) {

  speed[0] = random(0.5, 8);
}

void draw() {

  background ( myColors[0]);

  fill (myColors[1]);
  rect (0, 0, x[5], 30);//top bar

  fill (myColors[2]);
  rect (10, 38, 280, 15);//next bar down

  fill (myColors[3]);
  rect (x[0], y[1], x[1], y[0]);//left bar 1
  rect (x[2], y[1], x[1], y[0]);//top 2
  rect (x[3], y[1], x[1], y[0]);//top 3
  rect (225, y[1], x[1], y[0]);//top 4

  rect (x[0], 220, x[1], y[0]);//lft bar1-bottom
  rect (x[2], 220, x[1], y[0]);
  rect (x[3], 220, x[1], y[0]);
  rect (225, 220, x[1], y[0]);

  fill (myColors[2]);
  rect (10, 246, 280, 15);//bottom bar next up

  fill (myColors[1]);
  rect (0, 270, x[5], y[2]);//bottom margin

  //figure 1-upper left
  fill (myColors[5]);
  noStroke();

  rect (x[0], x[2], x[1], y[0]);
  rect (x[0], x[2], y[0], x[1]);
  rect (x[0], 145, x[1], 10);
  rect (x[0], 135, 50, 10);
  rect (x[0], 115, 30, 30);
  //figure 2-right of 1
  rect (x[2], x[2], x[1], y[0]);
  rect (x[2], x[5]/3, 20, 55);
  rect (x[2], 105, 50, 10);
  rect (x[2], 135, 60, y[0]);
  //figure 3-
  rect (x[3], x[2], 20, x[1]);
  rect (x[3], x[2], x[1], 10);
  rect (x[3], 95, 10, 5);
  rect (x[3], x[5]/3, 30, 55);
  //figure 4-
  rect (225, x[2], x[1], 10);
  rect (225, x[2], 20, 70);
  rect (265, 105, 20, 50);
  rect (235, 95, 20, 10);
  //figure 5
  rect (x[0], x[4], 20, 50);
  rect (x[0], x[4], x[1], 5);
  rect (x[0], 170, 50, 10);
  rect (x[0], 180, 40, 5);
  rect (x[0], 210, x[1], 5);
  rect (55, 205, 20, 5);
  //figure 6
  rect (x[2], x[4], x[1], 5);
  rect (x[2], x[4], 30, 50);
  rect (140, x[4], 5, 50);
  //figure 7
  rect (x[3], x[4], x[1], 5);
  rect (x[3], x[4], 30, 50);
  rect (225, x[4], 30, 50);
  //figure 8
  rect (260, x[4], 5, 50);
  rect (260, x[4], 20, 5);
  rect (275, 180, y[3], 35);

  x[5] = x[5] + speed[0];
  x[4] = x[4] + speed[0];
  x[3] = x[3] + speed[0];
  x[2] = x[2] + speed[0];
  x[1] = x[1] + speed[0];
  x[0] = x[0] + speed[0];
  y[0] = y[0] + speed[0];
  y[1] = y[1] + speed[0];
  y[2] = y[2] + speed[0];

  frameRate (20);
  if (x[5] > width) {//speed control
    x[5] = (5);
    x[4] = (-8);
    x [3] = (-6);
    x [2] = (-6);
    x [1] = (-6);
    x [0] = (-6);
    y [0] = (-4);
    y [1] = (-4);
    y [2] = (-4);
  }
}


