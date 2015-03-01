
//Random_quad_generator
//creates a quad from the lower right corner point
//which has random pen colours and two points
//which are random within boundaries
//(c)Peter Peruzzi 27?06/14

void setup(){
  size(800,800);
  background(240,220,180);
  frameRate(30);
}

void draw(){
  int x = 700;
  int y = 700;
  float p1x = random(50,200);
  float p1y = random(50,250);
  float p2x = random(300,600);
  float p2y = random(50,500);
  float p3x = 500;
  float p3y = 400;
  
  beginShape();
  strokeWeight(2);
  stroke(random(0,255),random(0,255),random(0,255),100);
  noFill();
  vertex(p1x,p1y);
  vertex(p2x,p2y);
  vertex(p3x,p3y);
  vertex(x,y);
  endShape(CLOSE);
  
}//end of draw



