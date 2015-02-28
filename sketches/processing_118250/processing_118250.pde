
// Green, Green, Grass of Home
//Test 012 [Date:20131030] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

int t = second();


void setup() {
  size(500, 500);
  background(206, 229, 204);
  smooth();
  //noLoop();
  
  t = 0;
}

void draw() {

  drawSun();
  drawgrass(); 

}

void drawSun() {
  frameRate(8);
  
  float xPos = random(450);
  float yPos = random(300);
  noStroke();
  //fill(237, 95, random(67), 20);
  fill(240, 186, random(234), 70);
  pushMatrix();
  //translate((40+xPos)*(t/60), (60+yPos)*(t/60));
  //rotate(2*PI*t/60);
  ellipse(40+xPos, 60+yPos, random(20), random(30));
  popMatrix();
  
}


void drawgrass() { 
  frameRate(2);
  
  float xstep = 5;
  float border = 5;
  float x = 10;
  float y = 500;

  //grassPositions
  stroke(252);
  for (x=border; x<=width-border; x+=xstep) {
    point(x*t, y/t);
  }
  //drawGrasses
  stroke(random(50), random(198), random(100), random(80));
  strokeWeight(0.5);
  for (x=border; x<=width-border; x+=xstep) {
    float x1 = x+random(20)-10;
    float y1 = y-random(450);
    line(x, y, x1, y1);
  }
}



