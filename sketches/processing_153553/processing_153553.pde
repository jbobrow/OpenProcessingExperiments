
Integer counter;
ArrayList<Integer> colors;
ArrayList<Float> shapeData;
float FADEOUT_STEP = 2.125;
float ROTATE_SPEED = 0.002;
float MAX_DIST;

void setup() {
  size(800, 800);
  MAX_DIST = dist(0,0,width,height);
  background(0);
  counter = 0;
  colors = new ArrayList<Integer>();
  shapeData = new ArrayList<Float>();
  noStroke();
}

void mouseDragged() {
  ROTATE_SPEED = map(mouseX, 0, width, 0, 0.1);
}

void draw() {
  background(0);
  
  if (counter % 5 == 0) {
    newShape();
    
    counter = 0;
  }
  
  for (int i = 0; i < colors.size(); ++i) {
    drawShape(i);  
  }
  
  ++counter;
}

void newShape() {

  float angle = random(TWO_PI);

  color c1 = color(255 - random(128), 255 - random(128), 255 - random(128));
  fill(c1);
  colors.add(c1);
  
  float xPos = random(width);
  float yPos = random(height);
  float paintWidth = random(5, 100);
  float paintHeight = random(5, 100);
  
  shapeData.add(angle);
  shapeData.add(xPos);
  shapeData.add(yPos);
  shapeData.add(paintWidth);
  shapeData.add(paintHeight);
  shapeData.add(255.0);          //alpha value
  
  drawShape(colors.size() - 1);
}

void drawShape(int i) {
  int j = i * 6;
  
  Integer c1 = colors.get(i);
  
  float angle = shapeData.get(j);
  float xPos = shapeData.get(j + 1);
  float yPos = shapeData.get(j + 2);
  float paintWidth = shapeData.get(j + 3);
  float paintHeight = shapeData.get(j + 4);
  float alpha = shapeData.get(j + 5) - FADEOUT_STEP;
  
  float distance_from_origin = dist(0,0, xPos, yPos);
  
  angle = angle - ROTATE_SPEED - map(distance_from_origin, 0, MAX_DIST, 0, 0.01);
  
  // remove the data if the shape has faded out.
  if (alpha <= 0) {
        colors.remove(i);
        shapeData.remove(j);
        shapeData.remove(j);
        shapeData.remove(j);
        shapeData.remove(j);
        shapeData.remove(j);
        shapeData.remove(j);
  } else {
    shapeData.set(j + 5, alpha);
    shapeData.set(j, angle);
    
    pushMatrix();
    rotate(angle);
    
    fill(c1, alpha);
    
    rect(xPos, yPos, paintWidth, paintHeight);
    popMatrix();
  }
}



