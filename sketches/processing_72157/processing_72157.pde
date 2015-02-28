
int circleX =5;
int circleY =0;
float rectX =0;
float rectY =0;

void setup () {
  size(500,300);
  background (220,200,235);
  frameRate (44);
  smooth();
}
void draw () {
  stroke(150,200,240);
  fill(150,130,240);
  rect(rectX,rectY,random(3),300);
  rectX = rectX +2;
  rectX = rectX % width;
  stroke(155);
  fill (255,240,random(250));
  ellipse(circleX,circleY,25,50);
  circleX = circleX + (frameCount % 10);
  circleX =circleX + 1;
  circleX = circleX % width;
  circleY = circleY +5;
  circleY = circleY % width;
}

