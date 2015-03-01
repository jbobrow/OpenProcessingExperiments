
int time2;
int timesince;
float timesince_float;
int timesince2;
int timesince3;
float r;
float r2;
 
void setup() {
  size(1000, 600, JAVA2D);
  colorMode(HSB, 100, 100, 100);  
  noStroke();
  background(0);
  time2 = millis();
  r = 0;
  r2 = 0;
}
 
void draw() {
  timesince = (int)((millis() - time2)*0.01);
  timesince_float = ((millis() - time2)*0.01);
  timesince2 = (int)((millis() - time2)*0.02);
  timesince3 = (int)((millis() - time2)*0.04);
  if ((timesince2 & 1) == 0) {
filter(ERODE);
  }
  if ((timesince3 & 1) != 0) {
 
  }
  ellipse(width/2, height/2, r, r2);
  if ((timesince & 1) == 0) {
    fill(0);
    r = random(width);
  } else {
    fill(50*sin(timesince_float)+50, 100, 100);
  }
  println(frameRate);
  r2 = random(height);
}
 
void mousePressed() {
  r = width*2;
  r2 = height*2;
  fill(50*sin(timesince_float)+50, 100, 100);
}
 
