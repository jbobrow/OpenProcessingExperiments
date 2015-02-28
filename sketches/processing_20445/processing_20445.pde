
 int box = -4;
 
 
void setup() {
  size(300, 600);
  background(255);
 colorMode(HSB,255);
  smooth();
}

void draw() {
noStroke();
fill(0, 0, 0);
 
  box++; 
  rect(box,200,50,50);

delay(100);
float hUE = random(0, 60);
float sAT = random(50,100);
float bRT= random(0,75);

fill(hUE,sAT,bRT,190);
float a = random(10,100);
  
color(random(360), 100, 100);
fill(random(255), 360, 100, 100);
ellipse(random(300), random(100, 500), 50, 50);
}


