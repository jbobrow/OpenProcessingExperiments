


float px, py, px2, py2;
float angle, angle2;
float radius = 200;
float frequency = 2;
float frequency2 = 2;

void setup(){
  size(600, 600);
  background (255); 

}

void draw(){
  background (255);
  noStroke();
  fill(255);
  // rotates rectangle around circle
  px = width/2 + cos(radians(angle))*(radius);
  py = height/2 + sin(radians(angle))*(radius);
  rectMode(CENTER);
  fill(0);
  //draw ellipse
  ellipse (px, py, 20, 20);
  stroke(100);


  angle2 = 0;

  angle += frequency;



}



