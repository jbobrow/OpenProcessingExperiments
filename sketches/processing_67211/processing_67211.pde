
int count = 4;

int r = 30;

float[] xPosition = new float[count];
float[] yPosition = new float[count];
float[] xSpeed = new float[count];
float[] ySpeed = new float[count];

color[] colors = new color[count];

float gravity = 0.1;

void setup() {
  size(500, 500);

  colors[0] = color(0, 255, 19);
  colors[1] = color(125, 40, 90);
  colors[2] = color(200, 400, 80);
  colors[3] = color(50, 8, 10);

  xPosition[0] = 100; // x location
  xPosition[1] = 60;
  xPosition[2] = 20;
  xPosition[3] = 200;


  yPosition[0] = 170; // y location
  yPosition[1] = 130;
  yPosition[2] = 90;
  yPosition[3] = 250;

  xSpeed[0] = 1;
  xSpeed[1] = 3;
  xSpeed[2] = 1;
  xSpeed[3] = 2;

  ySpeed[0] = 3;  // speed of square
  ySpeed[1] = 4;
  ySpeed[2] = 1;
  ySpeed[3] = 2;
}

void draw() {
  background(220, 130, 120);
  fill(0);
  noStroke();
  ellipseMode(CENTER);



  for (int i=0; i<count; i++) {
    for (int j=0; j<count; j++) {
      if (i!=j) {

        fill(colors[i]);
        ellipse(xPosition[i], yPosition[i], 2*r, 2*r);

        //gravity+speed

        xPosition[i] += xSpeed[i];
        yPosition[i] += ySpeed[i];

        ySpeed[i] = ySpeed[i] + gravity; // add gravity to speed

        //boarder detection

        if (xPosition[i] >= 500-r || xPosition[i] <= r) {
          xSpeed[i] *= -1;
        }
        if (yPosition[i] >= 500-r|| yPosition[i] <= r) {
          ySpeed[i] *=-0.95;
        }
        
        
        //collision detection
        if (dist(xPosition[i], yPosition[i], xPosition[j], yPosition[j]) <= (r*2)) {
          xSpeed[i] *= -1;
          ySpeed[i] *= -1;
          xSpeed[j] *= -1;
          ySpeed[j] *= -1;
        }
      }
    }
  }
}


