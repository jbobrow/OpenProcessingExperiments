
int grow = 0;

void setup() {
  size(800, 800);
  background(255);
  smooth();
  noFill();
  frameRate(15);
}

void draw() {
  if (mousePressed) {
    stroke(random(255), random(0), random(155), 60);
    
    float strokeweight = random(55);
    strokeWeight(strokeweight);
    
    float diameter = strokeweight+grow;
    ellipse(mouseX, mouseY, diameter, diameter);
    
    if (grow < 250) grow += 45;
    else 
    if (grow < 250) grow += 20;
    else
    if (grow < 250) grow += 10;
    else
    if (grow < 250) grow += 60;
    else 
    if (grow > 249) grow += 70;
  }
}



void mousePressed() {
  grow = 0;

}
