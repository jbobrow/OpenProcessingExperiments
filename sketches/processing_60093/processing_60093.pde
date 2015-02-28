
float x1=360;
float x2=360;
float x3=360;
float x4=360;

void setup(){
  size(270,270);
  background(255,255,255);
  smooth();
}


void draw(){

//red semi circle
  if (x1>270)
    {
      x1=x1-0.8;
    }
  stroke(205, 32, 39);
  strokeWeight(30);
  strokeCap(SQUARE);
  noFill();
  arc(20, 250, 100, 100, radians(x1), TWO_PI);

//blue semi circle
  if (x2>270)
    {
      x2=x2-2;
    }
    
  stroke(33, 72, 140);
  strokeWeight(30);
  strokeCap(SQUARE);
  noFill();
  arc(20, 250, 200, 200, radians(x2), TWO_PI);

//yellow semi circle
  if (x3>270)
    {
      x3=x3-1.4;
    }
    
  stroke(222, 211, 36);
  strokeWeight(30);
  strokeCap(SQUARE);
  noFill();
  arc(20, 250, 300, 300, radians(x3), TWO_PI);

//gold semi circle
  if (x4>270)
    {
      x4=x4-0.8;
    }
  stroke(157, 144, 51);
  strokeWeight(30);
  strokeCap(SQUARE);
  noFill();
  arc(20, 250, 400, 400, radians(x4), TWO_PI);

}

