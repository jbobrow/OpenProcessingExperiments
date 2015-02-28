
int counter = 0;
void setup() {
  size(900, 650);
  background(0);
  rectMode(CENTER);
}
void draw() {
  //
}

void mouseDragged()
{
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX, mouseY, width/2, height/2);
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  brush(mouseX, mouseY, speed, speed, lineWidth);
}

void brush(float x, float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
  ellipse(x, y, px, py);
  ellipse(width/2+((width/2)-x), y, px, py);
  ellipse(x, height/2+((height/2)-y), px, py);
  ellipse(width/2+((width/2)-x), height/2+((height/2)-y), px, py);
  return;
}

void keyPressed() {
  //press c to clear
  if (key=='c' || key=='C')
    background(0);

  //press s to save
  if (key=='s' || key=='S') {
    saveFrame("mySave"+counter+".png");
    counter++;
  }
}




