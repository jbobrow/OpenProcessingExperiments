
void setup()
{
  size(600,600);
  smooth();
  background(242,239,215,100);
  frameRate(10);
}
  
void draw()
{
  fill(random(100,150),random(200),random(40),200);
    translate(width/2,height/2);
    rotate(random(TWO_PI));
    scale(random(0.9,1.8));
    drawLeaf();
  }
  
void drawLeaf(){
    
  float pointShift = random(-20,20);
  beginShape();
  vertex(20, 45);
  bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50);
  bezierVertex(60 + pointShift,55, 30,65, 20,45);
  endShape();
  }

