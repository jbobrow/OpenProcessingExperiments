
int theta;
float second;
float minute;
float hour;

void setup() {
  size(700, 700);
  background(0);
  rectMode(CENTER);
  theta = 0;

  colorMode(HSB, 255);
}

void draw() {

  drawCircles();
  second = map(second(), 0, 59, 0, width);
   minute= map(minute(), 0, 59, 0, width);
  hour= map(minute(), 0, 24, 0, width);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(second));
  stroke(random(255));
  strokeWeight(3);
  fill(255);
  float lineLength = random(200);
  
  line(0, lineLength, 0, -lineLength);
  popMatrix();
theta++;
    

}
void drawCircles() {
//  float x1 = cos(radians(theta));
//  float y1 = sin (radians(theta));
  float x2 = cos(radians(theta));
  float y2 = sin (radians(theta));
//  ellipse(width/2+150*x1, height/2+150*y1, second/7, second/7);
  //you can multiply x by a number and it increases the distance between middle pont and where circles is being drawn
  //height is origin, think that you add, 150 is how far away from origin
  ellipse(width/2+100*x2, height/2+100*y2, hour/2, hour/2);
    float x3 = cos(radians(-theta));
  float y3 = sin (radians(-theta));
  ellipse(width/2+250*x3, height/2+250*y3, minute/2, minute/2);
  
}



