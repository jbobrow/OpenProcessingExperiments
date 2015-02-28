
int quantity = 300;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

void setup() {

  size(500, 600);
  frameRate(30);
  noStroke();
  smooth();

  for (int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
}

void draw() {

  background(109, 113, 113);
  fill(255, 255, 255);
  ellipse(250, 100, 100, 100);
  ellipse(250, 225, 175, 175);
  ellipse(250, 400, 225, 225);

  fill(252, 131, 0);
  triangle(250, 130, 240, 100, 260, 100);

  fill(0, 0, 0);
  ellipse(228, 90, 10, 10);
  ellipse(272, 90, 10, 10);

  ellipse(280, 125, 10, 10);
  ellipse(271, 132, 10, 10);
  ellipse(260, 135, 10, 10);

  ellipse(250, 137, 10, 10);


  ellipse(220, 125, 10, 10);
  ellipse(229, 132, 10, 10);
  ellipse(240, 135, 10, 10);

  rect(220, 0, 60, 65);
  rect(200, 60, 100, 5);

  ellipse(250, 255, 20, 20);
  ellipse(250, 220, 20, 20);
  ellipse(250, 185, 20, 20);

  stroke(95, 73, 29);
  {
    line(165, 200, 100, 300);
    line(164, 202, 100, 302);
    line(164, 204, 100, 304);

    line(335, 200, 400, 300);
    line(335, 202, 400, 302);
    line(335, 204, 400, 304);
  }


  noStroke();

  textAlign(CENTER);
  textSize(30);

  if (frameCount % 20 < 10)
  {
    fill(255, 0, 0);
  }
  if (frameCount % 20 > 9)
  {
    fill(0, 170, 0);
  }

  text("MERRY CHRISTAMS!!!", 250, 575);




  fill(255, 255, 255);
  for (int i = 0; i < xPosition.length; i++) {

    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);

    if (direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } 
    else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }

    yPosition[i] += flakeSize[i] + direction[i]; 

    if (xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
  }
}

