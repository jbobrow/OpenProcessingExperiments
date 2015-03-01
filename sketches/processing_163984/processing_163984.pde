
int width = 800;
int height = 800;
int sSize = 250;

void setup() {
  background(#000000);
  size(width, height);
  smooth();
}


void draw() {
  float s = map(second(), 0, 59, 0, 360);  
  float h = map(hour(), 0, 24, 0, 360);
  float m = map(minute(), 0, 59, 0, 360);
  background(#000000);
  float sLineAngle = map(second(), 0, 59, 0, 359);

  // base second() flower
  pushMatrix();
  strokeWeight(40);
  stroke(#ffffff);
  translate(width/2, height/2);
  for (int i = 0; i < 60; i++) {
    rotate(radians(i*6));  
    line(0, 0, sSize, 0);
  }
  popMatrix();

  stroke(#FC9E9E);
  line(width/2, height/2, sSize+(sSize*cos(radians(sLineAngle))), sSize+(sSize*sin(radians(sLineAngle))));
  //  noFill();
  //  strokeWeight(40);
  //  color cS = color(map(second(),0,59,0,255), 255, 255);
  //  stroke(cS);
  //  arc(width/2, height/2, 250, 250, radians(0), radians(s));
  //  color cM = color(map(minute(),0,59,0,255), 245, 255);
  //  stroke(cM);
  //  arc(width/2, height/2, 350, 350, radians(0), radians(m)); 
  //  color cH = color(map(hour(),0,24,0,255), 235, 255);
  //  stroke(cH);
  //  arc(width/2, height/2, 450, 450, radians(0), radians(h));
}

