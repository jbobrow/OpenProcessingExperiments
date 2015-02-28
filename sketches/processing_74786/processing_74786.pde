
int x = 0;
int y = 0;
int squarex = 0;
int squarey = 0;
float r = 255;
float b = 255;
float g = 255;
float a=0;

void setup() {
  size(600, 600);
  background(255);
}

void drawTriangle() {

  translate(width/2, height/2);
  scale(map(mouseY,0, height,0,4));
  if (mousePressed==true) {

    rotate(a+=0.3);
  }
  
  smooth();
  fill(r, b, g);
  noStroke();
  rotate(a+=0.1);
  triangle(0, 0, 50, 50, -50, 50);
}

void circleback() {

  if (x < width) {
    if (y < height) {

      fill (0, 0, 0, 4);
      rect (0, 0, 600, 600);


      smooth();
      stroke(random(255), random(255), random (255));
      fill (random (255), random (255), random (255), 1);
      rect (0, 0, x, y); 

      x = (x+20);
      y = (y+20);
    }
  } 

  if (x == width || y == height) {
    y = 0;
    x = 0;
  }

  /*strokeWeight(10);
   stroke(random(255), random(255), random(255));
   noFill();
   ellipse (width/2, height/2, 200, 200);
   */
}

void square2() {

  if (squarex > -600) {
    if (squarey < height) {

      fill (0, 0, 0, 4);
      rect (0, 0, 600, 600);

      smooth();
      stroke(random(255), random(255), random (255));
      noFill();
      rect (600, 0, -squarex, squarey); 

      squarex = (squarex+20);
      squarey = (squarey+20);
    }
  } 

  if (squarex == width || squarey == height) {
    squarey = 0;
    squarex = 0;
  }

  if (squarex == width || squarey == height) {
    squarey = 0;
    squarex = 0;
  }
}
void draw() { 

  //background(255);
  circleback();
  square2();
  drawTriangle();
}

void keyPressed() {

  if (key == '1') {
    r = 255;
    b = random(100);
    g = random(100);
  }
  if (key == '2') {

    r = random(100);
    b = 255;
    g = random(100);
  }

  if (key == '3') {

    r = random(100);
    b = random(100);
    g = 255;
  }

  if (key == ' ') {

    background(255);
  }
}


