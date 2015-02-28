
int w = 400;
int face;
int YELLOW = color(255, 255, 0);

void setup() {
  //background(255);
  size(w, w);
  rectMode(CENTER);
}

void draw() {
  background(0);
  //starts out as a neutral face, before any button presses
  NeutralFace();
  //changes the faces() based on the value from key()
  faces(Key());
}

//returns a value when a key is pressed or when no keys are pressed
int Key() {
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        face = 1;
      }
      else if (keyCode == DOWN) {
        face = 2;
      }
    }
  }
  else {
    face = 0;
  }
  return face;
} //end key

//function devoted to drawing the eyes to save space
void eyes(int c) {
  int ewidth = 28;
  strokeWeight(1);
  if (c== 0 || c == 1) {
    fill(255);
  }
  if (c==2) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
  }
  ellipse(w-225, w-225, ewidth, ewidth);
  ellipse(w-175, w-225, ewidth, ewidth);
  fill(0);
  stroke(0);
  ellipse(w-225, w-225, 10, 10);
  ellipse(w-175, w-225, 10, 10);
} //end eyes



//the starting face if no keys have been pressed
void NeutralFace() {
  fill(YELLOW);
  stroke(YELLOW);
  ellipse(w/2, w/2, w/2, w/2);
  eyes(Key());
  fill(0);
  stroke(0);
  rect(w/2, w-165, 100, 10);
  strokeWeight(5);
  line(w-215, w-245, w-235, w-245);
  line(w-185, w-245, w-165, w-245);
} //end NeutralFaces

//the face with a smile
void SmileyFace() {
  fill(YELLOW);
  stroke(YELLOW);
  ellipse(w/2, w/2, w/2, w/2);
  eyes(Key());
  fill(255, 150, 150);
  stroke(2550, 150, 150);
  ellipse(w-250, w/2, 30, 20);
  ellipse(w-150, w/2, 30, 20);
  noFill();
  stroke(0);
  strokeWeight(5);
  arc(w/2, w-165, 100, 65, 0, PI);
  line(w-215, w-250, w-235, w-240);
  line(w-185, w-250, w-165, w-240);
} //end SmileyFace

//the face with a frown
void FrownyFace() {
  fill(YELLOW);
  stroke(YELLOW);
  ellipse(w/2, w/2, w/2, w/2);
  eyes(Key());
  noFill();
  strokeWeight(5);
  arc(w/2, w-140, 100, 65, PI, TWO_PI);
  line(w-235, w-252, w-215, w-242);
  line(w-165, w-252, w-185, w-242);
} //end FrownyFace

//the function that changes the faces based on the key presses
void faces(int i) {
  if (i == 0) {
    NeutralFace();
  }
  if (i == 1) {
    //background(0);
    SmileyFace();
  }
  if (i == 2) {
    //background(0);
    FrownyFace();
  }
} //end faces



