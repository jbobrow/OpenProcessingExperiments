
void setup() {
  size(600, 600);
  background(0);
  ellipseMode(CENTER);
}

void draw() {
  frameRate(3);
  noFill();

  for (int x=60;x<=width;x+=random(90,100)) {
    for (int y=250;y<=height;y+=100) {
      stroke(random(1, 255), random(1, 255), random(1, 255));
      //ellipse and line color is random
      float wh = random(5, 100); 
      //width and height are the same random variable on each click
      ellipse(x, y, wh, wh);
    }
  }
  //arc set outside for loop grid
  arc(random(275, 325), 200, random(100, 550), 400, PI, TWO_PI);
  
  //After the drawing machines runs for 15 frames it stops
  if (frameCount > 15){
  noLoop();
  }
}



