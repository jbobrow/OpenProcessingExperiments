

void setup() {
  size(400,400);
  smooth();
  frameRate(1);
}
float y=100;
void draw() {
  background(random(0,255));
  for(int i=0; i < width/2; i+=10) {

    rectMode(CENTER);
    rect(200,random(height),200,y);
    rect(i,y,random(width),random(height));

    stroke(random(0,150),0,0);
    noFill();
    fill(i,55);
    translate(random(100,200),height/2);
    strokeWeight(random(0,5));
    if(i>60) {
      rectMode(CORNERS);
      fill(random(0,255));
      fill(i,55);
    }
  }


    }
  


