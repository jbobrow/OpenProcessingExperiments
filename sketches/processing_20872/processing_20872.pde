
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;


void setup(){
  size(640,480);
  smooth();
   one = loadImage("LED-01.png");
   two = loadImage("Phaze2.png");
  three= loadImage("Tri hexa.png");
   four = loadImage("Tri hexa 2.png");
   five= loadImage("Wave 2.png");
   six = loadImage("Phaze.png");
 
  noLoop();
  background(0);
  
}

void draw(){
  float angle = random(0, 360);
  float x = random(0, width);
  float y = random(0, height);
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  
  float r = random(0, 3);
 
  
  r = random(0, 5);
  if (r < 1) { 
    image(one, 0, 0);
  } else if (r < 3) {
    image(two, 0, 0);
  } else if (r < 4) {
    image(four, 0, 0);
  } else if (r < 3) {
    image(five, 0, 0);
    } else if (r < 5) {
      image(six, 0, 0);
    } else if (r < 5) {
    }
  
  popMatrix();  


}

void mousePressed() {
  redraw();
}



