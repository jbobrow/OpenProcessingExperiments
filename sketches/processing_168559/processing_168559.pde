
int time;
int timesince;
float timesince_float;

void setup() {
  size(1000, 600, P2D);
  colorMode(HSB, 100, 100, 100);  
  noStroke();
  background(0);
  ellipseMode(CORNERS);;
  time = millis();
}

void draw() {
timesince = (int)((millis() - time)*0.01);
timesince_float = ((millis() - time)*0.01);
fill(50*sin(timesince_float)+50, 100, 100);
if ((timesince & 1) == 0) {
    filter(ERODE);
  }
pushMatrix();
scale(0.95);
popMatrix();
ellipse(width*sin(0.27*timesince_float)/2 + width/2,height*cos(0.34*timesince_float)/2 + height/2,-width*sin(0.25*timesince_float)/2+width/2,-height*cos(0.38*timesince_float)/2 + height/2);
}
