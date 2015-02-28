
int count = 4;

float[] xPosition = new float[count];
float[] yPosition = new float[count];


float[] xSpeed = new float[count];
float[] ySpeed = new float[count];

color[] colors = new color[count];

float gravity = 0.1;

void setup() {
  size(500, 500);

  colors[0] = color(0);
  colors[1] = color(125);
  colors[2] = color(0,0,200);
  colors[3] = color(0,100,200);
  
  xPosition[0] = 100; // x location
  xPosition[1] = 300;
  xPosition[2] = 400;
  xPosition[3] = 500;
  
  yPosition[0] = 0; // x location
  yPosition[1] = 0;
  yPosition[2] = 0;
  yPosition[3] = 0;
  
  xSpeed[0] = 3;
  xSpeed[1] = -3;
  xSpeed[2] = -6;
  xSpeed[3] = 6;
  
  ySpeed[0] = 0;  // speed of square
  ySpeed[1] = 0;
  ySpeed[2] = 0;
  ySpeed[3] = 0;
}

void draw() {
  background(255);
  fill(0);
  noStroke();
  rectMode(CENTER);

  for (int i = 0; i < count; i++) {
    //colors[i] = int(random(255));
   int ball=5;  
    
    fill(colors[i]);
    //fill(red(colors[i]),255-green(colors[i]),100);
    ellipse(xPosition[i], yPosition[i], 40+ball, 40+ball);
    //fill(colors[i],100,0);
    //ellipse(xPosition[i], yPosition[i], 20, 20);
    //fill(colors[i],0,100);
    //ellipse(xPosition[i]+75, yPosition[i]+75, 30, 30);
    //fill(colors[i],0,100);
    //ellipse(xPosition[i]+50, yPosition[i]+50, 30, 30);
    

    yPosition[i] = yPosition[i] + ySpeed[i]; // add speed to location
    xPosition[i] = xPosition[i] + xSpeed[i];
    ySpeed[i] = ySpeed[i] + gravity; // add gravity to speed

    if (yPosition[i] > height) {
      ySpeed[i] = ySpeed[i] * -0.95; // multiplying by -0.95 instead of -1
      //slows down the square each time it bounces (by decreasing speed)
    }
    
    if (xPosition[i] > (width) || xPosition[i] < 0)
      xSpeed[i] = xSpeed[i] * -1;
  }
  //if (zPosition[i] > width || zPosition[i] < 0)
    // zSpeed[i] = zSpeed[i] * -1;
}

