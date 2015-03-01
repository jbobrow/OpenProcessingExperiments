
PImage p1;
PFont f1;
void setup() {
  smooth(8);
  background(255);
  size(670, 844);
  p1 = loadImage("room.jpg");
  f1 = loadFont("AkzidenzGrotesk.vlw");
  textFont(f1);
  fill(54, 118, 68);
}

void draw() {

  {

      image(p1, 0, 0);
      textFont(f1, 20);
      text("After observation, click and hold.", 100, 100);

      // additonal text and  box appears
      if (mousePressed) {  

        rect(CENTER, 450, 680, width/4);
        noStroke();
        fill(54, 118, 68);
        textFont(f1, 20);
        text("Can you remeber what animal was on the desk?", 100, 125);
      }
    }
  }






