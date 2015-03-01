
PImage monobg;
PImage monofore;

float x;
float y;
float px;
float py;
float easing =.05;
 
void setup() {
  size(600,600);
  smooth();
  noStroke();
  fill(255,255,255); 
  
  monobg = loadImage("monobg.png");
  monofore = loadImage("monofore.png");
  
}

void draw() {
 
background(228,226,219);
image(monobg,0,0);

float targetX = mouseX;
x += (targetX - x) * easing;
float targetY = mouseY;
y += (targetY - y) * easing;
float weight = dist(x, y, px, py);
strokeWeight(weight);
 
py = y;
px = x;

strokeWeight(140);
strokeCap(SQUARE);
if (mousePressed){
  strokeWeight(weight);
stroke(random(20,42),random(56,36),72);
}
line(264,128,264,440);
if (mousePressed){
stroke(random(157),20,random(10,41));
}

image(monofore,0,0);

}



