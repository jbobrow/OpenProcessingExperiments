
 int box = -4;
 
 
void setup() {
  size(300, 600);
  background(255);
 colorMode(HSB,255);
  smooth();
}

void draw() {
noStroke();
fill(255, 0, 0, 255);
delay(100);
 
  box++; 
  rect(box,150,20,20);

  
color(random(255), 0, 0, 55);
fill(random(255), 0, 0, 55);
ellipse(random(300), random(100, 500), 50, 50);
}


