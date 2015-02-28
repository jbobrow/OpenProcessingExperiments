
float x = 50;
float y = 50;
void setup() {
  background(0);
  size(500,500);
  noStroke();
  
}

void draw() {
  color c = color(100,100);
  int m = millis();
  noStroke();
  fill(m%255);
  translate(width/2, height/2);
  rotate(m/2.0);
  rect(x, y, 20, 20);
  x= random(100);
  y= random(100);
  float value = alpha(c);  // Sets 'value' to "0"
  fill(value);

 }



