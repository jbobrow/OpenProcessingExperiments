
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072
float a=0;
float xW =40; 
float direction =0.5; 

void setup() {
  size (600, 600);
  noStroke();
  smooth();
  colorMode (RGB, 255);
  frameRate(20);
}

void draw() {
  colorMode(RGB, mouseX/(width/255), mouseY/(height/255), 255);

  //draw a square
  a += 0.005; 
  background(#0D1339);
  translate(width/2, width/2); 
  for (int i = 0; i < 20; i++) { 
    rotate(a); 
    fill(50, 50, 50, 100); 
    rect(i, i, xW, xW); 
    xW = xW + direction;

    if (xW > 600) { 
      direction = direction * -0.01;
    } 
    if (xW < 40) { 
      direction = direction * -0.01;
    } 

    if (mousePressed) {
      line(random(0, 250), random(0, 250), 250, 250); 
      stroke(random(255), 10, 10, random(255)); 
      line(random(250, 500), random(0, 250), 250, 250); 
      stroke(10, random(255), 10, random(255)); 
      line(random(0, 250), random(250, 500), 250, 250); 
      stroke(10, 10, random(255), random(255)); 
      line(random(250, 500), random(250, 500), 250, 250); 
      stroke(random(100, 255), 0, random(100, 255), random(255));
    }
  }
}

