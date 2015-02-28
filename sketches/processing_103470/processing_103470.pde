

void setup(){
  size(550, 550);
  cursor(HAND);
  colorMode(HSB, 360,100,100);
  smooth();
  strokeCap(SQUARE);
  noFill();
  strokeWeight(1);
}
int speed = 4;
int fps = 60;
int strokesMin = 40;
int strokesMax = 400;
int strokes = 100;
int naehe = 100;

void draw(){
 
  background(26,26,100);
  
  naehe = (int) dist(mouseX, mouseY, width/2, height/2);
  
  
  stroke(map(naehe,1,387,16,20),map(naehe,1,387,100,20),map(naehe,1,387,80,100));
  
  fps = (int) map(naehe,1,387,200,10);
  frameRate(fps); 
  
  if (naehe > 180) {
    strokesMax = 600;
      translate(width/2,height/2);
  }
  else if (naehe > 140) {
    strokesMax = 450;
      translate(width/2,height/2);
  }
  else if (naehe > 100) {
    strokesMax = 300;
      translate(width/2,height/2);
  }
  else if (naehe > 60) {
    strokesMax = 250;
      translate(width/2+random(1),height/2+random(1));
  }
  else if (naehe > 30) {
    strokesMax = 150;
      translate(width/2+random(5),height/2+random(5));
  }
  else { 
    strokesMax = 50;
      translate(width/2+random(10),height/2+random(10));
  }

//  println(fps);
  
  if (strokes > strokesMax) strokes = strokesMax;
  
  if (strokes >= strokesMax || strokes <= strokesMin) { speed *= -1; }
 
  strokes += speed;
  

  int circleResolution = strokes;
  float radius = width/3;
  float angle = TWO_PI/circleResolution;  

  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = cos(angle*i) * radius;
    float y = sin(angle*i) * radius;
    line(0, 0, x, y);
//    vertex(x, y);
  }
  endShape();
  
}



