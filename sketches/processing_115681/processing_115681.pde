
float g,r;

void setup() {
  size(800, 200);
  smooth();
  r = random(0,255);
 
}


void draw(){
  background(255);
  table(-60,45,4);
  table(20,0,1);
  table(100,45,2);
  table(180,0,3);
  table(260,45,4);
  table(340,0,1);
  table(420,45,2);
  table(500,0,3);
  table(580,45,4);
  table(660,0,1);
  g = random(0,225);
 
}

void table(float x, float y, float s) {
  pushMatrix();
  translate(x,y);
  fill(g,g,g);
  strokeWeight(s);
  beginShape();
  vertex(164, 80);
  vertex(164, 90);
  vertex(96, 126); 
  vertex(29, 90);
  vertex(29, 80);
  vertex(96,116);
  vertex(164,80);
  endShape();

  stroke(0);
  beginShape();
  vertex(97, 45);
  vertex(164, 80);
  vertex(96, 116);
  vertex(29, 80);
  vertex(97, 45);
  endShape();

  line(29, 80, 29, 150);
  line(96, 116, 96, 186);
  line(164, 80, 164, 150);
  popMatrix();
}



