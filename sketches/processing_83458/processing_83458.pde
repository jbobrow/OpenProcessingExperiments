
PImage korea;
PImage park;
PImage moon;
PImage title;
PImage name1;
PImage name2;
PImage circleA; 
PImage circleB; 
PImage type2;
PImage d;
CircleGrow circle1;
CircleGrow circle2;
CircleGrow circle3;
CircleGrow circle4;
CircleGrow circle5;
CircleGrow circle6;
Boolean displayPark = false;


ArrayList newCircles = new ArrayList();


void setup() {
  size(700, 800);
  background (255);
  PImage img;

  circle1 = new CircleGrow(272, 330, 60, 70);
  newCircles.add(circle1);

  circle2 = new CircleGrow(283, 438, 70, 60);
  newCircles.add(circle2);

  circle3 = new CircleGrow(365, 290, 75, 55);
  newCircles.add(circle3);

  circle4 = new CircleGrow(405, 450, 90, 40);
  newCircles.add(circle4);
  
  circle5 = new CircleGrow(270, 555, 30, 93);
  newCircles.add(circle5);
  
  circle6 = new CircleGrow(390, 555, 83, 57);
  newCircles.add(circle6);
  
  korea = loadImage("creative map3.jpg");
  park = loadImage("01.gif");
  moon = loadImage("02.gif");
  title = loadImage("text1.gif");
  name1 = loadImage("name1.gif");
  name2 = loadImage("name2.gif");
  circleA = loadImage("circle1.gif");
  circleB = loadImage("circle2.gif");
  type2 = loadImage("type2.gif");
  d = loadImage("d.gif");



  smooth();
}
void draw() {
  background(255);
  image(korea, 60, 180);
  image(park, 200, 705);
  image(moon, 400, 705);
  image(title, 355, 10);
  image(name1, 213, 680);
  image(name2, 413, 680); 
  image(circleA, 110, 710); 
  image(circleB, 513.5, 710); 
  image(type2, 30, 121);
  image(d, 55, 18);
  


  for (int i = 0; i<newCircles.size(); i += 1) {
    CircleGrow tempCG = (CircleGrow) newCircles.get(i);
    tempCG.display();
  }
}


void mouseClicked() {
  if (dist(mouseX, mouseY, 100, 705) < 100) {
    //200, 705);
    displayPark = true;
  } else if (dist(mouseX, mouseY, 500, 705) < 100){
    displayPark = false;
  }
}

void keyPressed() {

  if (key == 'p') {
    //remove a circleGrow object
    if (newCircles.size() > 0) {
      newCircles.remove(0);
    }
  }
}
class CircleGrow {
  float x;
  float y;
  float circle_radius;
  float parkValue, moonValue;
  CircleGrow(float initial_x, float initial_y, float pValue, float mValue) {
    x = initial_x;
    y = initial_y;
    circle_radius = 50;
    parkValue = pValue;
    moonValue = mValue;
  }
  void display() {
    if (displayPark == true) {
      fill(252, 238, 33);
      noStroke();
      ellipse(x, y, parkValue, parkValue);
    } 
    else {
      fill(229, 0, 140);
      noStroke();
      ellipse(x, y, moonValue, moonValue);
    }
  }
}




