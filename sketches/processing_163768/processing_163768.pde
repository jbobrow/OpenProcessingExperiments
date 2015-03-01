
int leaves = 0; 
int leafMax = 800;

void setup()
{
  size(600,600);
  smooth();
  background(242,239,215,100);
  frameRate(3);
}

void draw()
{
  fill(random(100,150),random(200),random(40),200);
  if (leaves < leafMax) {
    float cx = 300 + random(-145,145);
    float cy = 300 + random(-145,145);
    
    translate(cx,cy);
    rotate(random(TWO_PI));
    scale(random(0.9,1.8));
    drawLeaf();
    leaves++;
  }
}

void drawLeaf(){
  
  float pointShift = random(-20,20);
  beginShape();
  vertex(20, 45);
  bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50);
  bezierVertex(60 + pointShift,55, 30,65, 20,45);
  endShape();
  for (float y=0; y<height; y+=10) {
    float rainX = random(0,width);
    float rainSz = random(5,15);
    ellipse( rainX, y, rainSz, rainSz);
  }
}
