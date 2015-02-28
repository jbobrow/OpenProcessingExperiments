
int w = 400;
int face;

void setup() {
frameRate(30);
  background(random(0,255));
  size(w, w);
  rectMode(CENTER);
}

void draw() {
  background(random(0,255));
    NeutralFace();
  faces(Key());
}

int Key() {
  if (key == CODED) {
    if (keyCode == UP) {
      face = 1;
    }
    else if (keyCode == DOWN) {
      face = 2;
    }
  }
  return face;
} //end key

//function devoted to drawing the eyes to save space
void eyes() {
  int ewidth = 28;
  fill(255);
  ellipse(w-225, w-225, ewidth, ewidth);
  ellipse(w-175, w-225, ewidth, ewidth);
  fill(0);
  ellipse(w-225, w-225, 10, 10);
  ellipse(w-175, w-225, 10, 10);
} //end eyes

//the starting face if no keys have been pressed
void NeutralFace() {
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(w/2, w/2, w/2, w/2);
  eyes();
  fill(0);
  rect(w/2, w-165, 100, 10);
} //end NeutralFaces

//the face with a smile
void SmileyFace() {
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(w/2, w/2, w/2, w/2);
  eyes();
  noFill();
  arc(w/2, w-165, 85, 65, 0, PI);
} //end SmileyFace

//the face with a frown
void FrownyFace() {
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(w/2, w/2, w/2, w/2);
  eyes();
  noFill();
  arc(w/2, w-135, 85, 65, PI, TWO_PI);
  //line(w/2, w-165, w-240, w-150);
  //line(w/2, w-165, w-160, w-150);
  //rect(w/2, w-165, 100, 10);
} //end FrownyFace

//the function that changes the faces based on the key presses
void faces(int i) {
  if (i == 1) {
    background(random(0,255));
    SmileyFace();
  }
  if (i == 2) {
    background(random(0,255));
    FrownyFace();
  }
} //end faces
