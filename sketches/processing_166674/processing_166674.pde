
PImage p1;
void setup() {
  smooth(8);
  background(255);
  size(670, 844);
  p1 = loadImage("");
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



    

PImage p1;


void setup() {
  smooth(8);
  background(255);
  size(500, 500);
  textSize(22);
  p1 = loadImage("graywolf copy.jpg");
  fill(84,232,127);
}
 
void draw() {
 
  {
 
      image(p1, 150, 50);
      textSize(22); 
      text("click to learn more",10,250);
      if (mousePressed) { 

        fill(84,232,127);
         textSize(22); 
      text("We need to protect the Gray Wolf because",50,50);
        textSize(22);
        text("what happens if the gray wolf becomes extinct?", 20, 480);
      }
    }
  }



