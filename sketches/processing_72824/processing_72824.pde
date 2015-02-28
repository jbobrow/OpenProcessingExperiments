
//Robb Godshaw
//Chaos Vs Order

float
offset = 11;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
  cursor(int(random(0,12)));//fun with random cursor type, won't work online
}

void draw() {
  background(mouse(0, 255));
  fill(255%mouse(0, 255));
  ellipse( width/2, height/2, mouse(0, width), mouse(0, width ) );
  stroke(255%mouse(0, 255));
  strokeCap(SQUARE);
  strokeWeight(mouse(1,10));
  line(mouseX, height, mouseX, height-mouse(0,height));
  noStroke();
}


float mouse(float low, float high) {
  offset = offset + map(mouseX, 0, width, 0.001, 0.009);  
  return (noise(offset) * (high-low)) + low;
}
