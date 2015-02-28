
float diam = random(1); 
float linewidth = random(1);

void setup() {
size(700,300);
background(0);
smooth();
frameRate(100);
colorMode(HSB);
}

void draw() {
  //fill(0);
  stroke(10, 40, 40, 70);
  //diam = random(.1, .2); 
  linewidth = random(3, 20);
  //fill(100, 20, 30);
}

void mouseDragged() {
  strokeWeight(linewidth);
  line(mouseX, mouseY, pmouseX, pmouseY);
 //ellipse(mouseX, mouseY, diam, diam);
  
  
  
}

