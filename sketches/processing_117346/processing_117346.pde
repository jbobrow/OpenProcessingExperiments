
PShape gift;
PFont inter;

float angle;


void setup() {
  size(800, 600);
  background(255, 0, 60);
  //dsisplay shapes and fonts
  gift=loadShape("theGift.svg");
  inter=loadFont("Didot-Bold-48.vlw");

  angle=.2;
}
void draw() {

  if (frameCount%3000 == 0) {

    background(random(250), 0, random(150));
  }
  
  pushMatrix();
  translate(width/2, height/2);
  scale(.5);
  shape(gift, 0, 0);
  popMatrix();

  if (frameCount%50 == 0) {

    textFont(inter);
    fill(235);
    pushMatrix();
    rotate(angle);
    text("From the Interdisciplinary Arts Collective", angle, angle);
    popMatrix();

    pushMatrix();
    translate(width, height);
    textFont(inter);
    fill(235);
    rotate(angle);
    text("From the Interdisciplinary Arts Collective", 0, 0);


    popMatrix();
  }


  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  //display text
  textFont(inter);
  fill(random(255), 0, random(150), 80);
  text("From the Interdisciplinary Arts Collective", 0, 0);
  popMatrix();


  angle+=.005;
}



