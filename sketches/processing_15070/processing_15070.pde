
float x, y; 
float xt, yt; 
float r=50; 

boolean locked = false;

PFont font;
PFont push;

void setup() {
  size(500, 500);
  frameRate(30);
  font = loadFont("ShannonATT-Book-32.vlw");
  push = loadFont("Tahoma-Bold-9.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  background(0);
  smooth();
  noStroke();
  x = 250;
  y = 250;
  xt = 250;
  yt = 100;
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
    if (mousePressed == false) {
     textFont(push);
      fill(0);
      text("P U S H", x, y);}
  
  if (mousePressed == true) {
        fill(255,0,0,120);
              textFont(font);   
   text("p a n i c", xt, yt);
        textFont(push);
     fill(0,200);
      text("P A N I C", x, y);  



  if (abs(mouseX - x) < r &&
      abs(mouseY - y) < r) {
     x = random(245, 255);
    y = random(245, 255);
    r = random(50, 150);
    xt = random(0, 500);
    yt = random(0, 500);


  }}
    fill(255,0,0,50);
    ellipse(x, y,r,r);

      filter(BLUR);
}

