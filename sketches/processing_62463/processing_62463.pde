
void setup() {
  size(400, 400);
  frameRate(2);
  background(#E36F9E);
  smooth();
  noStroke();
}
  void draw(){
  float x = random(400);
  float y = random(400);
  conf(x, y);
  }

void conf (float x, float y){
 for (int i=0; i<400; i=i+5){
    float g=random (400);
    fill(#349191);
    stroke(#2131AD);
    strokeWeight(5);
    pushMatrix();
    translate(200, 200);
    rotate(radians(i));
    rect(x-g, y-g, 80, 20);
    popMatrix();
  }
}



