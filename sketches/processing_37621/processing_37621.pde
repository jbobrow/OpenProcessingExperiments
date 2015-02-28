
void setup() {
  noLoop();
  size (400, 400);
  background (136, 150, 176);
  smooth();
  noStroke ();
}

void draw() {

  princess(150, 150, 
  random (0, 255), random(0, 255), random(0, 255), 
  random (50, 90), random(20, 40), random(0, 60), 
  30, random (155, 255), random (34, 250));
  princess (250, 150, 
  random (0, 255), random(0, 255), random(0, 255), 
  random (70, 100), random(30, 60), random(0, 60), 
  30, random (55, 100), random (34, 250));
  princess(350, 150, 
  random (0, 255), random(0, 255), random(0, 255), 
  random (50, 90), random(20, 40), random(0, 60), 
  30, random (155, 175), random (134, 250));
}

void princess(int x, int y, 
float dressred, float dressgreen, float dressblue, 
float hairred, float hairgreen, float hairblue, 
float skinr, float sking, float skinb) {

  fill(hairred, hairgreen, hairblue);
  ellipse (x-45, y-45, 80, 120);
  ellipse (x-70, y-25, 50, 50);
  ellipse (x-20, y-30, 60, 65);
  ellipse (x, y-20, 40, 40);
  ellipse (x, y, 30, 30);

  stroke (100);
  strokeWeight (.5);
  colorMode(HSB);
  fill(skinr, sking, skinb);
  pushMatrix();
  translate (x-50, y-55);
  rotate (-50);
  ellipse (0, 0, 40, 60);
  popMatrix();

  noStroke();
  colorMode(RGB);
  ellipse (x-49, y-18, 18, 40);

  fill(hairred, hairgreen, hairblue);
  ellipse (x-40, y-80, 30, 20);

  stroke (100);
  strokeWeight (.5);
  colorMode(HSB);
  fill( skinr, sking, skinb);
  pushMatrix();
  translate (x-80, y-5);
  rotate (-50);
  ellipse (-1, 35, 17, 80);
  ellipse (0, 0, 27, 27);
  popMatrix();

  stroke (100);
  strokeWeight (.5);
  ;
  fill(skinr, sking, skinb);
  pushMatrix();
  translate(x-20, y-5);
  rotate(50);
  ellipse (-1, 35, 17, 80);
  ellipse (0, 0, 30, 30);
  popMatrix();

  noStroke ();
  colorMode(RGB);
  fill(dressred, dressgreen, dressblue);
  ellipse (x-50, y+35, 50, 90);
  ellipse (x-50, y+7, 65, 50);
  ellipse (x-50, y+190, 190, 270);
}
             
                
