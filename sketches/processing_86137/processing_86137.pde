
//Deborah Koo
//Intro to Computing and the Arts
//Fall 2012
//Project III

//Directions: Click mouse to enlarge images and see what happens...
//The window and enlarging of images take a very long time to load 
//because of the number of images. 
//I apologize.

float angle = 0.0;
float scale = 0.0;
float d = .50;
float r = random(0, 100);
PShape rice1;
PShape rice2;
PShape rice3;
PShape rice4;
PShape rice5;
PShape rice6;
PShape pea1;
PShape broccoli1;
PShape broccoli2;
PShape broccoli3;
PShape shrimp1;
PShape shrimp2;
PShape carrot;
PShape egg;
PShape mushroom;
PShape pepper;


void setup() {
  size(800, 800);
  smooth();
  noStroke();
  rice1 = loadShape("1rice.svg");
  rice2 = loadShape("2rice.svg");
  rice3 = loadShape("3rice.svg");
  rice4 = loadShape("4rice.svg");
  rice5 = loadShape("5rice.svg");
  rice6 = loadShape("6rice.svg");
  pea1 = loadShape("1pea.svg");
  broccoli1 = loadShape("1broccoli.svg");
  broccoli2 = loadShape("2broccoli.svg");
  broccoli3 = loadShape("3broccoli.svg");
  shrimp1 = loadShape("1shrimp.svg");
  shrimp2 = loadShape("2shrimp.svg");
  carrot = loadShape("carrot.svg");
  egg = loadShape("segg.svg");
  mushroom = loadShape("mushroom.svg");
  pepper = loadShape("red.svg");


}

void draw() {
  background(0);
  frameRate(500);
  angle += .5;
  scale += 50;
  scale ((cos(angle / 9.0) + 1.2) * d);


  for (int x = 0; x <= width; x += 10) {
    for (int y = 0; y <= height; y += 10) {
      float r = random(100);  
      rotate(random(PI/r*6));
      shape(rice1, random(width), random(height), 25, 25);
      shape(rice2, random(float(width)), random(float(height)), 30, 30);
      shape(rice3, random(float(width)), random(float(height)), 25, 25);
      shape(rice4, random(width), random(height), 25, 25);
      shape(rice5, random(width), random(height), 25, 25);
      shape(rice6, random(width), random(height), 25, 25);     
    }
    for (int v = 0; v <= width; v += 300) {
      for (int w = 0; w <= height; w += 300) {
        shape(pea1, random(width), random(height), 40, 40);
      }
    for (int a = 0; a <= width; a += 900) {
      for (int b = 0; b <= height; b += 900) {
        shape(broccoli1, random(width), random(height), 90, 90);
        shape(broccoli2, random(width), random(height), 90, 90);
        shape(broccoli3, random(width), random(height), 85, 85);
        shape(shrimp1, random(width), random(height), 90, 90);
        shape(shrimp2, random(width), random(height), 90, 90);
        shape(carrot, random(width), random(height), 60, 60);
        shape(egg, random(width), random(height), 100, 100);
        shape(mushroom, random(width), random(height), 100, 100);
        shape(pepper, random(width), random(height), 140, 140);     
      }      


        }
      }
    }
    }



  void mousePressed() {
  d += d*1.5;
    }






        





