
float rectWidth = 150, rectHeight = 120;
float x, y, vx, vy, angle = 0; 
float side = 20;
float radius;
boolean rot = false;
boolean showGrid = true;
boolean showCode = true;
PVector[] rectPosition;

void setup() {
  size(800, 800);
  ellipseMode(RADIUS);
  noStroke();
  radius = sqrt(2*side*side)/2;
  rectPosition = new PVector[3];
  rectPosition[0] = new PVector(width/4 - rectWidth/2, height/4 - rectHeight/2);
  rectPosition[1] = new PVector(width/4 - rectWidth/2, 3*height/4 - rectHeight/2);
  rectPosition[2] = new PVector(3*width/4 - rectWidth/2, 3*height/4 - rectHeight/2);
  x = rectPosition[0].x + rectWidth/2;
  y = rectPosition[0].y + rectHeight/2;
  vx = 1.2;
  vy = 0.8;
}

void draw() {
  background(30);

  fill(20);
  rect(width/2, 0, width, height/2);
  fill(240);
  textSize(20);
  textAlign(CENTER);
  text("Click to "+ (rot?"stop rotation!":"rotate!"), 0.75*width, 0.2*height);
  text("Press g to "+ (showGrid?"hide grid!":"show grid!"), 0.75*width, 0.25*height);
  text("Press c to "+ (showCode?"hide code!":"show code!"), 0.75*width, 0.3*height);
  
  stroke(100);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  noStroke();

  showCodeText();

  for (int i = 0; i < 2; i++) {
    drawRectangles(rectPosition[i].x, rectPosition[i].y);
  }

  drawGrid(rectPosition[0].x, rectPosition[0].y);
  drawObject(x, y);

  float dx = x-rectPosition[0].x;
  float dy = y-rectPosition[0].y;

  pushMatrix();
  translate(rectPosition[1].x+dx, rectPosition[1].y+dy);
  rotate(angle);
  drawGrid(0, 0);
  drawObject(0, 0);
  popMatrix();

  float object_x = rectPosition[2].x + rectWidth/2;
  float object_y = rectPosition[2].y + rectHeight/2;
  pushMatrix();
  translate(object_x, object_y);
  rotate(-angle);
  drawRectangles(-dx, -dy);
  drawGrid(0, 0);
  popMatrix();
  drawObject(object_x, object_y);

  if (rot) {
    angle += 0.03;
  }
  if (x - radius < rectPosition[0].x || x + radius > rectPosition[0].x + rectWidth) {
    vx *= -1;
  }
  if (y - radius < rectPosition[0].y || y + radius > rectPosition[0].y + rectHeight) {
    vy *= -1;
  }
  x += vx;
  y += vy;
}

void mouseClicked() {
  rot = !rot;
}

void keyPressed() {
  if (key == 'g') {
    showGrid = !showGrid;
  } else if (key == 'c') {
    showCode = !showCode;
  }
}

void drawRectangles(float rx, float ry) {
  fill(255);
  rect(rx, ry, rectWidth, rectHeight/2 + 3);
  fill(240);
  rect(rx, ry + rectHeight/2, rectWidth, rectHeight/2);
} 

void drawObject(float ox, float oy) {
  fill(171, 69, 43);
  ellipse(ox, oy, radius, radius);
  fill(252, 133, 83);
  rect(ox-side/2, oy-side/2, side, side);
  fill(171, 69, 43);
  ellipse(ox+0.22*radius, oy+0.22*radius, 0.35*radius, 0.35*radius);
} 

void drawGrid(float gx, float gy) {
  if (showGrid) {
    fill(100, 50);
    rect(gx, gy, rectWidth, rectHeight);
    stroke(255, 50);
    int n = 6;
    for (int i = 0; i<n+1; i++) {
      line(gx, gy + i*(rectHeight/n), gx + rectWidth, gy + i*(rectHeight/n));
      line(gx + i*(rectWidth/n), gy, gx + i*(rectWidth/n), gy + rectHeight);
    }
    noStroke();
  }
} 

void showCodeText() {
  if (showCode) {
    textSize(12);
    textAlign(LEFT);
    fill(200);
    text("drawRectangles(0, 0);", rectPosition[0].x, 0.02*height);
    text("drawObject(x, y);", rectPosition[0].x, 0.04*height);

    text("drawRectangles(0, 0);", rectPosition[1].x, 0.02*height + height/2);
    text("translate(x, y);", rectPosition[1].x, 0.04*height + height/2);
    text("rotate(angle);", rectPosition[1].x, 0.06*height + height/2);
    text("drawObject(0, 0);", rectPosition[1].x, 0.08*height + height/2);


    text("translate(object_x, object_y);", rectPosition[2].x, 0.02*height + height/2);
    text("rotate(-angle);", rectPosition[2].x, 0.04*height + height/2);
    text("drawRectangles(-x, -y);", rectPosition[2].x, 0.06*height + height/2);
  }
}



