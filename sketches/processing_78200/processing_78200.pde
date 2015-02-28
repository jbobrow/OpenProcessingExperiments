
void setup(){size(320, 480);
//background(second()/60*255);
noStroke();
}

void draw(){

for (int i = 0; i < 1; i ++) {
  fill(random(255*second()/60), 255, random(255), 100);
  int r =random(20);
  ellipse(random(320), random(480), 6*r, 6*r);
}

}
